import type { CvDocument, KeywordDescriptor, LlmMatchAssessment } from '../types/cv'

export interface OllamaConfig {
  baseUrl: string
  model: string
  temperature?: number
  maxCharacters?: number
}

export interface OllamaFailure {
  docId: string
  name: string
  error: string
}

export interface OllamaBatchResult {
  results: LlmMatchAssessment[]
  failures: OllamaFailure[]
}

const sanitizeBaseUrl = (url: string) => url.replace(/\/$/, '')

const clampScore = (value: number) => {
  if (Number.isNaN(value)) return 0
  return Math.max(0, Math.min(100, value))
}

const pickDecision = (value: string | undefined): LlmMatchAssessment['decision'] => {
  const normalized = (value ?? '').toLowerCase()
  if (normalized.includes('strong')) return 'strong_yes'
  if (normalized === 'yes' || normalized.includes('good')) return 'yes'
  if (normalized.includes('maybe') || normalized.includes('borderline')) return 'maybe'
  if (normalized.includes('no') || normalized.includes('reject')) return 'no'
  return 'maybe'
}

const extractJsonPayload = (content: string) => {
  const trimmed = content.trim()
  const fencedMatch = trimmed.match(/```(?:json)?([\s\S]*?)```/i)
  const candidate = fencedMatch ? fencedMatch[1].trim() : trimmed
  try {
    return JSON.parse(candidate)
  } catch {
    const start = candidate.indexOf('{')
    const end = candidate.lastIndexOf('}')
    if (start !== -1 && end !== -1 && end > start) {
      const fallback = candidate.slice(start, end + 1)
      return JSON.parse(fallback)
    }
    throw new Error('Réponse LLM non JSON.')
  }
}

const buildPrompt = (document: CvDocument, keywords: KeywordDescriptor[], maxCharacters: number) => {
  const keywordList = keywords.length > 0 ? keywords.map((keyword) => keyword.label).join(', ') : 'Aucun mot-clé fourni'
  const excerpt = document.text.slice(0, maxCharacters)

  return `
Tu es un assistant RH spécialisé dans le tri de CV francophones. Compare le CV fourni aux mots-clés indiqués et renvoie uniquement un JSON strict respectant ce schéma :
{
  "score": nombre entier entre 0 et 100,
  "decision": "strong_yes" | "yes" | "maybe" | "no",
  "summary": "phrase courte résumant la candidature",
  "strengths": ["liste de forces concrètes"],
  "missingSkills": ["compétences manquantes liées aux mots-clés"],
  "risks": ["alertes éventuelles telles que manque d'expérience, disponibilité, etc."]
}

Mots-clés à couvrir : ${keywordList}

CV (extrait ${excerpt.length} caractères sur ${document.text.length}) :
"""${excerpt}"""

Ne renvoie que le JSON demandé, aucun texte additionnel.`.trim()
}

const callOllama = async (
  document: CvDocument,
  keywords: KeywordDescriptor[],
  config: Required<OllamaConfig>,
): Promise<LlmMatchAssessment> => {
  const response = await fetch(`${sanitizeBaseUrl(config.baseUrl)}/api/chat`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model: config.model,
      stream: false,
      temperature: config.temperature,
      messages: [
        {
          role: 'system',
          content: 'Tu es un assistant RH fiable qui respecte strictement le format JSON demandé.',
        },
        {
          role: 'user',
          content: buildPrompt(document, keywords, config.maxCharacters),
        },
      ],
    }),
  })

  if (!response.ok) {
    throw new Error(`Appel Ollama échoué (${response.status})`)
  }

  const payload = await response.json()
  const messageContent =
    payload?.message?.content ||
    payload?.response ||
    payload?.choices?.[0]?.message?.content ||
    ''

  if (!messageContent) {
    throw new Error('Réponse LLM vide.')
  }

  const json = extractJsonPayload(messageContent)

  return {
    docId: document.id,
    score: clampScore(typeof json.score === 'number' ? json.score : Number(json.score)),
    decision: pickDecision(json.decision),
    summary: typeof json.summary === 'string' ? json.summary : '',
    strengths: Array.isArray(json.strengths) ? json.strengths.map(String) : [],
    missingSkills: Array.isArray(json.missingSkills) ? json.missingSkills.map(String) : [],
    risks: Array.isArray(json.risks) ? json.risks.map(String) : [],
    rawResponse: messageContent,
  }
}

export const runOllamaBatch = async (
  documents: CvDocument[],
  keywords: KeywordDescriptor[],
  config: OllamaConfig,
): Promise<OllamaBatchResult> => {
  const resolvedConfig: Required<OllamaConfig> = {
    baseUrl: config.baseUrl || 'http://localhost:11434',
    model: config.model || 'mistral',
    temperature: config.temperature ?? 0.2,
    maxCharacters: config.maxCharacters ?? 4000,
  }

  const results: LlmMatchAssessment[] = []
  const failures: OllamaFailure[] = []

  for (const document of documents) {
    try {
      const assessment = await callOllama(document, keywords, resolvedConfig)
      results.push(assessment)
    } catch (error) {
      failures.push({
        docId: document.id,
        name: document.name,
        error: error instanceof Error ? error.message : 'Erreur inconnue',
      })
    }
  }

  return { results, failures }
}
