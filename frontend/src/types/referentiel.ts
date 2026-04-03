export type NiveauCompetence = 'Débutant' | 'Intermédiaire' | 'Avancé' | 'Expert'

export const NIVEAUX: NiveauCompetence[] = ['Débutant', 'Intermédiaire', 'Avancé', 'Expert']

// ─────────────────────────────────────────────
// Référentiel Métiers SI
// ─────────────────────────────────────────────
export interface Famille {
  id: number
  nom: string
  description: string
  ordre: number
  icone?: string
}

export interface FamilleOverview {
  familleId: number
  nom: string
  icone?: string
  ordre: number
  metiersTotal: number
  metiersActifs: number
  competencesDistinctes: number
  niveauMoyenRequis: number
}

export interface Metier {
  id: number
  familleId: number
  familleNom?: string
  titre: string
  description?: string
  missionCourte?: string
  actif: boolean
}

export interface Activite {
  id: number
  metierId: number
  libelle: string
  description?: string
  ordre?: number
}

export interface CompetenceSI {
  id: number
  nom: string
  description?: string
}

/** Niveaux SI : 1=Notions, 2=Intermédiaire, 3=Avancé, 4=Expert */
export interface MetierCompetence {
  competenceId: number
  competenceNom: string
  competenceDescription?: string
  niveauRequis: number
  obligatoire: boolean
  ordre?: number
}

export interface Formation {
  id: number
  nom: string
  description?: string
  url?: string
  organisme?: string
  competenceIds: number[]
}

export const NIVEAUX_SI: { value: number; label: string; color: string }[] = [
  { value: 1, label: 'Notions', color: 'bg-slate-100 text-slate-600' },
  { value: 2, label: 'Intermédiaire', color: 'bg-amber-100 text-amber-700' },
  { value: 3, label: 'Avancé', color: 'bg-orange-100 text-orange-700' },
  { value: 4, label: 'Expert', color: 'bg-red-100 text-red-700' },
  { value: 5, label: 'Expert', color: 'bg-red-100 text-red-700' },
]
