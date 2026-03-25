import { useEffect, useState } from 'react'
import { formationApi } from '../../utils/metiers.service'
import type { CompetenceSI, Formation } from '../../types/referentiel'

interface Props {
    competence: CompetenceSI
    onClose: () => void
}

export default function FormationModal({ competence, onClose }: Props) {
    const [formations, setFormations] = useState<Formation[]>([])
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)

    useEffect(() => {
        setLoading(true)
        formationApi.getByCompetenceId(competence.id)
            .then(setFormations)
            .catch(() => setError('Erreur lors du chargement des formations'))
            .finally(() => setLoading(false))
    }, [competence.id])

    return (
        <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={onClose}>
            <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl animate-in fade-in zoom-in duration-200" onClick={e => e.stopPropagation()}>
                <div className="flex items-center justify-between mb-6">
                    <div>
                        <h3 className="text-xl font-bold text-slate-900">Formations disponibles</h3>
                        <p className="text-sm text-slate-500 font-medium mt-1">Pour acquérir la compétence : {competence.nom}</p>
                    </div>
                    <button onClick={onClose} className="rounded-full p-2 text-slate-400 hover:bg-slate-100 hover:text-slate-600 transition-colors">✕</button>
                </div>

                <div className="max-h-[60vh] overflow-y-auto pr-2 custom-scrollbar">
                    {loading ? (
                        <div className="flex flex-col items-center justify-center py-12 gap-3">
                            <div className="h-10 w-10 animate-spin rounded-full border-4 border-slate-100 border-t-blue-600" />
                            <p className="text-sm text-slate-500 font-medium">Recherche de formations...</p>
                        </div>
                    ) : error ? (
                        <div className="rounded-xl border border-red-100 bg-red-50 p-4 text-center">
                            <p className="text-sm text-red-600">{error}</p>
                        </div>
                    ) : formations.length > 0 ? (
                        <div className="grid grid-cols-1 gap-3">
                            {formations.map(f => (
                                <div key={f.id} className="group relative rounded-2xl border border-slate-100 bg-slate-50/50 p-4 transition-all hover:border-blue-200 hover:bg-blue-50/50">
                                    <h4 className="font-bold text-slate-900 group-hover:text-blue-700 transition-colors">{f.nom}</h4>
                                    {f.organisme && <p className="text-xs font-semibold text-blue-600 uppercase tracking-wider mt-1">{f.organisme}</p>}
                                    {f.description && <p className="text-sm text-slate-600 mt-2 line-clamp-2">{f.description}</p>}
                                    
                                    {f.url && (
                                        <a 
                                            href={f.url} 
                                            target="_blank" 
                                            rel="noopener noreferrer"
                                            className="mt-4 flex items-center justify-center gap-2 rounded-xl bg-white border border-slate-200 px-4 py-2 text-sm font-bold text-slate-700 shadow-sm transition-all hover:border-blue-300 hover:text-blue-700 hover:shadow"
                                        >
                                            Consulter la formation <span>↗️</span>
                                        </a>
                                    )}
                                </div>
                            ))}
                        </div>
                    ) : (
                        <div className="flex flex-col items-center justify-center py-12 px-4 text-center">
                            <div className="text-4xl mb-4">📚</div>
                            <p className="text-slate-500 font-medium">Aucune formation n'est actuellement répertoriée pour cette compétence.</p>
                            <p className="text-xs text-slate-400 mt-2">Vous pourrez en ajouter prochainement via l'espace de gestion.</p>
                        </div>
                    )}
                </div>

                <div className="mt-8 flex justify-end">
                    <button onClick={onClose} className="rounded-xl px-6 py-2.5 text-sm font-bold text-slate-600 hover:bg-slate-100 transition-colors">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    )
}
