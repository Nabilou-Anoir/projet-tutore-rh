import { useMemo, useState } from 'react'
import type { CvDocument } from '../../types/cv'
import { loadCvBatch } from '../../utils/cvFiles'
import { extractKeywords, formatFileSize, rankCvDocuments } from '../../utils/cvMatcher'

const CvMatcher = () => {
  const [documents, setDocuments] = useState<CvDocument[]>([])
  const [keywordInput, setKeywordInput] = useState('')
  const [loading, setLoading] = useState(false)
  const [errors, setErrors] = useState<string[]>([])

  const keywords = useMemo(() => extractKeywords(keywordInput), [keywordInput])
  const rankedResults = useMemo(() => rankCvDocuments(documents, keywords), [documents, keywords])

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

  const handleRemove = (id: string) => {
    setDocuments((current) => current.filter((doc) => doc.id !== id))
  }

  const handleClearAll = () => {
    setDocuments([])
    setErrors([])
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
                onClick={handleClearAll}
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
            {rankedResults.map((result, index) => (
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
              </article>
            ))}
          </div>
        )}
      </div>
    </section>
  )
}

export default CvMatcher
