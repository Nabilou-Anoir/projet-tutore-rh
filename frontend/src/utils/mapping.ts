import { MappingConfig, MultiChoiceMapping, Q3Domain, Q3_DOMAINS, SurveyRow } from '../types/survey'

const STORAGE_KEY = 'limesurvey-mapping'
const SPLIT_REGEX = /[;|,]/
const YES_VALUES = new Set(['1', 'true', 'oui', 'yes', 'y', 'x'])

export const createEmptyMapping = (): MappingConfig => ({
  q3: {},
})

export const loadStoredMapping = (): MappingConfig | null => {
  if (typeof window === 'undefined') return null
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY)
    return raw ? (JSON.parse(raw) as MappingConfig) : null
  } catch (error) {
    console.warn('Impossible de charger le mapping', error)
    return null
  }
}

export const persistMapping = (mapping: MappingConfig) => {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(mapping))
  } catch (error) {
    console.warn('Impossible de sauvegarder le mapping', error)
  }
}

export const extractSingleValue = (row: SurveyRow, column?: string): string | null => {
  if (!column) return null
  const value = row[column]
  if (value === null || value === undefined) return null
  const trimmed = String(value).trim()
  return trimmed.length ? trimmed : null
}

export const extractMultiValues = (row: SurveyRow, mapping?: MultiChoiceMapping): string[] => {
  if (!mapping) return []
  if (mapping.mode === 'single' && mapping.singleColumn) {
    const raw = extractSingleValue(row, mapping.singleColumn)
    if (!raw) return []
    return raw
      .split(mapping.delimiter ?? SPLIT_REGEX)
      .map((value) => value.trim())
      .filter(Boolean)
  }

  if (mapping.mode === 'multi' && mapping.multiColumns?.length) {
    const values: string[] = []
    mapping.multiColumns.forEach((column) => {
      const raw = extractSingleValue(row, column)
      if (!raw) return
      const normalized = raw.toLowerCase()
      if (YES_VALUES.has(normalized)) {
        values.push(column)
      } else if (normalized !== '0' && normalized !== 'non') {
        values.push(raw)
      }
    })
    return values
  }
  return []
}

export interface RankingEntry {
  domain: Q3Domain
  rank: number
}

export const extractRanking = (
  row: SurveyRow,
  q3Mapping?: Partial<Record<Q3Domain, string>>,
): RankingEntry[] => {
  if (!q3Mapping) return []
  const entries: RankingEntry[] = []
  Q3_DOMAINS.forEach((domain) => {
    const column = q3Mapping[domain]
    if (!column) return
    const value = extractSingleValue(row, column)
    if (!value) return
    const rank = Number.parseInt(value, 10)
    if (Number.isNaN(rank)) return
    if (rank >= 1 && rank <= 8) {
      entries.push({ domain, rank })
    }
  })
  return entries
}

export const getAvailableColumns = (rows: SurveyRow[]): string[] => {
  const firstRow = rows[0]
  if (!firstRow) return []
  return Object.keys(firstRow)
}

export const mappingIsReady = (mapping: MappingConfig): boolean => {
  return Boolean(mapping.q1 && mapping.q2 && mapping.q3 && Object.keys(mapping.q3).length)
}
