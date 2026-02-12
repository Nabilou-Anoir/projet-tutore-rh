import Papa from 'papaparse'
import { SurveyRow } from '../types/survey'

const EMPTY_VALUES = new Set(['', 'null', 'undefined'])

const sanitizeValue = (value: unknown): string | null => {
  if (value === null || value === undefined) return null
  const trimmed = String(value).trim()
  if (EMPTY_VALUES.has(trimmed.toLowerCase())) {
    return null
  }
  return trimmed
}

export const parseCsvFile = (file: File): Promise<SurveyRow[]> => {
  return new Promise((resolve, reject) => {
    Papa.parse<SurveyRow>(file, {
      header: true,
      skipEmptyLines: 'greedy',
      transformHeader: (header) => header.trim(),
      complete: (results) => {
        if (results.errors.length > 0) {
          reject(new Error(results.errors.map((err) => err.message).join('\n')))
          return
        }
        const rows = (results.data ?? []).map((row) => {
          const normalized: SurveyRow = {}
          Object.entries(row).forEach(([key, value]) => {
            const trimmedKey = key.trim()
            if (!trimmedKey) return
            normalized[trimmedKey] = sanitizeValue(value)
          })
          return normalized
        })
        const filtered = rows.filter((row) =>
          Object.values(row).some((value) => typeof value === 'string' && value.trim().length > 0),
        )
        resolve(filtered)
      },
      error: (error) => reject(error),
    })
  })
}
