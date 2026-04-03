import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { formationApi, competenceSIApi } from '../utils/metiers.service'
import type { Formation, CompetenceSI } from '../types/referentiel'
import { useAuth } from '../contexts/AuthContext'
import LogoFooter from '../components/LogoFooter'

export default function FormationsPage() {
    const [formations, setFormations] = useState<Formation[]>([])
    const [competences, setCompetences] = useState<CompetenceSI[]>([])
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [success, setSuccess] = useState<string | null>(null)
    const [saving, setSaving] = useState(false)
    const { role } = useAuth()
    const canEdit = role === 'rh'

    // Form modal state
    const [showForm, setShowForm] = useState(false)
    const [editFormation, setEditFormation] = useState<Formation | null>(null)
    const [form, setForm] = useState({
        nom: '',
        description: '',
        url: '',
        organisme: '',
        competenceIds: [] as number[]
    })

    const notify = (msg: string) => { setSuccess(msg); setTimeout(() => setSuccess(null), 3000) }

    const load = () => {
        setLoading(true)
        Promise.all([formationApi.list(), competenceSIApi.list({ size: 500 })])
            .then(([f, c]) => {
                setFormations(f)
                setCompetences(c.content)
            })
            .catch(() => setError('Erreur lors du chargement des données'))
            .finally(() => setLoading(false))
    }

    useEffect(() => { load() }, [])

    const guardRh = () => {
        if (!canEdit) {
            setError('Fonction réservée au profil RH. Merci de vous connecter.')
            return false
        }
        return true
    }

    const openCreate = () => {
        if (!guardRh()) return
        setForm({ nom: '', description: '', url: '', organisme: '', competenceIds: [] })
        setEditFormation(null)
        setShowForm(true)
    }

    const openEdit = (f: Formation) => {
        if (!guardRh()) return
        setForm({
            nom: f.nom,
            description: f.description ?? '',
            url: f.url ?? '',
            organisme: f.organisme ?? '',
            competenceIds: [...(f.competenceIds || [])]
        })
        setEditFormation(f)
        setShowForm(true)
    }

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!guardRh()) return
        setSaving(true)
        try {
            if (editFormation) {
                await formationApi.update(editFormation.id, form)
                notify('Formation mise à jour')
            } else {
                await formationApi.create(form)
                notify('Formation créée')
            }
            setShowForm(false)
            load()
        } catch {
            setError('Erreur lors de la sauvegarde')
        } finally {
            setSaving(false)
        }
    }

    const handleDelete = async (f: Formation) => {
        if (!guardRh()) return
        if (!confirm(`Supprimer la formation "${f.nom}" ?`)) return
        try {
            await formationApi.delete(f.id)
            load()
            notify('Formation supprimée')
        } catch {
            setError('Erreur lors de la suppression')
        }
    }

    const toggleCompetence = (id: number) => {
        setForm(prev => ({
            ...prev,
            competenceIds: prev.competenceIds.includes(id)
                ? prev.competenceIds.filter(cId => cId !== id)
                : [...prev.competenceIds, id]
        }))
    }

    return (
        <div className="mx-auto max-w-5xl flex flex-col gap-6 px-4 py-8 min-h-screen">
            <header className="rounded-3xl p-8 text-white shadow-xl" style={{ background: 'linear-gradient(135deg, #1e3a5f 0%, #2563eb 60%, #0ea5e9 100%)' }}>
                <Link to="/referentiel" className="text-sm text-blue-200 hover:text-white">← Retour au référentiel</Link>
                <h1 className="mt-2 text-2xl font-bold">Gestion des Formations</h1>
                <p className="mt-2 text-blue-100 text-sm">Gérez le catalogue des formations et liez-les aux compétences du référentiel.</p>
            </header>

            {success && <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div>}
            {error && (
                <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 flex justify-between">
                    {error}<button onClick={() => setError(null)}>✕</button>
                </div>
            )}

            {!canEdit && (
                <div className="rounded-xl border border-amber-100 bg-amber-50 px-4 py-3 text-sm text-amber-700">
                    Mode lecture seule activé. Connectez-vous en RH pour modifier le catalogue.
                </div>
            )}

            {canEdit && (
                <div className="flex justify-end">
                    <button
                        onClick={openCreate}
                        className="flex items-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold text-white shadow-lg transition-all hover:scale-105 active:scale-95"
                        style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}
                    >
                        + Nouvelle Formation
                    </button>
                </div>
            )}

            {loading ? (
                <div className="flex justify-center py-20">
                    <div className="h-10 w-10 animate-spin rounded-full border-4 border-blue-100 border-t-blue-600" />
                </div>
            ) : (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {formations.map(f => (
                        <div key={f.id} className="group flex flex-col rounded-3xl border border-slate-100 bg-white p-6 shadow-sm hover:shadow-xl transition-all duration-300">
                            <div className="flex justify-between items-start mb-3">
                                <div className="flex-1">
                                    <h3 className="text-lg font-bold text-slate-900 group-hover:text-blue-600 transition-colors line-clamp-1">{f.nom}</h3>
                                    {f.organisme && <p className="text-xs font-bold text-blue-600 uppercase tracking-widest mt-0.5">{f.organisme}</p>}
                                </div>
                                {canEdit && (
                                    <div className="flex gap-1 ml-4">
                                        <button onClick={() => openEdit(f)} className="rounded-xl p-2.5 text-slate-400 hover:bg-sky-50 hover:text-sky-600 transition-all">✏️</button>
                                        <button onClick={() => handleDelete(f)} className="rounded-xl p-2.5 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-all">🗑️</button>
                                    </div>
                                )}
                            </div>
                            
                            {f.description && <p className="text-sm text-slate-500 line-clamp-2 mb-4 leading-relaxed">{f.description}</p>}
                            
                            <div className="mt-auto flex flex-col gap-4">
                                <div className="flex flex-wrap gap-1.5">
                                    {f.competenceIds?.length > 0 ? (
                                        f.competenceIds.slice(0, 3).map(cId => {
                                            const comp = competences.find(c => c.id === cId)
                                            return comp ? (
                                                <span key={cId} className="rounded-full bg-slate-100 px-2.5 py-1 text-[10px] font-bold text-slate-600 border border-slate-200/50">
                                                    {comp.nom}
                                                </span>
                                            ) : null
                                        })
                                    ) : (
                                        <span className="text-[10px] text-slate-400 italic">Aucune compétence liée</span>
                                    )}
                                    {f.competenceIds?.length > 3 && <span className="text-[10px] text-slate-400 font-bold">+{f.competenceIds.length - 3}</span>}
                                </div>

                                {f.url && (
                                    <a href={f.url} target="_blank" rel="noopener noreferrer" className="flex items-center justify-center gap-2 rounded-2xl bg-slate-50 border border-slate-100 px-4 py-2.5 text-sm font-bold text-slate-700 hover:bg-blue-50 hover:border-blue-200 hover:text-blue-700 transition-all group/link">
                                        Voir sur le site <span className="group-hover/link:translate-x-0.5 group-hover/link:-translate-y-0.5 transition-transform">↗️</span>
                                    </a>
                                )}
                            </div>
                        </div>
                    ))}
                    {formations.length === 0 && (
                        <div className="md:col-span-2 rounded-3xl border-2 border-dashed border-slate-100 bg-slate-50/50 py-20 text-center">
                            <div className="text-4xl mb-4">📂</div>
                            <p className="text-slate-500 font-medium">Aucune formation enregistrée pour le moment.</p>
                            {canEdit && <button onClick={openCreate} className="mt-4 text-blue-600 font-bold hover:underline">Ajouter votre première formation</button>}
                        </div>
                    )}
                </div>
            )}

            {/* Modal Form */}
            {showForm && canEdit && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm p-4 overflow-y-auto" onClick={() => setShowForm(false)}>
                    <div className="w-full max-w-2xl rounded-3xl bg-white shadow-2xl animate-in fade-in zoom-in duration-200 my-auto" onClick={e => e.stopPropagation()}>
                        <div className="p-8">
                            <h3 className="mb-6 text-xl font-bold text-slate-900">{editFormation ? 'Modifier la formation' : 'Nouvelle formation'}</h3>
                            <form onSubmit={handleSave} className="flex flex-col gap-5">
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <label className="mb-1.5 block text-xs font-bold text-slate-500 uppercase tracking-wider">Nom de la formation *</label>
                                        <input value={form.nom} onChange={e => setForm({ ...form, nom: e.target.value })} required placeholder="Ex: Master MIAGE"
                                            className="w-full rounded-2xl border border-slate-200 px-4 py-3 text-sm outline-none focus:border-blue-400 focus:ring-4 focus:ring-blue-100 transition-all" />
                                    </div>
                                    <div>
                                        <label className="mb-1.5 block text-xs font-bold text-slate-500 uppercase tracking-wider">Organisme</label>
                                        <input value={form.organisme} onChange={e => setForm({ ...form, organisme: e.target.value })} placeholder="Ex: Université de Toulouse"
                                            className="w-full rounded-2xl border border-slate-200 px-4 py-3 text-sm outline-none focus:border-blue-400 focus:ring-4 focus:ring-blue-100 transition-all" />
                                    </div>
                                </div>
                                
                                <div>
                                    <label className="mb-1.5 block text-xs font-bold text-slate-500 uppercase tracking-wider">URL du site web</label>
                                    <input value={form.url} onChange={e => setForm({ ...form, url: e.target.value })} placeholder="https://..."
                                        className="w-full rounded-2xl border border-slate-200 px-4 py-3 text-sm outline-none focus:border-blue-400 focus:ring-4 focus:ring-blue-100 transition-all" />
                                </div>

                                <div>
                                    <label className="mb-1.5 block text-xs font-bold text-slate-500 uppercase tracking-wider">Description</label>
                                    <textarea value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} rows={3} placeholder="Détails de la formation..."
                                        className="w-full resize-none rounded-2xl border border-slate-200 px-4 py-3 text-sm outline-none focus:border-blue-400 focus:ring-4 focus:ring-blue-100 transition-all" />
                                </div>

                                <div>
                                    <label className="mb-1.5 block text-xs font-bold text-slate-500 uppercase tracking-wider">Compétences liées ({form.competenceIds.length})</label>
                                    <div className="max-h-48 overflow-y-auto rounded-2xl border border-slate-200 p-3 flex flex-wrap gap-2 bg-slate-50/50 custom-scrollbar">
                                        {competences.map(c => (
                                            <button
                                                key={c.id}
                                                type="button"
                                                onClick={() => toggleCompetence(c.id)}
                                                className={`rounded-xl px-3 py-1.5 text-xs font-bold transition-all border ${form.competenceIds.includes(c.id)
                                                        ? 'bg-blue-600 border-blue-600 text-white shadow-md'
                                                        : 'bg-white border-slate-200 text-slate-600 hover:border-blue-300 hover:text-blue-600'
                                                    }`}
                                            >
                                                {c.nom}
                                            </button>
                                        ))}
                                    </div>
                                </div>

                                <div className="flex justify-end gap-3 pt-4">
                                    <button type="button" onClick={() => setShowForm(false)} className="rounded-2xl px-6 py-3 text-sm font-bold text-slate-500 hover:bg-slate-100 transition-all">Annuler</button>
                                    <button type="submit" disabled={saving} className="rounded-2xl px-8 py-3 text-sm font-bold text-white shadow-lg disabled:opacity-50 transition-all hover:scale-105" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                        {saving ? 'Enregistrement…' : (editFormation ? 'Mettre à jour' : 'Enregistrer la formation')}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            )}
            <LogoFooter />
        </div>
    )
}
