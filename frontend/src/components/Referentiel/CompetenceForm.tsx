import { useState } from 'react'
import { NIVEAUX, type NiveauCompetence } from '../../types/referentiel'

interface Props {
    domaineId: number
    domaineName: string
    onClose: () => void
    onSave: (data: { nom: string; description: string; niveauAttendu: string; domaineId: number }) => void
    initial?: { nom: string; description: string; niveauAttendu: string }
}

const CompetenceForm = ({ domaineId, domaineName, onClose, onSave, initial }: Props) => {
    const [nom, setNom] = useState(initial?.nom ?? '')
    const [description, setDescription] = useState(initial?.description ?? '')
    const [niveauAttendu, setNiveauAttendu] = useState<NiveauCompetence>((initial?.niveauAttendu as NiveauCompetence) ?? 'Intermédiaire')

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault()
        if (!nom.trim()) return
        onSave({ nom, description, niveauAttendu, domaineId })
    }

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={onClose}>
            <div
                className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl animate-in"
                onClick={(e) => e.stopPropagation()}
                style={{ animation: 'slideUp 0.3s ease-out' }}
            >
                <h3 className="mb-1 text-lg font-bold text-slate-900">
                    {initial ? 'Modifier la compétence' : 'Nouvelle compétence'}
                </h3>
                <p className="mb-5 text-sm text-slate-500">Domaine : {domaineName}</p>
                <form onSubmit={handleSubmit} className="flex flex-col gap-4">
                    <div>
                        <label className="mb-1 block text-sm font-medium text-slate-700">Nom *</label>
                        <input
                            type="text"
                            value={nom}
                            onChange={(e) => setNom(e.target.value)}
                            placeholder="Ex : DevOps CI/CD"
                            required
                            className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                        />
                    </div>
                    <div>
                        <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                        <textarea
                            value={description}
                            onChange={(e) => setDescription(e.target.value)}
                            placeholder="Décrivez cette compétence…"
                            rows={3}
                            className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                        />
                    </div>
                    <div>
                        <label className="mb-1 block text-sm font-medium text-slate-700">Niveau attendu</label>
                        <div className="flex flex-wrap gap-2">
                            {NIVEAUX.map((n) => (
                                <button
                                    key={n}
                                    type="button"
                                    onClick={() => setNiveauAttendu(n)}
                                    className={`rounded-full px-3 py-1.5 text-xs font-medium transition-all ${niveauAttendu === n
                                            ? 'bg-sky-100 text-sky-700 ring-2 ring-sky-300'
                                            : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                                        }`}
                                >
                                    {n}
                                </button>
                            ))}
                        </div>
                    </div>
                    <div className="flex justify-end gap-3 pt-2">
                        <button
                            type="button"
                            onClick={onClose}
                            className="rounded-xl px-4 py-2 text-sm font-medium text-slate-600 hover:bg-slate-100 transition-colors"
                        >
                            Annuler
                        </button>
                        <button
                            type="submit"
                            className="rounded-xl px-5 py-2 text-sm font-semibold text-white shadow-md transition-all hover:shadow-lg active:scale-95"
                            style={{ background: 'linear-gradient(135deg, #3299CC, #2575A8)' }}
                        >
                            {initial ? 'Enregistrer' : 'Ajouter'}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    )
}

export default CompetenceForm
