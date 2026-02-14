export type CvSourceType = 'pdf' | 'text' | 'unknown'

export interface CvDocument {
  id: string
  name: string
  size: number
  text: string
  sourceType: CvSourceType
  wordCount: number
  createdAt: number
}

export interface KeywordDescriptor {
  label: string
  normalized: string
  tokens: string[]
}

export interface CvMatchResult extends CvDocument {
  score: number
  normalizedScore: number
  coverage: number
  matchedKeywords: {
    keyword: string
    occurrences: number
  }[]
  highlightedSentences: string[]
}
