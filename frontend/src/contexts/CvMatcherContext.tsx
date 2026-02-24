import React, { createContext, useContext, useState, ReactNode } from 'react'
import type { CvDocument, LlmMatchAssessment } from '../types/cv'

interface CvMatcherContextType {
    documents: CvDocument[]
    setDocuments: React.Dispatch<React.SetStateAction<CvDocument[]>>
    keywordInput: string
    setKeywordInput: React.Dispatch<React.SetStateAction<string>>
    loading: boolean
    setLoading: React.Dispatch<React.SetStateAction<boolean>>
    errors: string[]
    setErrors: React.Dispatch<React.SetStateAction<string[]>>
    ollamaStatus: { label: string; ready: boolean; raw?: string } | null
    setOllamaStatus: React.Dispatch<React.SetStateAction<{ label: string; ready: boolean; raw?: string } | null>>
    statusLoading: boolean
    setStatusLoading: React.Dispatch<React.SetStateAction<boolean>>
    aiStatus: 'idle' | 'running'
    setAiStatus: React.Dispatch<React.SetStateAction<'idle' | 'running'>>
    aiError: string | null
    setAiError: React.Dispatch<React.SetStateAction<string | null>>
    aiResults: Record<string, LlmMatchAssessment>
    setAiResults: React.Dispatch<React.SetStateAction<Record<string, LlmMatchAssessment>>>
    customInstruction: string
    setCustomInstruction: React.Dispatch<React.SetStateAction<string>>
    clearAll: () => void
}

const CvMatcherContext = createContext<CvMatcherContextType | undefined>(undefined)

export const CvMatcherProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
    const [documents, setDocuments] = useState<CvDocument[]>([])
    const [keywordInput, setKeywordInput] = useState('')
    const [loading, setLoading] = useState(false)
    const [errors, setErrors] = useState<string[]>([])
    const [ollamaStatus, setOllamaStatus] = useState<{ label: string; ready: boolean; raw?: string } | null>(null)
    const [statusLoading, setStatusLoading] = useState(false)
    const [aiStatus, setAiStatus] = useState<'idle' | 'running'>('idle')
    const [aiError, setAiError] = useState<string | null>(null)
    const [aiResults, setAiResults] = useState<Record<string, LlmMatchAssessment>>({})
    const [customInstruction, setCustomInstruction] = useState('')

    const clearAll = () => {
        setDocuments([])
        setErrors([])
        setAiResults({})
    }

    return (
        <CvMatcherContext.Provider
            value={{
                documents,
                setDocuments,
                keywordInput,
                setKeywordInput,
                loading,
                setLoading,
                errors,
                setErrors,
                ollamaStatus,
                setOllamaStatus,
                statusLoading,
                setStatusLoading,
                aiStatus,
                setAiStatus,
                aiError,
                setAiError,
                aiResults,
                setAiResults,
                customInstruction,
                setCustomInstruction,
                clearAll,
            }}
        >
            {children}
        </CvMatcherContext.Provider>
    )
}

export const useCvMatcher = () => {
    const context = useContext(CvMatcherContext)
    if (context === undefined) {
        throw new Error('useCvMatcher must be used within a CvMatcherProvider')
    }
    return context
}
