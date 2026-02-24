import React, { createContext, useContext, useState, ReactNode } from 'react'
import { MappingConfig, SurveyRow } from '../types/survey'

// Mapping automatique basé sur les colonnes du CSV exemple fourni
export const AUTO_MAPPING: MappingConfig = {
  q1: 'Organisation',
  q2: 'Taille',
  q3: {
    'Développement': 'Développement',
    'Architecture logicielle': 'Architecture logicielle',
    'Data / Analyse de données': 'Data / Analyse de données',
    'UX/UI Design': 'UX/UI Design',
    'RGPD / conformité réglementaire': 'RGPD / conformité réglementaire',
    'Cybersécurité': 'Cybersécurité',
    'Infrastructure': 'Infrastructure',
    'Management Projet, déploiement logiciels': 'Management Projet, déploiement logiciels',
  },
  q5: 'Q5',
  q7: { mode: 'single', singleColumn: 'Q7', delimiter: ';' },
  q7bis: { mode: 'single', singleColumn: 'Q7bis', delimiter: ';' },
  q8: 'Q8',
  q8bis: 'Q8bis',
  q9: 'Q9',
  q10: 'Q10',
  q11: { mode: 'single', singleColumn: 'Q11', delimiter: ';' },
  q12: 'Q12',
  q13: { mode: 'single', singleColumn: 'Q13', delimiter: ';' },
}

interface SurveyContextType {
  rows: SurveyRow[]
  columns: string[]
  mapping: MappingConfig
  mappingValidated: boolean
  handleImport: (parsedRows: SurveyRow[], availableColumns: string[]) => void
  clearData: () => void
}

const SurveyContext = createContext<SurveyContextType | undefined>(undefined)

export const SurveyProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [rows, setRows] = useState<SurveyRow[]>([])
  const [columns, setColumns] = useState<string[]>([])
  const [mapping, setMapping] = useState<MappingConfig>(AUTO_MAPPING)
  const [mappingValidated, setMappingValidated] = useState(false)

  const handleImport = (parsedRows: SurveyRow[], availableColumns: string[]) => {
    setRows(parsedRows)
    setColumns(availableColumns)
    setMapping(AUTO_MAPPING)
    setMappingValidated(true)
  }

  const clearData = () => {
    setRows([])
    setColumns([])
    setMapping(AUTO_MAPPING)
    setMappingValidated(false)
  }

  return (
    <SurveyContext.Provider value={{ rows, columns, mapping, mappingValidated, handleImport, clearData }}>
      {children}
    </SurveyContext.Provider>
  )
}

export const useSurvey = () => {
  const context = useContext(SurveyContext)
  if (context === undefined) {
    throw new Error('useSurvey must be used within a SurveyProvider')
  }
  return context
}
