import { useEffect, useMemo } from 'react'
import { useCvMatcher } from '../../contexts/CvMatcherContext'
import type { CvDocument, LlmMatchAssessment } from '../../types/cv'
import { loadCvBatch } from '../../utils/cvFiles'
import { extractKeywords, formatFileSize, rankCvDocuments } from '../../utils/cvMatcher'
import { fetchBackendOllamaStatus, launchBackendOllama, runOllamaBatch } from '../../utils/ollama'

const CvMatcher = () => {
  const TARGET_MODEL = 'mistral'
  const {
    documents, setDocuments,
    keywordInput, setKeywordInput,
    loading, setLoading,
    errors, setErrors,
    ollamaStatus, setOllamaStatus,
    statusLoading, setStatusLoading,
    aiStatus, setAiStatus,
    aiError, setAiError,
    aiResults, setAiResults,
    customInstruction, setCustomInstruction,
    clearAll
  } = useCvMatcher()

  const keywords = useMemo(() => extractKeywords(keywordInput), [keywordInput])
  const rankedResults = useMemo(() => rankCvDocuments(documents, keywords), [documents, keywords])
  const combinedResults = useMemo(
    () => rankedResults.map((result) => ({ result, ai: aiResults[result.id] })),
    [rankedResults, aiResults],
  )

  const refreshStatus = async () => {
    setStatusLoading(true)
    try {
      const status = await fetchBackendOllamaStatus(TARGET_MODEL)
      setOllamaStatus({
        label: status.modelReady
          ? `Modèle ${status.targetModel} prêt`
          : status.online
            ? `Service disponible, modèle à charger`
            : 'Ollama injoignable',
        ready: status.online && status.modelReady,
        raw: status.message,
      })
    } catch (error) {
      setOllamaStatus({
        label: "Impossible de contacter l'API backend",
        ready: false,
        raw: error instanceof Error ? error.message : 'Erreur inconnue',
      })
    } finally {
      setStatusLoading(false)
    }
  }

  useEffect(() => {
    refreshStatus()
  }, [])

  const handleFileChange = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const fileList = event.target.files
    if (!fileList || fileList.length === 0) return
    setLoading(true)
    const { documents: loadedDocs, failures } = await loadCvBatch(fileList)
    setDocuments((current) => {
      const existingKeys = new Set(current.map((doc) => `${doc.name}-${doc.size}`))
      const merged = [...current]
      loadedDocs.forEach((doc) => {
        const key = `${doc.name}-${doc.size}`
        if (!existingKeys.has(key)) {
          merged.push(doc)
        }
      })
      return merged
    })
    setErrors(failures.map((failure) => `${failure.name} : ${failure.reason}`))
    setLoading(false)
    event.target.value = ''
  }

  const handleRunAi = async () => {
    if (documents.length === 0 || keywords.length === 0) {
      setAiError('Ajoutez au moins un CV et un mot-clé pour lancer l’analyse.')
      return
    }
    if (!ollamaStatus?.ready) {
      setAiError('Le modèle IA n’est pas prêt. Lancez la vérification ou le chargement.')
      return
    }
    setAiStatus('running')
    setAiError(null)
    try {
      const { results, failures } = await runOllamaBatch(documents, keywords, {
        model: TARGET_MODEL,
        instructions: customInstruction,
      })
      setAiResults((current) => {
        const next = { ...current }
        results.forEach((assessment) => {
          next[assessment.docId] = assessment
        })
        return next
      })
      if (failures.length > 0) {
        const failureText = failures.map((failure) => `${failure.name} (${failure.error})`).join(', ')
        setAiError(`Impossible d’analyser ${failures.length} CV : ${failureText}`)
      }
    } catch (error) {
      setAiError(error instanceof Error ? error.message : "Erreur inconnue côté IA.")
    } finally {
      setAiStatus('idle')
    }
  }

  const handleRemove = (id: string) => {
    setDocuments((current) => current.filter((doc) => doc.id !== id))
    setAiResults((current) => {
      if (!(id in current)) return current
      const next = { ...current }
      delete next[id]
      return next
    })
  }

  const formatDecisionLabel = (decision: LlmMatchAssessment['decision']) => {
    switch (decision) {
      case 'strong_yes':
        return 'Favorable ++'
      case 'yes':
        return 'Favorable'
      case 'maybe':
        return 'À creuser'
      case 'no':
        return 'Rejeté'
      default:
        return decision
    }
  }

  return (
    <section className="rounded-3xl bg-white p-6 shadow-lg">
      <header className="mb-6">
        <p className="text-xs font-semibold uppercase tracking-[0.2em] text-emerald-500">Assistant IA</p>
        <h2 className="mt-2 text-2xl font-semibold text-slate-900">Triage intelligent des CV</h2>
        <p className="mt-2 text-sm text-slate-600">
          Entrez des mots-clés ou des phrases, importez plusieurs CV (PDF ou texte), et laissez l’IA du navigateur
          calculer ceux qui correspondent le mieux.
        </p>
      </header>

      <div className="grid gap-6 lg:grid-cols-2">
        <div className="flex flex-col gap-3">
          <label htmlFor="keywords" className="text-sm font-medium text-slate-700">
            Mots-clés & expressions (un par ligne ou séparés par des virgules)
          </label>
          <textarea
            id="keywords"
            value={keywordInput}
            onChange={(event) => setKeywordInput(event.target.value)}
            placeholder={'Exemples :\nJava Spring\nGestion de projet\n\"analyse de données\"'}
            rows={6}
            className="w-full rounded-2xl border border-slate-200 p-4 text-sm text-slate-800 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-100"
          />
          {keywords.length > 0 && (
            <p className="text-xs text-slate-500">
              {keywords.length} mot-clé détecté{keywords.length > 1 ? 's' : ''}.
            </p>
          )}
        </div>

        <div className="flex flex-col gap-3">
          <label className="text-sm font-medium text-slate-700">Importer des CV (PDF ou TXT)</label>
          <label className="flex flex-1 cursor-pointer flex-col items-center justify-center gap-3 rounded-2xl border-2 border-dashed border-slate-200 p-6 text-center text-slate-600 hover:border-emerald-400">
            <span className="text-sm font-semibold">Déposer des fichiers ou cliquer pour parcourir</span>
            <input type="file" accept=".pdf,.txt,.md,text/plain,application/pdf" multiple className="hidden" onChange={handleFileChange} />
            <span className="text-xs text-slate-500">Vos fichiers restent localement dans le navigateur.</span>
          </label>
          <div className="flex items-center justify-between text-xs text-slate-500">
            <span>{documents.length} CV chargé{documents.length > 1 ? 's' : ''}</span>
            {documents.length > 0 && (
              <button
                type="button"
                onClick={clearAll}
                className="text-emerald-600 underline-offset-4 hover:underline"
              >
                Effacer tout
              </button>
            )}
          </div>
          {loading && <p className="text-sm text-emerald-600">Lecture des fichiers en cours…</p>}
          {errors.length > 0 && (
            <div className="rounded-2xl border border-amber-200 bg-amber-50 p-4 text-sm text-amber-800">
              <p className="font-medium">Fichiers ignorés</p>
              <ul className="mt-2 list-disc space-y-1 pl-4">
                {errors.map((error) => (
                  <li key={error}>{error}</li>
                ))}
              </ul>
            </div>
          )}
        </div>
      </div>

      {documents.length > 0 && (
        <div className="mt-6 rounded-2xl border border-slate-100 bg-slate-50 p-4">
          <p className="text-sm font-medium text-slate-700">CV importés</p>
          <ul className="mt-3 divide-y divide-slate-200 text-sm text-slate-700">
            {documents.map((doc) => (
              <li key={doc.id} className="flex flex-wrap items-center gap-3 py-2">
                <div className="min-w-0 flex-1">
                  <p className="truncate font-medium">{doc.name}</p>
                  <p className="text-xs text-slate-500">
                    {formatFileSize(doc.size)} • {doc.wordCount} mots • {doc.sourceType === 'pdf' ? 'PDF' : 'Texte'}
                  </p>
                </div>
                <button
                  type="button"
                  onClick={() => handleRemove(doc.id)}
                  className="rounded-full border border-slate-200 px-3 py-1 text-xs text-slate-500 hover:border-red-200 hover:text-red-500"
                >
                  Retirer
                </button>
              </li>
            ))}
          </ul>
        </div>
      )}

      <div className="mt-6 rounded-2xl border border-emerald-100 bg-emerald-50 p-6">
        <div className="flex flex-col gap-4">
          <div>
            <p className="text-xs font-semibold uppercase tracking-widest text-emerald-600">IA locale (optionnel)</p>
            <h3 className="text-lg font-semibold text-emerald-900">Brancher Ollama ou runtime compatible OpenAI</h3>
            <p className="text-sm text-emerald-800">
              Cliquez sur “Vérifier” pour savoir si Ollama tourne. S’il est prêt, vous pourrez lancer l’analyse sans ouvrir un terminal.
            </p>
          </div>
          <div className="flex flex-wrap gap-3">
            <button
              type="button"
              onClick={refreshStatus}
              disabled={statusLoading}
              className="rounded-2xl border border-emerald-600 px-4 py-2 text-sm font-semibold text-emerald-700 disabled:opacity-50"
            >
              {statusLoading ? 'Vérification…' : 'Vérifier l’état d’Ollama'}
            </button>
            <button
              type="button"
              onClick={async () => {
                setStatusLoading(true)
                try {
                  await launchBackendOllama(TARGET_MODEL)
                  await refreshStatus()
                } catch (error) {
                  setOllamaStatus({
                    label: 'Echec du chargement',
                    ready: false,
                    raw: error instanceof Error ? error.message : 'Erreur inconnue',
                  })
                } finally {
                  setStatusLoading(false)
                }
              }}
              className="rounded-2xl bg-emerald-600 px-4 py-2 text-sm font-semibold text-white"
            >
              Lancer / charger Mistral
            </button>
            <button
              type="button"
              onClick={handleRunAi}
              disabled={aiStatus === 'running'}
              className="rounded-2xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white disabled:opacity-50"
            >
              {aiStatus === 'running' ? 'Analyse en cours…' : 'Analyser avec l’IA locale'}
            </button>
          </div>
          <label className="text-sm text-emerald-900">
            Consigne RH à transmettre au modèle (optionnel)
            <textarea
              value={customInstruction}
              onChange={(event) => setCustomInstruction(event.target.value)}
              rows={3}
              placeholder="Ex : privilégier les profils santé numérique, vérifier la maîtrise de l'anglais..."
              className="mt-2 w-full rounded-2xl border border-emerald-200 bg-white p-3 text-sm text-slate-800 focus:border-emerald-600 focus:outline-none"
            />
          </label>
          <div className="flex items-center gap-2 text-sm text-emerald-900">
            <span
              className={`h-3 w-3 rounded-full ${ollamaStatus?.ready ? 'bg-emerald-500' : 'bg-amber-400'}`}
              aria-hidden
            />
            <span>{ollamaStatus?.label ?? 'Statut non vérifié'}</span>
          </div>
          {ollamaStatus?.raw && <p className="text-xs text-emerald-800">{ollamaStatus.raw}</p>}
          {aiError && <p className="rounded-xl bg-white/80 p-3 text-sm text-red-700">{aiError}</p>}
        </div>
      </div>

      <div className="mt-8 rounded-2xl border border-slate-100 p-6">
        <div className="flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
          <div>
            <p className="text-sm font-semibold uppercase tracking-wide text-emerald-500">Classement ia</p>
            <h3 className="text-lg font-semibold text-slate-900">CV recommandés</h3>
            <p className="text-sm text-slate-500">
              Les scores combinent densité de mots-clés, correspondances exactes et couverture globale.
            </p>
          </div>
          <div className="text-xs text-slate-500">
            {keywords.length === 0
              ? 'Indiquez au moins un mot-clé pour lancer l’analyse.'
              : rankedResults.length === 0
                ? 'Ajoutez des CV pour obtenir des recommandations.'
                : `${rankedResults.length} CV analysé${rankedResults.length > 1 ? 's' : ''}.`}
          </div>
        </div>

        {rankedResults.length === 0 ? (
          <p className="mt-4 rounded-2xl border border-dashed border-slate-200 p-4 text-center text-sm text-slate-500">
            Ajoutez des mots-clés et des CV pour démarrer l’analyse.
          </p>
        ) : (
          <div className="mt-6 space-y-4">
            {combinedResults.map(({ result, ai }, index) => (
              <article key={result.id} className="rounded-2xl border border-slate-100 bg-white p-4 shadow-sm">
                <div className="flex flex-wrap items-center justify-between gap-4">
                  <div>
                    <p className="text-xs uppercase tracking-widest text-slate-400">Rang #{index + 1}</p>
                    <h4 className="text-lg font-semibold text-slate-900">{result.name}</h4>
                    <p className="text-xs text-slate-500">
                      Score : <span className="font-semibold text-emerald-600">{result.normalizedScore}/100</span> •
                      Couverture : {result.coverage}%
                    </p>
                  </div>
                  <div className="rounded-xl bg-slate-50 px-4 py-2 text-right">
                    <p className="text-xs text-slate-500">Mots-clés trouvés</p>
                    <p className="text-lg font-semibold text-slate-900">{result.matchedKeywords.length}</p>
                  </div>
                </div>
                {result.matchedKeywords.length > 0 && (
                  <ul className="mt-4 flex flex-wrap gap-2 text-xs">
                    {result.matchedKeywords.map((match) => (
                      <li
                        key={match.keyword}
                        className="rounded-full bg-emerald-50 px-3 py-1 font-medium text-emerald-700"
                      >
                        {match.keyword} ×{match.occurrences}
                      </li>
                    ))}
                  </ul>
                )}
                {result.highlightedSentences.length > 0 && (
                  <div className="mt-4 space-y-2 rounded-xl bg-slate-50 p-3 text-sm text-slate-700">
                    {result.highlightedSentences.map((sentence, sentenceIndex) => (
                      <p key={`${result.id}-sentence-${sentenceIndex}`}>&ldquo;{sentence}&rdquo;</p>
                    ))}
                  </div>
                )}
                {ai && (
                  <div className="mt-4 rounded-2xl border border-emerald-100 bg-emerald-50 p-4 text-sm text-emerald-900">
                    <div className="flex flex-wrap items-center justify-between gap-2">
                      <p className="text-xs font-semibold uppercase tracking-widest text-emerald-600">Avis IA locale</p>
                      <p className="text-xs text-emerald-700">
                        Score LLM : <span className="font-semibold">{ai.score}/100</span> • {formatDecisionLabel(ai.decision)}
                      </p>
                    </div>
                    {ai.summary && <p className="mt-2 font-medium">{ai.summary}</p>}
                    <div className="mt-3 flex flex-wrap gap-4">
                      {ai.strengths.length > 0 && (
                        <div>
                          <p className="text-xs uppercase tracking-widest text-emerald-600">Forces</p>
                          <ul className="mt-1 list-disc pl-4">
                            {ai.strengths.map((item, idx) => (
                              <li key={`${result.id}-strength-${idx}`}>{item}</li>
                            ))}
                          </ul>
                        </div>
                      )}
                      {ai.missingSkills.length > 0 && (
                        <div>
                          <p className="text-xs uppercase tracking-widest text-emerald-600">Manques</p>
                          <ul className="mt-1 list-disc pl-4">
                            {ai.missingSkills.map((item, idx) => (
                              <li key={`${result.id}-gap-${idx}`}>{item}</li>
                            ))}
                          </ul>
                        </div>
                      )}
                      {ai.risks.length > 0 && (
                        <div>
                          <p className="text-xs uppercase tracking-widest text-emerald-600">Risques</p>
                          <ul className="mt-1 list-disc pl-4">
                            {ai.risks.map((item, idx) => (
                              <li key={`${result.id}-risk-${idx}`}>{item}</li>
                            ))}
                          </ul>
                        </div>
                      )}
                    </div>
                  </div>
                )}
              </article>
            ))}
          </div>
        )}
      </div>
    </section>
  )
}

export default CvMatcher
