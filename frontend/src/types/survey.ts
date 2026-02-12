export type SurveyRow = Record<string, string | null | undefined>

export const Q3_DOMAINS = [
  'Développement',
  'Architecture logicielle',
  'Data / Analyse de données',
  'UX/UI Design',
  'RGPD / conformité réglementaire',
  'Cybersécurité',
  'Infrastructure',
  'Management Projet, déploiement logiciels',
] as const

export type Q3Domain = (typeof Q3_DOMAINS)[number]

export type MultiChoiceMode = 'single' | 'multi'

export interface MultiChoiceMapping {
  mode: MultiChoiceMode
  singleColumn?: string
  multiColumns?: string[]
  delimiter?: string
}

export interface MappingConfig {
  q1?: string
  q2?: string
  q3?: Partial<Record<Q3Domain, string>>
  q5?: string
  q7?: MultiChoiceMapping
  q7bis?: MultiChoiceMapping
  q8?: string
  q8bis?: string
  q9?: string
  q10?: string
  q11?: MultiChoiceMapping
  q12?: string
  q13?: MultiChoiceMapping
}

export interface DomainScore {
  domain: Q3Domain
  score: number
  responses: number
}

export interface Aggregates {
  warnings: string[]
  generalInfo: {
    q1Distribution: Record<string, number>
    q2Distribution: Record<string, number>
    totalResponses: number
  }
  skills: {
    q3Scores: DomainScore[]
    q3Top3: DomainScore[]
    topDomain?: DomainScore
    q5Responses: string[]
  }
  certifications: {
    q8Distribution: Record<string, number>
    q7Counts: Record<string, number>
    q7Other: string[]
    q7bisCounts: Record<string, number>
    q7bisOther: string[]
    q8bisDistribution: Record<string, number>
  }
  recruitment: {
    q9List: string[]
    q10List: string[]
    q11Distribution: Record<string, number>
  }
  perspectives: {
    q12List: string[]
    q13Distribution: Record<string, number>
  }
}
