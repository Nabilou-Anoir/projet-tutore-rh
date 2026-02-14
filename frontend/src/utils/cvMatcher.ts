import type { CvDocument, CvMatchResult, KeywordDescriptor } from '../types/cv'

const STOP_WORDS = new Set([
  'the',
  'and',
  'for',
  'with',
  'les',
  'des',
  'une',
  'dans',
  'sur',
  'par',
  'aux',
  'vos',
  'notre',
  'vous',
  'nous',
  'this',
  'that',
  'from',
  'avec',
  'pour',
  'est',
  'sont',
  'entre',
  'chez',
  'afin',
  'être',
  'avoir',
])

const normalize = (value: string) =>
  value
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .trim()

const tokenize = (text: string) =>
  text
    .split(/[^a-z0-9]+/)
    .map((token) => token.trim())
    .filter(Boolean)

export const extractKeywords = (input: string): KeywordDescriptor[] => {
  const parts = input
    .split(/[\n,;]+/)
    .map((segment) => segment.trim())
    .filter(Boolean)

  const seen = new Set<string>()
  const keywords: KeywordDescriptor[] = []

  parts.forEach((label) => {
    const normalized = normalize(label)
    if (!normalized || seen.has(normalized)) return
    seen.add(normalized)
    const tokens = tokenize(normalized).filter((token) => token.length > 1 && !STOP_WORDS.has(token))
    keywords.push({ label, normalized, tokens })
  })
  return keywords
}

const countOccurrences = (haystack: string, needle: string) => {
  if (!needle) return 0
  let count = 0
  let index = haystack.indexOf(needle)
  while (index !== -1) {
    count += 1
    index = haystack.indexOf(needle, index + needle.length)
  }
  return count
}

const buildKeywordMatches = (normalizedText: string, keywords: KeywordDescriptor[]) => {
  const matches = keywords
    .map((keyword) => {
      const occurrences = countOccurrences(normalizedText, keyword.normalized)
      return { keyword: keyword.label, normalized: keyword.normalized, occurrences, tokenCount: keyword.tokens.length }
    })
    .filter((match) => match.occurrences > 0)
  return matches
}

const pickHighlightSentences = (text: string, keywords: KeywordDescriptor[]) => {
  if (keywords.length === 0) return []
  const normalizedKeywords = keywords.map((keyword) => keyword.normalized)
  const sentences = text
    .split(/(?<=[.!?])\s+|\n+/)
    .map((sentence) => sentence.trim())
    .filter(Boolean)

  const highlights: string[] = []
  for (const sentence of sentences) {
    const normalizedSentence = normalize(sentence)
    if (normalizedKeywords.some((needle) => normalizedSentence.includes(needle))) {
      highlights.push(sentence)
    }
    if (highlights.length === 3) break
  }
  return highlights
}

export const rankCvDocuments = (documents: CvDocument[], keywords: KeywordDescriptor[]): CvMatchResult[] => {
  if (documents.length === 0) return []

  const keywordTokens = new Set<string>()
  keywords.forEach((keyword) => keyword.tokens.forEach((token) => keywordTokens.add(token)))

  return documents
    .map((document) => {
      const normalizedText = normalize(document.text)
      const tokens = tokenize(normalizedText)
      const totalTokens = tokens.length || 1

      const frequency = tokens.reduce<Map<string, number>>((map, token) => {
        const current = map.get(token) ?? 0
        map.set(token, current + 1)
        return map
      }, new Map())

      let tokenScore = 0
      keywordTokens.forEach((token) => {
        const occurrences = frequency.get(token)
        if (occurrences) {
          tokenScore += occurrences
        }
      })

      const keywordMatches = buildKeywordMatches(normalizedText, keywords)
      const phraseScore = keywordMatches.reduce(
        (sum, match) => sum + match.occurrences * Math.max(match.tokenCount, 1),
        0,
      )

      const coverage = keywords.length > 0 ? keywordMatches.length / keywords.length : 0

      const tokenContribution = Math.min(1, tokenScore / 20)
      const phraseContribution = Math.min(1, phraseScore / 8)
      const coverageContribution = Math.min(1, coverage)
      const compositeScore = tokenContribution * 0.55 + phraseContribution * 0.25 + coverageContribution * 0.2
      const normalizedScore = Number((compositeScore * 100).toFixed(2))

      return {
        ...document,
        score: compositeScore,
        normalizedScore,
        coverage: Number((coverageContribution * 100).toFixed(2)),
        matchedKeywords: keywordMatches.map((match) => ({
          keyword: match.keyword,
          occurrences: match.occurrences,
        })),
        highlightedSentences: pickHighlightSentences(document.text, keywords),
      }
    })
    .sort((a, b) => b.score - a.score)
}

export const formatFileSize = (size: number) => {
  if (size < 1024) return `${size} o`
  if (size < 1024 * 1024) return `${(size / 1024).toFixed(1)} Ko`
  return `${(size / (1024 * 1024)).toFixed(1)} Mo`
}
