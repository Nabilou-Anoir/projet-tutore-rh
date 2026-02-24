import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import type { Competence, FormationRef } from '../types/referentiel'
import FormationForm from '../components/Referentiel/FormationForm'

const API = '/rest'

const NIVEAU_COLORS: Record<string, string> = {
    'Débutant': 'bg-emerald-100 text-emerald-700',
    'Intermédiaire': 'bg-amber-100 text-amber-700',
    'Avancé': 'bg-orange-100 text-orange-700',
    'Expert': 'bg-red-100 text-red-700',
}

const CompetenceDetailPage = () => {
    const { id } = useParams<{ id: string }>()
    const navigate = useNavigate()
    const [competence, setCompetence] = useState<Competence | null>(null)
    const [loading, setLoading] = useState(true)
    const [showFormationForm, setShowFormationForm] = useState(false)

    const fetchCompetence = () => {
        setLoading(true)
        fetch(`${API}/competences/${id}`)
            .then((r) => r.json())
            .then((data) => { setCompetence(data); setLoading(false) })
            .catch(() => setLoading(false))
    }

    useEffect(() => { if (id) fetchCompetence() }, [id])

    const handleAddFormation = (data: any) => {
        fetch(`${API}/formations`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
        })
            .then((r) => r.json())
            .then((formation: FormationRef) => {
                return fetch(`${API}/competences/${id}/formations/${formation.id}`, { method: 'POST' })
            })
            .then(() => {
                fetchCompetence();
                setShowFormationForm(false);
            })
            .catch(err => {
                console.error("Erreur lors de l'ajout de la formation:", err);
            })
    }

    const handleUnlinkFormation = (formationId: number) => {
        fetch(`${API}/competences/${id}/formations/${formationId}`, { method: 'DELETE' })
            .then(() => fetchCompetence())
    }

    if (loading) {
        return (
            <div className="flex min-h-screen items-center justify-center">
                <div className="h-8 w-8 animate-spin rounded-full border-4 border-sky-200 border-t-sky-600" />
            </div>
        )
    }

    if (!competence) {
        return (
            <div className="mx-auto flex min-h-screen max-w-4xl flex-col items-center justify-center gap-4 px-4 text-center">
                <p className="text-lg font-semibold">Compétence introuvable</p>
                <button className="rounded-xl bg-slate-900 px-4 py-2 text-sm text-white" onClick={() => navigate('/referentiel')}>
                    Retour au référentiel
                </button>
            </div>
        )
    }

    return (
        <div className="mx-auto flex max-w-4xl flex-col gap-6 px-4 py-8 min-h-screen">
            <button
                onClick={() => navigate('/referentiel')}
                className="self-start rounded-xl bg-slate-100 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-200 transition-colors"
            >
                ← Retour au référentiel
            </button>

            {/* Competence header */}
            <div className="rounded-2xl border border-slate-100 bg-white p-6 shadow-sm">
                <div className="flex items-center gap-3 mb-3">
                    <h1 className="text-2xl font-bold text-slate-900">{competence.nom}</h1>
                    <span className={`rounded-full px-3 py-1 text-xs font-medium ${NIVEAU_COLORS[competence.niveauAttendu] ?? 'bg-slate-100 text-slate-600'}`}>
                        {competence.niveauAttendu}
                    </span>
                </div>
                {competence.description && (
                    <p className="text-slate-600">{competence.description}</p>
                )}
            </div>

            {/* Formations section */}
            <div className="rounded-2xl border border-slate-100 bg-white p-6 shadow-sm">
                <div className="flex items-center justify-between mb-4">
                    <h2 className="text-lg font-bold text-slate-900">
                        Formations associées ({competence.formations?.length ?? 0})
                    </h2>
                    <button
                        onClick={() => setShowFormationForm(true)}
                        className="flex items-center gap-1.5 rounded-xl bg-emerald-50 px-4 py-2 text-sm font-semibold text-emerald-700 hover:bg-emerald-100 transition-colors"
                    >
                        + Ajouter une formation
                    </button>
                </div>

                {(!competence.formations || competence.formations.length === 0) && (
                    <div className="rounded-xl border border-dashed border-slate-200 px-6 py-10 text-center">
                        <span className="text-4xl mb-3 block">📚</span>
                        <p className="text-sm text-slate-500">Aucune formation liée à cette compétence.</p>
                    </div>
                )}

                <div className="flex flex-col gap-3">
                    {competence.formations?.map((f) => (
                        <div key={f.id} className="rounded-xl border border-slate-200 bg-slate-50 p-4 transition-all hover:shadow-sm">
                            <div className="flex items-start justify-between">
                                <div className="flex-1">
                                    <div className="flex items-center gap-2 mb-1">
                                        <h3 className="font-semibold text-slate-900">{f.name}</h3>
                                        {f.certifiant && (
                                            <span className="rounded-full bg-emerald-100 px-2 py-0.5 text-xs font-medium text-emerald-700">
                                                ✓ Certifiant
                                            </span>
                                        )}
                                    </div>
                                    {f.description && <p className="text-sm text-slate-600 mb-2">{f.description}</p>}
                                    <div className="flex items-center gap-3 text-xs text-slate-500">
                                        {f.organisme && (
                                            <span className="flex items-center gap-1">
                                                🏢 {f.organisme}
                                            </span>
                                        )}
                                        {f.duree && (
                                            <span className="flex items-center gap-1">
                                                ⏱️ {f.duree}
                                            </span>
                                        )}
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 ml-4">
                                    <a
                                        href={f.url}
                                        target="_blank"
                                        rel="noreferrer"
                                        className="rounded-xl px-4 py-2 text-sm font-semibold text-white no-underline shadow-sm transition-all hover:shadow-md active:scale-95"
                                        style={{ background: 'linear-gradient(135deg, #3299CC, #2575A8)' }}
                                    >
                                        Consulter ↗
                                    </a>
                                    <button
                                        onClick={() => handleUnlinkFormation(f.id)}
                                        className="rounded-lg p-1.5 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors"
                                        title="Retirer cette formation"
                                    >
                                        🗑️
                                    </button>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </div>

            {/* Formation Form Modal */}
            {showFormationForm && (
                <FormationForm
                    onClose={() => setShowFormationForm(false)}
                    onSave={handleAddFormation}
                />
            )}
        </div>
    )
}

export default CompetenceDetailPage
