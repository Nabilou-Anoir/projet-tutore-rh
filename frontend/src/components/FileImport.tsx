import { useState } from 'react'
import { parseCsvFile } from '../utils/csv'
import { getAvailableColumns } from '../utils/mapping'
import { SurveyRow } from '../types/survey'

interface FileImportProps {
  onImport: (rows: SurveyRow[], columns: string[]) => void
}

const FileImport = ({ onImport }: FileImportProps) => {
  const [error, setError] = useState<string | null>(null)
  const [count, setCount] = useState<number>(0)
  const [loading, setLoading] = useState(false)

  const handleFileChange = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0]
    if (!file) return
    setLoading(true)
    setError(null)
    try {
      const rows = await parseCsvFile(file)
      const columns = getAvailableColumns(rows)
      onImport(rows, columns)
      setCount(rows.length)
    } catch (err) {
      console.error(err)
      setError(err instanceof Error ? err.message : 'Impossible de lire le CSV')
    } finally {
      setLoading(false)
    }
  }

  return (
    <section className="rounded-2xl bg-white p-6 shadow-lg">
      <header className="mb-4">
        <h2 className="text-xl font-semibold text-slate-900">Importer un CSV LimeSurvey</h2>
        <p className="text-sm text-slate-500">
          Les données restent sur votre machine. Utilisez l\'export CSV natif de LimeSurvey.
        </p>
      </header>
      <label className="flex flex-col gap-3 rounded-xl border-2 border-dashed border-slate-200 p-6 text-center text-slate-600 hover:border-emerald-400">
        <span className="font-medium">Déposer un fichier CSV ou cliquer pour sélectionner</span>
        <input type="file" accept=".csv,text/csv" className="hidden" onChange={handleFileChange} />
      </label>
      {loading && <p className="mt-4 text-sm text-emerald-600">Chargement du fichier...</p>}
      {count > 0 && !loading && (
        <p className="mt-4 rounded-lg bg-emerald-50 px-4 py-3 text-sm text-emerald-800">
          {count} réponses importées.
        </p>
      )}
      {error && (
        <p className="mt-4 rounded-lg bg-red-50 px-4 py-3 text-sm text-red-700">
          Erreur lors de l\'import : {error}
        </p>
      )}
    </section>
  )
}

export default FileImport
