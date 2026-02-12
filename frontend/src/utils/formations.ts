import data from '../data/referentielFormations.json'
import { Q3Domain } from '../types/survey'

export interface Formation {
  label: string
  url: string
  organisme?: string
}

export type FormationReferential = Record<Q3Domain, Formation[]>

export const formations = data as FormationReferential

const normalize = (value: string) =>
  value
    .normalize('NFD')
    .replace(/[^\p{L}\p{N}]+/gu, '-')
    .replace(/-+/g, '-')
    .replace(/(^-|-$)/g, '')
    .toLowerCase()

export const domainToSlug = (domain: Q3Domain) => normalize(domain)

export const slugToDomain = (slug: string): Q3Domain | undefined =>
  (Object.keys(formations) as Q3Domain[]).find((domain) => domainToSlug(domain) === slug)
