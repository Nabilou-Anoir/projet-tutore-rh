import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { familleApi } from '../utils/metiers.service'
import type { Famille } from '../types/referentiel'
import { useAuth } from '../contexts/AuthContext'
import LogoFooter from '../components/LogoFooter'

const FAMILLE_ICONS = ['🏛', '📋', '💻', '🖥', '🎧', '🛡', '👥', '📊', '🤝']

export default function FamillesListPage() {
    const [familles, setFamilles] = useState<Famille[]>([])
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [success, setSuccess] = useState<string | null>(null)
    const [showForm, setShowForm] = useState(false)
    const [editFamille, setEditFamille] = useState<Famille | null>(null)
    const [form, setForm] = useState({ nom: '', description: '', ordre: '', icone: '🏛' })
    const [saving, setSaving] = useState(false)
    const navigate = useNavigate()
    const { role } = useAuth()
    const canEdit = role === 'rh'

    const notify = (msg: string) => { setSuccess(msg); setTimeout(() => setSuccess(null), 3000) }

    const load = (silent = false) => {
        if (!silent) setLoading(true)
        familleApi.list()
            .then(setFamilles)
            .catch(() => setError('Erreur lors du chargement des familles'))
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

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!guardRh()) return
        if (!form.nom.trim()) return
        setSaving(true)
        try {
            if (editFamille) {
                await familleApi.update(editFamille.id, { nom: form.nom, description: form.description, ordre: parseInt(form.ordre) || 0, icone: form.icone })
            } else {
                await familleApi.create({ nom: form.nom, description: form.description, ordre: parseInt(form.ordre) || 0, icone: form.icone })
            }
            setForm({ nom: '', description: '', ordre: '', icone: '🏛' })
            setShowForm(false)
            setEditFamille(null)
            load(true)
            notify(editFamille ? 'Famille modifiée' : 'Famille créée')
        } catch {
            setError('Erreur lors de la sauvegarde')
        } finally {
            setSaving(false)
        }
    }

    const openCreate = () => {
        if (!guardRh()) return
        setEditFamille(null)
        setForm({ nom: '', description: '', ordre: '', icone: '🏛' })
        setShowForm(true)
    }

    const openEdit = (e: React.MouseEvent, f: Famille) => {
        e.stopPropagation()
        if (!guardRh()) return
        setEditFamille(f)
        setForm({ nom: f.nom, description: f.description || '', ordre: String(f.ordre), icone: f.icone || '🏛' })
        setShowForm(true)
    }

    const handleDelete = async (id: number, nom: string) => {
        if (!guardRh()) return
        if (!confirm(`Supprimer la famille "${nom}" et tous ses métiers ?`)) return
        try {
            await familleApi.delete(id)
            load(true)
            notify('Famille supprimée')
        } catch (err: any) {
            setError(err.message || 'Erreur lors de la suppression')
        }
    }

    return (
        <div className="mx-auto max-w-6xl flex flex-col gap-6 px-4 py-8 min-h-screen">
            {/* Header */}
            <header
                className="rounded-3xl p-8 text-white shadow-xl animate-in"
                style={{ background: '#00679A' }}
            >
                <h1 className="text-2xl font-bold leading-tight sm:text-3xl">Référentiel des Métiers en système d'information en santé</h1>
                <p className="mt-3 max-w-3xl text-sm text-white/80 sm:text-base">
                    Explorez la structure du référentiel : 9 familles regroupant les métiers du Système d'Information en Santé.
                </p>
            </header>

            {/* Stats + action */}
            <div className="animate-in flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                <p className="text-sm font-medium text-slate-500 sm:text-base">
                    <span className="text-2xl font-bold text-slate-900">{familles.length}</span> famille{familles.length !== 1 ? 's' : ''}
                </p>
                {canEdit && (
                    <button
                        onClick={openCreate}
                        className="flex w-full items-center justify-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold text-white shadow-md transition-all hover:shadow-lg active:scale-95 sm:w-auto"
                        style={{ background: '#00679A' }}
                        title="Créer une nouvelle famille"
                    >
                        <span className="text-lg">+</span> Nouvelle famille
                    </button>
                )}
            </div>

            {!canEdit && (
                <div className="animate-in rounded-xl border border-amber-100 bg-amber-50 px-4 py-3 text-sm text-amber-700">
                    Mode lecture seule activé. Connectez-vous en RH pour modifier le référentiel.
                </div>
            )}

            {/* Notifications */}
            {success && <div className="animate-in rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div>}
            {error && (
                <div className="animate-in rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 flex justify-between items-center">
                    {error}
                    <button onClick={() => setError(null)} className="text-red-400 hover:text-red-600">✕</button>
                </div>
            )}

            {/* Add form modal */}
            {showForm && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => { setShowForm(false); setEditFamille(null); }}>
                    <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl" onClick={e => e.stopPropagation()}>
                        <h3 className="mb-4 text-lg font-bold text-slate-900">{editFamille ? 'Modifier la famille' : 'Nouvelle famille de métiers'}</h3>
                        <form onSubmit={handleSave} className="flex flex-col gap-4">
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Nom *</label>
                                <input
                                    value={form.nom} onChange={e => setForm({ ...form, nom: e.target.value })}
                                    placeholder="Ex : Sécurité" required
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100"
                                />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                                <textarea
                                    value={form.description} onChange={e => setForm({ ...form, description: e.target.value })}
                                    rows={2} placeholder="Décrivez cette famille…"
                                    className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100"
                                />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Ordre d'affichage</label>
                                <input
                                    type="number" value={form.ordre} onChange={e => setForm({ ...form, ordre: e.target.value })}
                                    placeholder="10" min="0" required
                                    className="w-32 rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100"
                                />
                            </div>
                            <div>
                                <label className="mb-2 block text-sm font-medium text-slate-700">Icône / Émoji</label>
                                <div className="flex flex-wrap gap-2">
                                    {FAMILLE_ICONS.map(emoji => (
                                        <button
                                            key={emoji}
                                            type="button"
                                            onClick={() => setForm({ ...form, icone: emoji })}
                                            className={`flex h-10 w-10 items-center justify-center rounded-lg border text-xl transition-all ${form.icone === emoji ? 'border-blue-600 bg-blue-50' : 'border-slate-200 bg-white hover:bg-slate-50'}`}
                                        >
                                            {emoji}
                                        </button>
                                    ))}
                                </div>
                            </div>
                            <div className="flex justify-end gap-3 pt-2">
                                <button type="button" onClick={() => setShowForm(false)} className="rounded-xl px-4 py-2 text-sm font-medium text-slate-600 hover:bg-slate-100">Annuler</button>
                                <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: '#00679A' }}>
                                    {saving ? 'Création…' : 'Créer'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {/* Loading */}
            {loading && (
                <div className="flex justify-center py-12">
                    <div className="h-8 w-8 animate-spin rounded-full border-4 border-blue-200 border-t-blue-600" />
                </div>
            )}

            {/* Familles grid */}
            {!loading && (
                <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
                    {familles.map((f, i) => (
                        <div
                            key={f.id}
                            className="animate-in group relative flex flex-col rounded-2xl border border-slate-100 bg-white p-6 shadow-sm transition-all hover:shadow-lg hover:-translate-y-0.5 cursor-pointer"
                            style={{ animationDelay: `${i * 50}ms` }}
                            onClick={() => navigate(`/referentiel/famille/${f.id}`)}
                        >
                            <div className="flex items-start justify-between mb-4">
                                <span className="flex h-12 w-12 items-center justify-center rounded-xl text-2xl" style={{ background: '#00679A1a' }}>
                                    {f.icone || FAMILLE_ICONS[i % FAMILLE_ICONS.length]}
                                </span>
                                <span className="rounded-full bg-blue-50 px-2 py-0.5 text-xs font-semibold text-blue-700">
                                    #{f.ordre}
                                </span>
                            </div>
                            <h2 className="text-base font-bold text-slate-900 mb-1 group-hover:text-blue-600 transition-colors">{f.nom}</h2>
                            {f.description && <p className="text-sm text-slate-500 flex-1">{f.description}</p>}
                            <div className="mt-4 flex items-center justify-between">
                                <div className="flex items-center gap-2">
                                    <span className="text-xs font-semibold text-blue-600 group-hover:underline">Voir les métiers →</span>
                                </div>
                                <div className="flex gap-1">
                                    <button
                                        onClick={e => openEdit(e, f)}
                                        className="rounded-lg p-1.5 text-slate-300 hover:bg-sky-50 hover:text-sky-600 transition-colors opacity-0 group-hover:opacity-100"
                                    >✏️</button>
                                    <button
                                        onClick={e => { e.stopPropagation(); handleDelete(f.id, f.nom) }}
                                        className="rounded-lg p-1.5 text-slate-300 hover:bg-red-50 hover:text-red-500 transition-colors opacity-0 group-hover:opacity-100"
                                    >🗑️</button>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            )}

            {!loading && familles.length === 0 && (
                <div className="flex flex-col items-center py-16 rounded-2xl border border-dashed border-slate-200 bg-white">
                    <span className="text-5xl mb-4">🏛</span>
                    <p className="text-slate-500">Aucune famille. Commencez par en créer une.</p>
                </div>
            )}

            <LogoFooter />
        </div>
    )
}
