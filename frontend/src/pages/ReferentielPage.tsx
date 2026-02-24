import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import type { DomaineCompetence, Competence, FormationRef } from '../types/referentiel'
import CompetenceForm from '../components/Referentiel/CompetenceForm'
import FormationForm from '../components/Referentiel/FormationForm'

const API = '/rest'

const NIVEAU_COLORS: Record<string, string> = {
    'Débutant': 'bg-emerald-100 text-emerald-700',
    'Intermédiaire': 'bg-amber-100 text-amber-700',
    'Avancé': 'bg-orange-100 text-orange-700',
    'Expert': 'bg-red-100 text-red-700',
}

const ReferentielPage = () => {
    const [domaines, setDomaines] = useState<DomaineCompetence[]>([])
    const [loading, setLoading] = useState(true)
    const [expandedDomaine, setExpandedDomaine] = useState<number | null>(null)
    const [showCompetenceForm, setShowCompetenceForm] = useState<number | null>(null)
    const [showFormationForm, setShowFormationForm] = useState<{ competenceId: number; domaineName: string } | null>(null)
    const [showDomaineForm, setShowDomaineForm] = useState(false)
    const [newDomaine, setNewDomaine] = useState({ nom: '', description: '', icone: '📁' })
    const [editingCompetence, setEditingCompetence] = useState<{ competenceId: number; domaineId: number; data: Competence } | null>(null)

    const fetchDomaines = () => {
        setLoading(true)
        fetch(`${API}/domaines`)
            .then((r) => r.json())
            .then((data) => { setDomaines(data); setLoading(false) })
            .catch(() => setLoading(false))
    }

    useEffect(() => { fetchDomaines() }, [])

    const handleAddDomaine = (e: React.FormEvent) => {
        e.preventDefault()
        if (!newDomaine.nom.trim()) return
        fetch(`${API}/domaines`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(newDomaine),
        })
            .then(() => { fetchDomaines(); setShowDomaineForm(false); setNewDomaine({ nom: '', description: '', icone: '📁' }) })
    }

    const handleDeleteDomaine = (id: number) => {
        if (!confirm('Supprimer ce domaine et toutes ses compétences ?')) return
        fetch(`${API}/domaines/${id}`, { method: 'DELETE' }).then(() => fetchDomaines())
    }

    const handleAddCompetence = (data: { nom: string; description: string; niveauAttendu: string; domaineId: number }) => {
        fetch(`${API}/competences`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
        }).then(() => { fetchDomaines(); setShowCompetenceForm(null) })
    }

    const handleUpdateCompetence = (id: number, data: { nom: string; description: string; niveauAttendu: string; domaineId: number }) => {
        fetch(`${API}/competences/${id}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
        }).then(() => { fetchDomaines(); setEditingCompetence(null) })
    }

    const handleDeleteCompetence = (id: number) => {
        if (!confirm('Supprimer cette compétence ?')) return
        fetch(`${API}/competences/${id}`, { method: 'DELETE' }).then(() => fetchDomaines())
    }

    const handleAddFormation = (competenceId: number, data: any) => {
        fetch(`${API}/formations`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
        })
            .then((r) => r.json())
            .then((formation: FormationRef) => {
                return fetch(`${API}/competences/${competenceId}/formations/${formation.id}`, { method: 'POST' })
            })
            .then(() => {
                fetchDomaines();
                setShowFormationForm(null);
            })
            .catch(err => {
                console.error("Erreur lors de l'ajout de la formation:", err);
            })
    }

    const handleUnlinkFormation = (competenceId: number, formationId: number) => {
        fetch(`${API}/competences/${competenceId}/formations/${formationId}`, { method: 'DELETE' })
            .then(() => fetchDomaines())
    }

    return (
        <div className="mx-auto flex max-w-6xl flex-col gap-6 px-4 py-8 min-h-screen">
            {/* Header */}
            <header
                className="rounded-3xl p-8 text-white shadow-xl"
                style={{ background: 'linear-gradient(135deg, #3299CC 0%, #1e6fa0 50%, #0f4c75 100%)' }}
            >
                <p className="text-sm uppercase tracking-widest text-sky-200">Plateforme ASINHPA</p>
                <h1 className="mt-2 text-3xl font-bold">Référentiel de Compétences</h1>
                <p className="mt-3 max-w-3xl text-base text-sky-100">
                    Gérez les domaines de compétences, ajoutez de nouvelles compétences et associez des formations
                    pour structurer le développement des talents en numérique en santé.
                </p>
            </header>

            {/* Stats */}
            <div className="grid grid-cols-3 gap-4">
                {[
                    { label: 'Domaines', value: domaines.length, icon: '🗂️', color: '#3299CC' },
                    { label: 'Compétences', value: domaines.reduce((sum, d) => sum + (d.competences?.length ?? 0), 0), icon: '🎯', color: '#10b981' },
                    { label: 'Formations liées', value: domaines.reduce((sum, d) => sum + (d.competences?.reduce((s, c) => s + (c.formations?.length ?? 0), 0) ?? 0), 0), icon: '📚', color: '#f59e0b' },
                ].map((stat) => (
                    <div
                        key={stat.label}
                        className="flex items-center gap-4 rounded-2xl border border-slate-100 bg-white p-5 shadow-sm transition-all hover:shadow-md"
                    >
                        <div
                            className="flex h-12 w-12 items-center justify-center rounded-xl text-xl"
                            style={{ background: stat.color + '18' }}
                        >
                            {stat.icon}
                        </div>
                        <div>
                            <p className="text-2xl font-bold text-slate-900">{stat.value}</p>
                            <p className="text-sm text-slate-500">{stat.label}</p>
                        </div>
                    </div>
                ))}
            </div>

            {/* Add domain button */}
            <div className="flex justify-end">
                <button
                    onClick={() => setShowDomaineForm(true)}
                    className="flex items-center gap-2 rounded-xl px-4 py-2.5 text-sm font-semibold text-white shadow-md transition-all hover:shadow-lg active:scale-95"
                    style={{ background: 'linear-gradient(135deg, #3299CC, #2575A8)' }}
                >
                    <span className="text-lg">+</span> Ajouter un domaine
                </button>
            </div>

            {/* Domaine form */}
            {showDomaineForm && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => setShowDomaineForm(false)}>
                    <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl" onClick={(e) => e.stopPropagation()} style={{ animation: 'slideUp 0.3s ease-out' }}>
                        <h3 className="mb-4 text-lg font-bold text-slate-900">Nouveau domaine</h3>
                        <form onSubmit={handleAddDomaine} className="flex flex-col gap-4">
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Nom *</label>
                                <input
                                    type="text" value={newDomaine.nom} onChange={(e) => setNewDomaine({ ...newDomaine, nom: e.target.value })}
                                    placeholder="Ex : Intelligence Artificielle" required
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                                />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                                <textarea
                                    value={newDomaine.description} onChange={(e) => setNewDomaine({ ...newDomaine, description: e.target.value })}
                                    placeholder="Décrivez ce domaine…" rows={2}
                                    className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                                />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Icône (emoji)</label>
                                <input
                                    type="text" value={newDomaine.icone} onChange={(e) => setNewDomaine({ ...newDomaine, icone: e.target.value })}
                                    className="w-20 rounded-xl border border-slate-200 px-3 py-2.5 text-center text-2xl outline-none focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                                />
                            </div>
                            <div className="flex justify-end gap-3 pt-2">
                                <button type="button" onClick={() => setShowDomaineForm(false)} className="rounded-xl px-4 py-2 text-sm font-medium text-slate-600 hover:bg-slate-100">Annuler</button>
                                <button type="submit" className="rounded-xl px-5 py-2 text-sm font-semibold text-white shadow-md" style={{ background: 'linear-gradient(135deg, #3299CC, #2575A8)' }}>Ajouter</button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {/* Loading */}
            {loading && (
                <div className="flex justify-center py-12">
                    <div className="h-8 w-8 animate-spin rounded-full border-4 border-sky-200 border-t-sky-600"></div>
                </div>
            )}

            {/* Domaines list */}
            <div className="flex flex-col gap-4">
                {domaines.map((domaine) => {
                    const isExpanded = expandedDomaine === domaine.id
                    return (
                        <div key={domaine.id} className="rounded-2xl border border-slate-100 bg-white shadow-sm transition-all hover:shadow-md overflow-hidden">
                            {/* Domaine header */}
                            <div
                                className="flex items-center justify-between p-5 cursor-pointer select-none"
                                onClick={() => setExpandedDomaine(isExpanded ? null : domaine.id)}
                            >
                                <div className="flex items-center gap-4">
                                    <span className="flex h-12 w-12 items-center justify-center rounded-xl bg-slate-50 text-2xl">
                                        {domaine.icone || '📁'}
                                    </span>
                                    <div>
                                        <h2 className="text-lg font-bold text-slate-900">{domaine.nom}</h2>
                                        {domaine.description && <p className="text-sm text-slate-500">{domaine.description}</p>}
                                    </div>
                                </div>
                                <div className="flex items-center gap-3">
                                    <span className="rounded-full bg-sky-50 px-3 py-1 text-xs font-semibold text-sky-700">
                                        {domaine.competences?.length ?? 0} compétence{(domaine.competences?.length ?? 0) > 1 ? 's' : ''}
                                    </span>
                                    <button
                                        onClick={(e) => { e.stopPropagation(); handleDeleteDomaine(domaine.id) }}
                                        className="rounded-lg p-1.5 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors"
                                        title="Supprimer le domaine"
                                    >
                                        🗑️
                                    </button>
                                    <span className={`transition-transform duration-200 text-slate-400 ${isExpanded ? 'rotate-180' : ''}`}>▼</span>
                                </div>
                            </div>

                            {/* Expanded competences */}
                            {isExpanded && (
                                <div className="border-t border-slate-100 bg-slate-50/50 p-5">
                                    <div className="mb-4 flex items-center justify-between">
                                        <h3 className="text-sm font-semibold uppercase tracking-wider text-slate-500">Compétences</h3>
                                        <button
                                            onClick={() => setShowCompetenceForm(domaine.id)}
                                            className="flex items-center gap-1.5 rounded-lg bg-sky-50 px-3 py-1.5 text-xs font-semibold text-sky-700 hover:bg-sky-100 transition-colors"
                                        >
                                            + Ajouter
                                        </button>
                                    </div>

                                    {(domaine.competences?.length ?? 0) === 0 && (
                                        <p className="rounded-xl border border-dashed border-slate-200 bg-white px-4 py-6 text-center text-sm text-slate-400">
                                            Aucune compétence dans ce domaine. Cliquez sur « + Ajouter » pour commencer.
                                        </p>
                                    )}

                                    <div className="flex flex-col gap-3">
                                        {domaine.competences?.map((comp) => (
                                            <div key={comp.id} className="rounded-xl border border-slate-200 bg-white p-4 shadow-sm">
                                                <div className="flex items-start justify-between">
                                                    <div className="flex-1">
                                                        <div className="flex items-center gap-2 mb-1">
                                                            <h4 className="font-semibold text-slate-900">{comp.nom}</h4>
                                                            <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${NIVEAU_COLORS[comp.niveauAttendu] ?? 'bg-slate-100 text-slate-600'}`}>
                                                                {comp.niveauAttendu}
                                                            </span>
                                                        </div>
                                                        {comp.description && <p className="text-sm text-slate-500 mb-3">{comp.description}</p>}
                                                    </div>
                                                    <div className="flex gap-1 ml-3">
                                                        <button
                                                            onClick={() => setEditingCompetence({ competenceId: comp.id, domaineId: domaine.id, data: comp })}
                                                            className="rounded-lg p-1 text-slate-400 hover:bg-sky-50 hover:text-sky-600 transition-colors"
                                                            title="Modifier"
                                                        >✏️</button>
                                                        <button
                                                            onClick={() => handleDeleteCompetence(comp.id)}
                                                            className="rounded-lg p-1 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors"
                                                            title="Supprimer"
                                                        >🗑️</button>
                                                    </div>
                                                </div>

                                                {/* Formations linked */}
                                                {comp.formations && comp.formations.length > 0 && (
                                                    <div className="mt-3 border-t border-slate-100 pt-3">
                                                        <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-400">Formations associées</p>
                                                        <div className="flex flex-col gap-2">
                                                            {comp.formations.map((f) => (
                                                                <div key={f.id} className="flex items-center justify-between rounded-lg bg-slate-50 px-3 py-2">
                                                                    <div className="flex-1">
                                                                        <div className="flex items-center gap-2">
                                                                            <span className="font-medium text-sm text-slate-800">{f.name}</span>
                                                                            {f.certifiant && (
                                                                                <span className="rounded-full bg-emerald-100 px-2 py-0.5 text-xs font-medium text-emerald-700">Certifiant</span>
                                                                            )}
                                                                        </div>
                                                                        <div className="flex items-center gap-2 mt-0.5">
                                                                            {f.organisme && <span className="text-xs text-slate-500">{f.organisme}</span>}
                                                                            {f.duree && <span className="text-xs text-slate-400">· {f.duree}</span>}
                                                                        </div>
                                                                    </div>
                                                                    <div className="flex items-center gap-2">
                                                                        <a
                                                                            href={f.url}
                                                                            target="_blank"
                                                                            rel="noreferrer"
                                                                            className="rounded-lg bg-white px-2.5 py-1 text-xs font-semibold text-sky-600 shadow-sm hover:shadow transition-all no-underline"
                                                                        >
                                                                            Voir ↗
                                                                        </a>
                                                                        <button
                                                                            onClick={() => handleUnlinkFormation(comp.id, f.id)}
                                                                            className="rounded-lg p-1 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors text-xs"
                                                                            title="Retirer la formation"
                                                                        >✕</button>
                                                                    </div>
                                                                </div>
                                                            ))}
                                                        </div>
                                                    </div>
                                                )}

                                                <button
                                                    onClick={() => setShowFormationForm({ competenceId: comp.id, domaineName: domaine.nom })}
                                                    className="mt-3 flex items-center gap-1 rounded-lg bg-emerald-50 px-3 py-1.5 text-xs font-semibold text-emerald-700 hover:bg-emerald-100 transition-colors"
                                                >
                                                    + Ajouter une formation
                                                </button>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            )}
                        </div>
                    )
                })}
            </div>

            {!loading && domaines.length === 0 && (
                <div className="flex flex-col items-center justify-center rounded-2xl border border-dashed border-slate-200 bg-white px-8 py-16 text-center">
                    <span className="text-5xl mb-4">🗂️</span>
                    <h3 className="text-lg font-semibold text-slate-700 mb-2">Aucun domaine de compétences</h3>
                    <p className="text-sm text-slate-500 mb-4">Commencez par ajouter un domaine pour structurer votre référentiel.</p>
                    <button
                        onClick={() => setShowDomaineForm(true)}
                        className="rounded-xl px-5 py-2.5 text-sm font-semibold text-white shadow-md"
                        style={{ background: 'linear-gradient(135deg, #3299CC, #2575A8)' }}
                    >
                        + Ajouter un domaine
                    </button>
                </div>
            )}

            {/* Competence Form Modal */}
            {showCompetenceForm && (
                <CompetenceForm
                    domaineId={showCompetenceForm}
                    domaineName={domaines.find((d) => d.id === showCompetenceForm)?.nom ?? ''}
                    onClose={() => setShowCompetenceForm(null)}
                    onSave={handleAddCompetence}
                />
            )}

            {/* Edit Competence Form Modal */}
            {editingCompetence && (
                <CompetenceForm
                    domaineId={editingCompetence.domaineId}
                    domaineName={domaines.find((d) => d.id === editingCompetence.domaineId)?.nom ?? ''}
                    onClose={() => setEditingCompetence(null)}
                    onSave={(data) => handleUpdateCompetence(editingCompetence.competenceId, data)}
                    initial={{
                        nom: editingCompetence.data.nom,
                        description: editingCompetence.data.description,
                        niveauAttendu: editingCompetence.data.niveauAttendu,
                    }}
                />
            )}

            {/* Formation Form Modal */}
            {showFormationForm && (
                <FormationForm
                    domaineName={showFormationForm.domaineName}
                    onClose={() => setShowFormationForm(null)}
                    onSave={(data) => handleAddFormation(showFormationForm.competenceId, data)}
                />
            )}
        </div>
    )
}

export default ReferentielPage
