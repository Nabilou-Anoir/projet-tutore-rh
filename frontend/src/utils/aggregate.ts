import { Aggregates, DomainScore, MappingConfig, Q3_DOMAINS, SurveyRow } from '../types/survey'
import { extractMultiValues, extractRanking, extractSingleValue } from './mapping'

const increment = (record: Record<string, number>, key: string) => {
  if (!key) return
  record[key] = (record[key] ?? 0) + 1
}

const KNOWN_Q7 = [
  'dpo / rgpd',
  'pmp / pspo / gestion de projet',
  'cloud (aws, azure, gcp)',
  'istqb',
  'oracle',
]

const KNOWN_Q7BIS = ['fihr', 'hds', 'iso 27001', 'secnumcloud']
const KNOWN_Q11 = [
  'formations courtes',
  'formations longues diplômantes',
  'formation en situation de travail / apprentissage interne',
]
const KNOWN_Q13 = [
  'référentiel commun des métiers et compétences',
  'plateforme mutualisée de suivi des compétences',
  'dispositifs de formation partagés',
]

const classifyValue = (value: string, known: string[], others?: string[]): string => {
  const normalized = value.trim()
  if (!normalized) return 'Autres'
  const lower = normalized.toLowerCase()
  const match = known.find((label) => lower === label)
  if (match) {
    return match
  }
  others?.push(normalized)
  return 'Autres'
}

export const calculateAggregates = (rows: SurveyRow[], mapping: MappingConfig): Aggregates => {
  const generalInfo = {
    q1Distribution: {} as Record<string, number>,
    q2Distribution: {} as Record<string, number>,
    totalResponses: rows.length,
  }

  const skillsScores = new Map<string, { score: number; responses: number }>()
  Q3_DOMAINS.forEach((domain) => skillsScores.set(domain, { score: 0, responses: 0 }))
  const q5Responses: string[] = []

  const certifications = {
    q8Distribution: {} as Record<string, number>,
    q7Counts: {} as Record<string, number>,
    q7Other: [] as string[],
    q7bisCounts: {} as Record<string, number>,
    q7bisOther: [] as string[],
    q8bisDistribution: {} as Record<string, number>,
  }

  const recruitment = {
    q9List: [] as string[],
    q10List: [] as string[],
    q11Distribution: {} as Record<string, number>,
  }

  const perspectives = {
    q12List: [] as string[],
    q13Distribution: {} as Record<string, number>,
  }

  rows.forEach((row) => {
    const q1Value = extractSingleValue(row, mapping.q1)
    if (q1Value) increment(generalInfo.q1Distribution, q1Value)

    const q2Value = extractSingleValue(row, mapping.q2)
    if (q2Value) increment(generalInfo.q2Distribution, q2Value)

    const rankingEntries = extractRanking(row, mapping.q3)
    rankingEntries.forEach(({ domain, rank }) => {
      const entry = skillsScores.get(domain)
      if (!entry) return
      entry.score += 9 - rank
      entry.responses += 1
    })

    const q5 = extractSingleValue(row, mapping.q5)
    if (q5) q5Responses.push(q5)

    const q8 = extractSingleValue(row, mapping.q8)
    if (q8) increment(certifications.q8Distribution, q8)

    const q7Values = extractMultiValues(row, mapping.q7)
    q7Values.forEach((value) => {
      const bucket = classifyValue(value, KNOWN_Q7, certifications.q7Other)
      increment(certifications.q7Counts, bucket)
    })

    const q7bisValues = extractMultiValues(row, mapping.q7bis)
    q7bisValues.forEach((value) => {
      const bucket = classifyValue(value, KNOWN_Q7BIS, certifications.q7bisOther)
      increment(certifications.q7bisCounts, bucket)
    })

    const q8bis = extractSingleValue(row, mapping.q8bis)
    if (q8bis) increment(certifications.q8bisDistribution, q8bis)

    const q9 = extractSingleValue(row, mapping.q9)
    if (q9) recruitment.q9List.push(q9)

    const q10 = extractSingleValue(row, mapping.q10)
    if (q10) recruitment.q10List.push(q10)

    const q11Values = extractMultiValues(row, mapping.q11)
    q11Values.forEach((value) => {
      const bucket = classifyValue(value, KNOWN_Q11)
      increment(recruitment.q11Distribution, bucket)
    })

    const q12 = extractSingleValue(row, mapping.q12)
    if (q12) perspectives.q12List.push(q12)

    const q13Values = extractMultiValues(row, mapping.q13)
    q13Values.forEach((value) => {
      const bucket = classifyValue(value, KNOWN_Q13)
      increment(perspectives.q13Distribution, bucket)
    })
  })

  const q3Scores: DomainScore[] = Array.from(skillsScores.entries()).map(([domain, entry]) => ({
    domain: domain as Q3Domain,
    score: entry.score,
    responses: entry.responses,
  }))

  q3Scores.sort((a, b) => b.score - a.score)

  const warnings: string[] = []
  if (!mapping.q3) {
    warnings.push("Aucune colonne n'est mappée pour la question Q3 (classement des domaines).")
  } else {
    const missing = Q3_DOMAINS.filter((domain) => !mapping.q3?.[domain])
    if (missing.length) {
      warnings.push(`Colonnes manquantes pour Q3 : ${missing.join(', ')}.`)
    }
  }

  return {
    warnings,
    generalInfo,
    skills: {
      q3Scores,
      q3Top3: q3Scores.slice(0, 3),
      topDomain: q3Scores[0]?.score ? q3Scores[0] : undefined,
      q5Responses,
    },
    certifications,
    recruitment,
    perspectives,
  }
}
