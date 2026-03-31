import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { competenceSIApi } from '../utils/metiers.service'
import type { CompetenceSI, Metier } from '../types/referentiel'
import FormationModal from '../components/Referentiel/FormationModal'
import { useAuth } from '../contexts/AuthContext'

export default function CompetencesSIPage() {
    const [competences, setCompetences] = useState<CompetenceSI[]>([])
    const [total, setTotal] = useState(0)
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [success, setSuccess] = useState<string | null>(null)
    const [search, setSearch] = useState('')
    const [page, setPage] = useState(0)
    const [totalPages, setTotalPages] = useState(0)
    const PAGE_SIZE = 20

    const [showForm, setShowForm] = useState(false)
    const [editComp, setEditComp] = useState<CompetenceSI | null>(null)
    const [form, setForm] = useState({ nom: '', description: '' })
    const [saving, setSaving] = useState(false)

    const [selectedCompForMetiers, setSelectedCompForMetiers] = useState<CompetenceSI | null>(null)
    const [metiersByComp, setMetiersByComp] = useState<Record<number, Metier[]>>({})
    const [loadingMetiers, setLoadingMetiers] = useState<Record<number, boolean>>({})

    const [selectedCompForFormations, setSelectedCompForFormations] = useState<CompetenceSI | null>(null)
    const { role } = useAuth()
    const canEdit = role === 'rh'

    const notify = (msg: string) => { setSuccess(msg); setTimeout(() => setSuccess(null), 3000) }

    const load = (p = page, q = search, silent = false) => {
        if (!silent) setLoading(true)
        competenceSIApi.list({ q: q || undefined, page: p, size: PAGE_SIZE })
            .then(r => { setCompetences(r.content); setTotal(r.totalElements); setTotalPages(r.totalPages) })
            .catch(() => setError('Erreur lors du chargement'))
            .finally(() => setLoading(false))
    }

    useEffect(() => { load() }, [])

    const handleSearch = (q: string) => {
        setSearch(q); setPage(0); load(0, q)
    }

    const guardRh = () => {
        if (!canEdit) {
            setError('Fonction réservée au profil RH. Merci de vous connecter.')
            return false
        }
        return true
    }

    const openCreate = () => {
        if (!guardRh()) return
        setForm({ nom: '', description: '' }); setEditComp(null); setShowForm(true)
    }
    const openEdit = (c: CompetenceSI) => {
        if (!guardRh()) return
        setForm({ nom: c.nom, description: c.description ?? '' }); setEditComp(c); setShowForm(true)
    }

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!guardRh()) return
        setSaving(true)
        try {
            if (editComp) {
                await competenceSIApi.update(editComp.id, form)
                notify('Compétence modifiée')
            } else {
                await competenceSIApi.create(form)
                notify('Compétence créée')
            }
            setShowForm(false)
            setEditComp(null)
            load(0, search, true)
        } catch { setError('Erreur lors de la sauvegarde') } finally { setSaving(false) }
    }

    const handleDelete = async (c: CompetenceSI) => {
        if (!guardRh()) return
        if (!confirm(`Supprimer la compétence "${c.nom}" ?`)) return
        try { await competenceSIApi.delete(c.id); load(0, search, true); notify('Compétence supprimée') }
        catch (err: any) { setError(err.message || 'Erreur lors de la suppression') }
    }

    const openMetiersModal = async (c: CompetenceSI) => {
        setSelectedCompForMetiers(c)
        if (!metiersByComp[c.id]) {
            setLoadingMetiers(prev => ({ ...prev, [c.id]: true }))
            try {
                const res = await competenceSIApi.getMetiers(c.id)
                setMetiersByComp(prev => ({ ...prev, [c.id]: res }))
            } catch (err) {
                console.error('Failed to load metiers:', err)
            } finally {
                setLoadingMetiers(prev => ({ ...prev, [c.id]: false }))
            }
        }
    }

    return (
        <div className="mx-auto max-w-5xl flex flex-col gap-6 px-4 py-8 min-h-screen">
            <header className="rounded-3xl p-8 text-white shadow-xl" style={{ background: 'linear-gradient(135deg, #1e3a5f 0%, #2563eb 60%, #0ea5e9 100%)' }}>
                <Link to="/referentiel" className="text-sm text-blue-200 hover:text-white">← Familles de métiers</Link>
                <h1 className="mt-2 text-2xl font-bold">Catalogue des Compétences SI</h1>
                <p className="mt-2 text-blue-100 text-sm">Gérez le catalogue de compétences disponibles pour les profils métiers.</p>
            </header>

            {success && <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div>}
            {error && (
                <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 flex justify-between">
                    {error}<button onClick={() => setError(null)}>✕</button>
                </div>
            )}
            {!canEdit && (
                <div className="rounded-xl border border-amber-100 bg-amber-50 px-4 py-3 text-sm text-amber-700">
                    Mode lecture seule activé. Connectez-vous en RH pour créer ou modifier des compétences.
                </div>
            )}

            {/* Toolbar */}
            <div className="flex gap-3">
                <input
                    value={search} onChange={e => handleSearch(e.target.value)}
                    placeholder="Rechercher une compétence…"
                    className="flex-1 rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100"
                />
                {canEdit && (
                    <button
                        onClick={openCreate}
                        className="flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold text-white shadow"
                        style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}
                    >
                        + Nouvelle compétence
                    </button>
                )}
                <Link to="/referentiel/formations"
                    className="flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-4 py-2 text-sm font-semibold text-slate-700 shadow-sm transition-all hover:bg-slate-50">
                    🎓 Gérer les formations
                </Link>
            </div>

            <p className="text-sm text-slate-500"><span className="font-bold text-slate-900">{total}</span> compétence{total !== 1 ? 's' : ''}</p>

            {/* Form modal */}
            {showForm && canEdit && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => setShowForm(false)}>
                    <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl" onClick={e => e.stopPropagation()}>
                        <h3 className="mb-4 text-lg font-bold text-slate-900">{editComp ? 'Modifier la compétence' : 'Nouvelle compétence'}</h3>
                        <form onSubmit={handleSave} className="flex flex-col gap-4">
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Nom *</label>
                                <input value={form.nom} onChange={e => setForm({ ...form, nom: e.target.value })} required placeholder="Ex : Gestion de projet"
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                                <textarea value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} rows={2}
                                    className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div className="flex justify-end gap-3 pt-2">
                                <button type="button" onClick={() => setShowForm(false)} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-slate-100">Annuler</button>
                                <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                    {saving ? 'Sauvegarde…' : (editComp ? 'Mettre à jour' : 'Créer')}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {/* List */}
            {loading ? (
                <div className="flex justify-center py-12"><div className="h-8 w-8 animate-spin rounded-full border-4 border-blue-200 border-t-blue-600" /></div>
            ) : (
                <div className="flex flex-col gap-3">
                    {competences.map((c, i) => (
                        <div key={c.id}
                            className="animate-in flex flex-col rounded-2xl border border-slate-100 bg-white shadow-sm hover:shadow-md transition-all overflow-hidden"
                            style={{ animationDelay: `${i * 50}ms` }}
                        >
                            <div className="flex items-center justify-between px-6 py-4 cursor-pointer group" onClick={() => openMetiersModal(c)}>
                                <div className="flex-1">
                                    <h3 className="font-bold text-slate-900 group-hover:text-blue-600 transition-colors flex items-center gap-2">
                                        {c.nom}
                                        <button 
                                            onClick={(e) => { e.stopPropagation(); setSelectedCompForFormations(c) }}
                                            className="text-xs bg-blue-50 text-blue-600 px-2 py-0.5 rounded-full hover:bg-blue-600 hover:text-white transition-all shadow-sm"
                                        >
                                            Formations 🎓
                                        </button>
                                    </h3>
                                    {c.description && <p className="text-sm text-slate-500 mt-0.5">{c.description}</p>}
                                </div>
                                {canEdit && (
                                    <div className="flex gap-1 ml-4" onClick={e => e.stopPropagation()}>
                                        <button onClick={() => openEdit(c)} className="rounded-lg p-2 text-slate-400 hover:bg-sky-50 hover:text-sky-600 transition-colors">✏️</button>
                                        <button onClick={() => handleDelete(c)} className="rounded-lg p-2 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors">🗑️</button>
                                    </div>
                                )}
                            </div>
                        </div>
                    ))}
                    {competences.length === 0 && (
                        <div className="rounded-2xl border border-dashed border-slate-200 bg-white py-12 text-center text-slate-400">
                            {search ? `Aucune compétence pour "${search}"` : 'Aucune compétence dans le catalogue'}
                        </div>
                    )}
                </div>
            )}

            {/* Pagination */}
            {totalPages > 1 && (
                <div className="flex justify-center gap-2">
                    <button disabled={page === 0} onClick={() => { setPage(page - 1); load(page - 1, search) }}
                        className="rounded-lg px-3 py-1.5 text-sm font-medium text-blue-600 hover:bg-blue-50 disabled:opacity-40">← Précédent</button>
                    <span className="px-3 py-1.5 text-sm text-slate-500">Page {page + 1} / {totalPages}</span>
                    <button disabled={page >= totalPages - 1} onClick={() => { setPage(page + 1); load(page + 1, search) }}
                        className="rounded-lg px-3 py-1.5 text-sm font-medium text-blue-600 hover:bg-blue-50 disabled:opacity-40">Suivant →</button>
                </div>
            )}

            {/* Metiers Modal */}
            {selectedCompForMetiers && (
                <div className="fixed inset-0 z-[60] flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => setSelectedCompForMetiers(null)}>
                    <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl" onClick={e => e.stopPropagation()}>
                        <div className="flex items-center justify-between mb-4">
                            <h3 className="text-lg font-bold text-slate-900">Métiers utilisant : {selectedCompForMetiers.nom}</h3>
                            <button onClick={() => setSelectedCompForMetiers(null)} className="text-slate-400 hover:text-slate-600">✕</button>
                        </div>

                        <div className="max-h-[60vh] overflow-y-auto pr-2">
                            {loadingMetiers[selectedCompForMetiers.id] ? (
                                <div className="flex flex-col items-center justify-center py-12 gap-3">
                                    <div className="h-10 w-10 animate-spin rounded-full border-4 border-slate-100 border-t-blue-600" />
                                    <p className="text-sm text-slate-500 font-medium">Chargement des métiers...</p>
                                </div>
                            ) : (metiersByComp[selectedCompForMetiers.id]?.length ?? 0) > 0 ? (
                                <div className="grid grid-cols-1 gap-2">
                                    {metiersByComp[selectedCompForMetiers.id]?.map(m => (
                                        <Link
                                            key={m.id}
                                            to={`/referentiel/metier/${m.id}`}
                                            className="flex items-center justify-between rounded-xl border border-slate-100 bg-slate-50/50 p-4 transition-all hover:border-blue-200 hover:bg-blue-50/50 group"
                                        >
                                            <span className="text-sm font-semibold text-slate-700 group-hover:text-blue-700">{m.titre}</span>
                                            <span className="text-blue-400 text-lg group-hover:translate-x-1 transition-transform">→</span>
                                        </Link>
                                    ))}
                                </div>
                            ) : (
                                <div className="flex flex-col items-center justify-center py-12 px-4 text-center">
                                    <p className="text-slate-400 italic">Aucun métier n'est encore associé à cette compétence.</p>
                                </div>
                            )}
                        </div>
                        <div className="mt-6 flex justify-end">
                            <button onClick={() => setSelectedCompForMetiers(null)} className="rounded-xl px-5 py-2.5 text-sm font-semibold text-slate-600 hover:bg-slate-100 transition-colors">
                                Fermer
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {selectedCompForFormations && (
                <FormationModal 
                    competence={selectedCompForFormations} 
                    onClose={() => setSelectedCompForFormations(null)} 
                />
            )}
        </div>
    )
}
