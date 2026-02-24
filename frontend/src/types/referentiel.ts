export interface DomaineCompetence {
  id: number
  nom: string
  description: string
  icone: string
  competences: Competence[]
}

export interface Competence {
  id: number
  nom: string
  description: string
  niveauAttendu: string
  domaineId: number
  formations: FormationRef[]
}

export interface FormationRef {
  id: number
  name: string
  description: string
  url: string
  organisme: string
  duree: string
  certifiant: boolean
  domain: string
}

export type NiveauCompetence = 'Débutant' | 'Intermédiaire' | 'Avancé' | 'Expert'

export const NIVEAUX: NiveauCompetence[] = ['Débutant', 'Intermédiaire', 'Avancé', 'Expert']
