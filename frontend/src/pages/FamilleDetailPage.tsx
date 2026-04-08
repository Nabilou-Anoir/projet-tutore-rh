import { useEffect, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { familleApi, metierApi } from '../utils/metiers.service'
import type { Famille, Metier } from '../types/referentiel'
import { useAuth } from '../contexts/AuthContext'
import LogoFooter from '../components/LogoFooter'

export default function FamilleDetailPage() {
    const { id } = useParams<{ id: string }>()
    const navigate = useNavigate()
    const [famille, setFamille] = useState<Famille | null>(null)
    const [metiers, setMetiers] = useState<Metier[]>([])
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [search, setSearch] = useState('')
    const [showForm, setShowForm] = useState(false)
    const [editMetier, setEditMetier] = useState<Metier | null>(null)
    const [form, setForm] = useState({ titre: '', description: '', missionCourte: '' })
    const [showFamilleForm, setShowFamilleForm] = useState(false)
    const [familleForm, setFamilleForm] = useState({ nom: '', description: '', ordre: '', icone: '' })
    const [saving, setSaving] = useState(false)
    const { role } = useAuth()
    const canEdit = role === 'rh'

    const familleId = Number(id)

    const load = (silent = false) => {
        if (!silent) setLoading(true)
        Promise.all([
            familleApi.getById(familleId),
            metierApi.list({ familleId, size: 100 }),
        ])
            .then(([f, m]) => { setFamille(f); setMetiers(m.content) })
            .catch(() => setError('Erreur lors du chargement'))
            .finally(() => setLoading(false))
    }

    useEffect(() => { if (familleId) load() }, [familleId])

    const guardRh = () => {
        if (!canEdit) {
            setError('Fonctions d’édition réservées au profil RH. Merci de vous connecter.')
            return false
        }
        return true
    }

    const handleSaveMetier = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!guardRh()) return
        setSaving(true)
        try {
            if (editMetier) {
                await metierApi.update(editMetier.id, {
                    familleId,
                    titre: form.titre,
                    description: form.description,
                    missionCourte: form.missionCourte,
                    actif: editMetier.actif,
                })
            } else {
                await metierApi.create({ familleId, titre: form.titre, description: form.description, missionCourte: form.missionCourte, actif: true })
            }
            setForm({ titre: '', description: '', missionCourte: '' })
            setShowForm(false)
            setEditMetier(null)
            load(true)
        } catch {
            setError('Erreur lors de la sauvegarde du métier')
        } finally {
            setSaving(false)
        }
    }

    const openEditMetier = (e: React.MouseEvent, m: Metier) => {
        e.stopPropagation()
        if (!guardRh()) return
        setEditMetier(m)
        setForm({ titre: m.titre, description: m.description || '', missionCourte: m.missionCourte || '' })
        setShowForm(true)
    }

    const handleUpdateFamille = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!guardRh()) return
        setSaving(true)
        try {
            await familleApi.update(familleId, { nom: familleForm.nom, description: familleForm.description, ordre: parseInt(familleForm.ordre) || 0, icone: familleForm.icone })
            setShowFamilleForm(false)
            load(true)
        } catch {
            setError('Erreur lors de la modification de la famille')
        } finally {
            setSaving(false)
        }
    }

    const openEditFamille = () => {
        if (!famille || !guardRh()) return
        setFamilleForm({ nom: famille.nom, description: famille.description || '', ordre: String(famille.ordre), icone: famille.icone || '' })
        setShowFamilleForm(true)
    }

    const handleDelete = async (m: Metier) => {
        if (!guardRh()) return
        if (!confirm(`Supprimer le métier "${m.titre}" ?`)) return
        try { await metierApi.delete(m.id); load() }
        catch { setError('Erreur lors de la suppression') }
    }

    const filtered = metiers.filter(m =>
        m.titre.toLowerCase().includes(search.toLowerCase()) ||
        (m.description || '').toLowerCase().includes(search.toLowerCase())
    )

    return (
        <div className="mx-auto max-w-5xl flex flex-col gap-6 px-4 py-8 min-h-screen">
            {/* Header */}
            <header className="rounded-3xl p-8 text-white shadow-xl" style={{ background: '#00679A' }}>
                <Link to="/referentiel" className="text-sm text-white/80 hover:text-white">← Toutes les familles</Link>
                {loading && !famille ? <h1 className="mt-2 text-2xl font-bold opacity-50">Chargement…</h1> : (
                    <>
                        <div className="flex items-center justify-between mt-2">
                            <h1 className="text-3xl font-bold">{famille?.nom}</h1>
                            {canEdit && (
                                <button onClick={openEditFamille} className="rounded-xl px-4 py-2 text-sm font-semibold text-white transition-all hover:opacity-90" style={{ background: '#00567a' }}>✏️ Modifier la famille</button>
                            )}
                        </div>
                        {famille?.description && <p className="mt-3 text-lg text-blue-100/90 leading-relaxed max-w-4xl">{famille.description}</p>}
                    </>
                )}
            </header>

            {error && (
                <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 flex justify-between">
                    {error}<button onClick={() => setError(null)}>✕</button>
                </div>
            )}

            {!canEdit && (
                <div className="rounded-xl border border-amber-100 bg-amber-50 px-4 py-3 text-sm text-amber-700">
                    Mode lecture seule : connectez-vous en RH pour créer ou modifier des métiers/familles.
                </div>
            )}

            {/* Toolbar */}
            <div className="flex gap-3">
                <input
                    value={search} onChange={e => setSearch(e.target.value)}
                    placeholder="Rechercher un métier…"
                    className="flex-1 rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100"
                />
                {canEdit && (
                    <button
                        onClick={() => {
                            if (!guardRh()) return
                            setShowForm(true); setEditMetier(null); setForm({ titre: '', description: '', missionCourte: '' })
                        }}
                        className="flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold text-white shadow"
                        style={{ background: '#00679A' }}
                    >
                        <span>+</span> Nouveau métier
                    </button>
                )}
            </div>

            {/* Edit Famille Modal */}
            {showFamilleForm && canEdit && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => setShowFamilleForm(false)}>
                    <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl" onClick={e => e.stopPropagation()}>
                        <h3 className="mb-4 text-lg font-bold text-slate-900">Modifier la famille</h3>
                        <form onSubmit={handleUpdateFamille} className="flex flex-col gap-4">
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Nom *</label>
                                <input value={familleForm.nom} onChange={e => setFamilleForm({ ...familleForm, nom: e.target.value })} required
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Ordre</label>
                                <input type="number" min="0" value={familleForm.ordre} onChange={e => setFamilleForm({ ...familleForm, ordre: e.target.value })}
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                                <textarea value={familleForm.description} onChange={e => setFamilleForm({ ...familleForm, description: e.target.value })} rows={3}
                                    className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div className="flex justify-end gap-3 pt-2">
                                <button type="button" onClick={() => setShowFamilleForm(false)} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-slate-100">Annuler</button>
                                <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                    {saving ? 'Sauvegarde…' : 'Enregistrer'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {/* Add/Edit Metier modal */}
            {showForm && canEdit && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => { setShowForm(false); setEditMetier(null); }}>
                    <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl" onClick={e => e.stopPropagation()}>
                        <h3 className="mb-4 text-lg font-bold text-slate-900">{editMetier ? 'Modifier le métier' : `Nouveau métier dans ${famille?.nom}`}</h3>
                        <form onSubmit={handleSaveMetier} className="flex flex-col gap-4">
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Titre *</label>
                                <input value={form.titre} onChange={e => setForm({ ...form, titre: e.target.value })} required placeholder="Ex : Chef de projet SI"
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Mission courte</label>
                                <input value={form.missionCourte} onChange={e => setForm({ ...form, missionCourte: e.target.value })} placeholder="Ex : Conduire les projets SI"
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                                <textarea value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} rows={2}
                                    className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div className="flex justify-end gap-3 pt-2">
                                <button type="button" onClick={() => { setShowForm(false); setEditMetier(null); }} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-slate-100">Annuler</button>
                                <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: '#00679A' }}>
                                    {saving ? 'Sauvegarde…' : (editMetier ? 'Mettre à jour' : 'Créer')}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {loading && !famille && <div className="flex justify-center py-12"><div className="h-8 w-8 animate-spin rounded-full border-4 border-blue-200 border-t-blue-600" /></div>}

            {(!loading || famille) && (
                <div className="flex flex-col gap-3">
                    <p className="text-sm text-slate-500">{filtered.length} métier{filtered.length !== 1 ? 's' : ''}</p>
                    {filtered.map((m, i) => (
                        <div
                            key={m.id}
                            className="animate-in group flex items-center justify-between rounded-2xl border border-slate-100 bg-white p-5 shadow-sm transition-all hover:shadow-md hover:border-blue-100 cursor-pointer"
                            style={{ animationDelay: `${i * 40}ms` }}
                            onClick={() => navigate(`/referentiel/metier/${m.id}`)}
                        >
                            <div className="flex-1">
                                <div className="flex items-center gap-2 mb-1">
                                    <h2 className="text-base font-bold text-slate-900 group-hover:text-blue-600 transition-colors">{m.titre}</h2>
                                    {!m.actif && <span className="rounded-full bg-slate-100 px-2 py-0.5 text-xs text-slate-500">Inactif</span>}
                                </div>
                                {m.description ? (
                                    <p className="text-sm text-slate-500 line-clamp-1">{m.description}</p>
                                ) : m.missionCourte && (
                                    <p className="text-sm text-slate-500">{m.missionCourte}</p>
                                )}
                            </div>
                            <div className="flex items-center gap-2 ml-4">
                                <span className="text-sm text-blue-500 group-hover:underline">Détails →</span>
                                {canEdit && (
                                    <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                                        <button
                                            onClick={e => openEditMetier(e, m)}
                                            className="rounded-lg p-1.5 text-slate-400 hover:bg-sky-50 hover:text-sky-600 transition-colors"
                                        >✏️</button>
                                        <button
                                            onClick={e => { e.stopPropagation(); handleDelete(m) }}
                                            className="rounded-lg p-1.5 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors"
                                        >🗑️</button>
                                    </div>
                                )}
                            </div>
                        </div>
                    ))}
                    {filtered.length === 0 && (
                        <div className="rounded-2xl border border-dashed border-slate-200 bg-white py-12 text-center text-slate-400">
                            {search ? `Aucun métier pour "${search}"` : 'Aucun métier dans cette famille'}
                        </div>
                    )}
                </div>
            )}
            <LogoFooter />
        </div>
    )
}
