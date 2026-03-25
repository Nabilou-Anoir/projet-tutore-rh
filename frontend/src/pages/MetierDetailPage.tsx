import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { metierApi, activiteApi, metierCompetenceApi, competenceSIApi } from '../utils/metiers.service'
import type { Metier, Activite, MetierCompetence, CompetenceSI } from '../types/referentiel'
import FormationModal from '../components/Referentiel/FormationModal'
import NiveauBadge from '../components/Referentiel/NiveauBadge'
import { NIVEAUX_SI } from '../types/referentiel'

type Tab = 'activites' | 'competences'

export default function MetierDetailPage() {
    const { id } = useParams<{ id: string }>()
    const metierId = Number(id)

    const [metier, setMetier] = useState<Metier | null>(null)
    const [activites, setActivites] = useState<Activite[]>([])
    const [competences, setCompetences] = useState<MetierCompetence[]>([])
    const [allCompetences, setAllCompetences] = useState<CompetenceSI[]>([])
    const [tab, setTab] = useState<Tab>('activites')
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [success, setSuccess] = useState<string | null>(null)

    // Activité form
    const [showActiviteForm, setShowActiviteForm] = useState(false)
    const [editActivite, setEditActivite] = useState<Activite | null>(null)
    const [activiteForm, setActiviteForm] = useState({ libelle: '', description: '', ordre: '' })

    // Compétence form
    const [showCompForm, setShowCompForm] = useState(false)
    const [compType, setCompType] = useState<'catalog' | 'custom'>('catalog')
    const [compForm, setCompForm] = useState({
        competenceId: '',
        competenceNom: '',
        competenceDescription: '',
        niveauRequis: '1',
        obligatoire: false,
        ordre: ''
    })
    const [editComp, setEditComp] = useState<MetierCompetence | null>(null)
    const [editCompForm, setEditCompForm] = useState({ niveauRequis: '1', obligatoire: false })

    const [selectedCompForFormations, setSelectedCompForFormations] = useState<CompetenceSI | null>(null)

    const notify = (msg: string) => { setSuccess(msg); setTimeout(() => setSuccess(null), 3000) }

    // Metier edit form
    const [showMetierForm, setShowMetierForm] = useState(false)
    const [metierForm, setMetierForm] = useState({ titre: '', description: '', missionCourte: '', actif: true })
    const [saving, setSaving] = useState(false)

    const loadMetier = () => metierApi.getById(metierId).then(setMetier)
    const loadActivites = () => activiteApi.list(metierId).then(setActivites)
    const loadCompetences = () => metierCompetenceApi.list(metierId).then(list => {
        // Sort by level descending (Expert=4 to Notions=1)
        const sorted = [...list].sort((a, b) => {
            const valA = Number(a.niveauRequis) || 0
            const valB = Number(b.niveauRequis) || 0
            return valB - valA
        })
        setCompetences(sorted)
    })
    const loadAllCompetences = () => competenceSIApi.list({ size: 500 }).then(r => setAllCompetences(r.content))

    const loadAll = (silent = false) => {
        if (!silent) setLoading(true)
        Promise.all([loadMetier(), loadActivites(), loadCompetences(), loadAllCompetences()])
            .catch(() => setError('Erreur lors du chargement'))
            .finally(() => setLoading(false))
    }

    useEffect(() => {
        loadAll()
    }, [metierId])

    // ─── Métier ──────────────────────────────────────────────────────────────────
    const openEditMetier = () => {
        if (!metier) return
        setMetierForm({
            titre: metier.titre,
            description: metier.description || '',
            missionCourte: metier.missionCourte || '',
            actif: metier.actif
        })
        setShowMetierForm(true)
    }

    const handleUpdateMetier = async (e: React.FormEvent) => {
        e.preventDefault()
        setSaving(true)
        try {
            await metierApi.update(metierId, metierForm)
            setShowMetierForm(false)
            loadMetier()
            notify('Métier mis à jour')
        } catch { setError('Erreur lors de la mise à jour du métier') }
        finally { setSaving(false) }
    }

    // ─── Activités ───────────────────────────────────────────────────────────────
    const openEditActivite = (a: Activite) => {
        setEditActivite(a)
        setActiviteForm({ libelle: a.libelle, description: a.description ?? '', ordre: String(a.ordre ?? '') })
    }

    const handleSaveActivite = async (e: React.FormEvent) => {
        e.preventDefault()
        setSaving(true)
        try {
            if (editActivite) {
                await activiteApi.update(metierId, editActivite.id, { libelle: activiteForm.libelle, description: activiteForm.description, ordre: parseInt(activiteForm.ordre) || undefined })
                setEditActivite(null)
                notify('Activité modifiée')
            } else {
                await activiteApi.create(metierId, { libelle: activiteForm.libelle, description: activiteForm.description, ordre: parseInt(activiteForm.ordre) || undefined })
                setShowActiviteForm(false)
                notify('Activité ajoutée')
            }
            setActiviteForm({ libelle: '', description: '', ordre: '' })
            loadActivites()
        } catch { setError('Erreur lors de la sauvegarde') }
        finally { setSaving(false) }
    }

    const handleDeleteActivite = async (a: Activite) => {
        if (!confirm(`Supprimer l'activité "${a.libelle}" ?`)) return
        try { await activiteApi.delete(metierId, a.id); loadActivites(); notify('Activité supprimée') }
        catch (err: any) { setError(err.message || 'Erreur lors de la suppression') }
    }

    // ─── Compétences ─────────────────────────────────────────────────────────────
    const handleAddCompetence = async (e: React.FormEvent) => {
        e.preventDefault()
        setSaving(true)
        try {
            const payload: any = {
                niveauRequis: parseInt(compForm.niveauRequis),
                obligatoire: compForm.obligatoire,
                ordre: parseInt(compForm.ordre) || undefined,
            }

            if (compType === 'catalog') {
                payload.competenceId = parseInt(compForm.competenceId)
            } else {
                payload.competenceNom = compForm.competenceNom
                payload.competenceDescription = compForm.competenceDescription
            }

            await metierCompetenceApi.add(metierId, payload)

            setCompForm({
                competenceId: '',
                competenceNom: '',
                competenceDescription: '',
                niveauRequis: '1',
                obligatoire: false,
                ordre: ''
            })
            setShowCompForm(false)
            setCompType('catalog')
            loadCompetences()
            loadAllCompetences() // Refresh in case a new custom was created
            notify('Compétence ajoutée')
        } catch (err: any) {
            setError(err.message?.includes('409') || err.message?.includes('existe') ? 'Cette compétence est déjà liée à ce métier' : 'Erreur lors de l\'ajout')
        } finally { setSaving(false) }
    }

    const handleUpdateCompetence = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!editComp) return
        try {
            await metierCompetenceApi.update(metierId, editComp.competenceId, { niveauRequis: parseInt(editCompForm.niveauRequis), obligatoire: editCompForm.obligatoire })
            setEditComp(null)
            loadCompetences()
            notify('Niveau requis mis à jour')
        } catch { setError('Erreur lors de la mise à jour') }
        finally { setSaving(false) }
    }

    const handleRemoveCompetence = async (c: MetierCompetence) => {
        if (!confirm(`Retirer "${c.competenceNom}" du profil de ce métier ?`)) return
        try { await metierCompetenceApi.remove(metierId, c.competenceId); loadCompetences(); notify('Compétence retirée') }
        catch (err: any) { setError(err.message || 'Erreur lors de la suppression') }
    }

    const linkedIds = new Set(competences.map(c => c.competenceId))
    const availableCompetences = allCompetences.filter(c => !linkedIds.has(c.id))

    return (
        <div className="mx-auto max-w-5xl flex flex-col gap-6 px-4 py-8 min-h-screen">
            {/* Header */}
            <header className="rounded-3xl p-8 text-white shadow-xl" style={{ background: 'linear-gradient(135deg, #1e3a5f 0%, #2563eb 60%, #0ea5e9 100%)' }}>
                {metier?.familleId && (
                    <Link to={`/referentiel/famille/${metier.familleId}`} className="text-sm text-blue-200 hover:text-white">
                        ← {metier.familleNom || 'Famille'}
                    </Link>
                )}
                {loading && !metier ? <h1 className="mt-2 text-2xl font-bold opacity-50">Chargement…</h1> : (
                    <>
                        <div className="flex items-center justify-between mt-2">
                            <div className="flex items-center gap-3">
                                <h1 className="text-2xl font-bold">{metier?.titre}</h1>
                                {metier && !metier.actif && <span className="rounded-full bg-white/20 px-3 py-0.5 text-xs">Inactif</span>}
                            </div>
                            <button onClick={openEditMetier} className="rounded-xl bg-white/10 px-4 py-2 text-sm font-semibold text-white hover:bg-white/20 transition-all">✏️ Modifier</button>
                        </div>
                        {metier?.description ? (
                            <p className="mt-2 text-blue-100 text-sm leading-relaxed max-w-4xl">{metier.description}</p>
                        ) : metier?.missionCourte && (
                            <p className="mt-1 text-blue-100 font-medium">{metier.missionCourte}</p>
                        )}
                    </>
                )}
            </header>

            {/* Metier edit modal */}
            {showMetierForm && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => setShowMetierForm(false)}>
                    <div className="w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl" onClick={e => e.stopPropagation()}>
                        <h3 className="mb-4 text-lg font-bold text-slate-900">Modifier le métier</h3>
                        <form onSubmit={handleUpdateMetier} className="flex flex-col gap-4">
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Titre *</label>
                                <input value={metierForm.titre} onChange={e => setMetierForm({ ...metierForm, titre: e.target.value })} required
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Mission courte</label>
                                <input value={metierForm.missionCourte} onChange={e => setMetierForm({ ...metierForm, missionCourte: e.target.value })}
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                                <textarea value={metierForm.description} onChange={e => setMetierForm({ ...metierForm, description: e.target.value })} rows={4}
                                    className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100" />
                            </div>
                            <div className="flex items-center gap-3">
                                <input type="checkbox" id="metierActif" checked={metierForm.actif} onChange={e => setMetierForm({ ...metierForm, actif: e.target.checked })}
                                    className="h-4 w-4 rounded text-blue-600" />
                                <label htmlFor="metierActif" className="text-sm text-slate-700">Métier actif</label>
                            </div>
                            <div className="flex justify-end gap-3 pt-2">
                                <button type="button" onClick={() => setShowMetierForm(false)} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-slate-100">Annuler</button>
                                <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                    {saving ? 'Sauvegarde…' : 'Enregistrer'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {/* Notifications */}
            {success && <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div>}
            {error && (
                <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 flex justify-between">
                    {error}<button onClick={() => setError(null)}>✕</button>
                </div>
            )}

            {/* Tabs */}
            <div className="flex border-b border-slate-200">
                {(['activites', 'competences'] as Tab[]).map(t => (
                    <button
                        key={t}
                        onClick={() => setTab(t)}
                        className={`px-5 py-3 text-sm font-semibold border-b-2 transition-colors ${tab === t ? 'border-blue-600 text-blue-600' : 'border-transparent text-slate-500 hover:text-slate-700'}`}
                    >
                        {t === 'activites' ? `📋 Activités (${activites.length})` : `🎯 Compétences requises (${competences.length})`}
                    </button>
                ))}
            </div>

            {/* ── ACTIVITÉS ── */}
            {tab === 'activites' && (
                <div className="flex flex-col gap-4">
                    <div className="flex justify-end">
                        <button onClick={() => { setShowActiviteForm(true); setEditActivite(null); setActiviteForm({ libelle: '', description: '', ordre: '' }) }}
                            className="flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold text-white shadow" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                            + Ajouter une activité
                        </button>
                    </div>

                    {(showActiviteForm || editActivite) && (
                        <div className="rounded-2xl border border-blue-100 bg-blue-50 p-5">
                            <h4 className="mb-3 font-semibold text-slate-800">{editActivite ? 'Modifier l\'activité' : 'Nouvelle activité'}</h4>
                            <form onSubmit={handleSaveActivite} className="grid grid-cols-1 gap-3 sm:grid-cols-2">
                                <div className="sm:col-span-2">
                                    <input value={activiteForm.libelle} onChange={e => setActiviteForm({ ...activiteForm, libelle: e.target.value })} required placeholder="Libellé *"
                                        className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100 bg-white" />
                                </div>
                                <div className="sm:col-span-2">
                                    <input value={activiteForm.description} onChange={e => setActiviteForm({ ...activiteForm, description: e.target.value })} placeholder="Description"
                                        className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100 bg-white" />
                                </div>
                                <input value={activiteForm.ordre} onChange={e => setActiviteForm({ ...activiteForm, ordre: e.target.value })} type="number" placeholder="Ordre"
                                    className="rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100 bg-white w-28" />
                                <div className="flex gap-2 justify-end items-center">
                                    <button type="button" onClick={() => { setShowActiviteForm(false); setEditActivite(null) }} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-white">Annuler</button>
                                    <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                        {saving ? 'Chargement…' : (editActivite ? 'Mettre à jour' : 'Ajouter')}
                                    </button>
                                </div>
                            </form>
                        </div>
                    )}

                    {activites.length === 0 ? (
                        <div className="rounded-2xl border border-dashed border-slate-200 bg-white py-12 text-center text-slate-400">Aucune activité pour ce métier</div>
                    ) : (
                        activites.map((a, i) => (
                            <div key={a.id}
                                className="animate-in flex items-start gap-4 rounded-2xl border border-slate-100 bg-white p-4 shadow-sm hover:shadow-md transition-all"
                                style={{ animationDelay: `${i * 30}ms` }}
                            >
                                <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-blue-50 text-xs font-bold text-blue-600">{a.ordre ?? i + 1}</span>
                                <div className="flex-1">
                                    <p className="font-semibold text-slate-900">{a.libelle}</p>
                                    {a.description && <p className="text-sm text-slate-500 mt-0.5">{a.description}</p>}
                                </div>
                                <div className="flex gap-1">
                                    <button onClick={() => openEditActivite(a)} className="rounded-lg p-1.5 text-slate-400 hover:bg-sky-50 hover:text-sky-600 transition-colors">✏️</button>
                                    <button onClick={() => handleDeleteActivite(a)} className="rounded-lg p-1.5 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors">🗑️</button>
                                </div>
                            </div>
                        ))
                    )}
                </div>
            )}

            {/* ── COMPÉTENCES ── */}
            {tab === 'competences' && (
                <div className="flex flex-col gap-4">
                    <div className="flex justify-end gap-3">
                        <Link
                            to="/referentiel/competences"
                            className="flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-4 py-2 text-sm font-semibold text-slate-700 shadow-sm transition-all hover:bg-slate-50 active:scale-95"
                        >
                            📘 Catalogue Compétences
                        </Link>
                        <button onClick={() => setShowCompForm(true)}
                            className="flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold text-white shadow" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                            + Ajouter une compétence
                        </button>
                    </div>

                    {showCompForm && (
                        <div className="rounded-2xl border border-blue-100 bg-blue-50 p-5">
                            <h4 className="mb-3 font-semibold text-slate-800">Ajouter une compétence</h4>

                            <div className="mb-4 flex gap-2">
                                <button
                                    type="button"
                                    onClick={() => setCompType('catalog')}
                                    className={`rounded-lg px-3 py-1.5 text-xs font-bold transition-all ${compType === 'catalog' ? 'bg-blue-600 text-white shadow' : 'bg-white text-slate-500 hover:bg-slate-50 border border-slate-200'}`}
                                >
                                    Depuis le catalogue
                                </button>
                                <button
                                    type="button"
                                    onClick={() => setCompType('custom')}
                                    className={`rounded-lg px-3 py-1.5 text-xs font-bold transition-all ${compType === 'custom' ? 'bg-blue-600 text-white shadow' : 'bg-white text-slate-500 hover:bg-slate-50 border border-slate-200'}`}
                                >
                                    Saisie manuelle
                                </button>
                            </div>

                            <form onSubmit={handleAddCompetence} className="grid grid-cols-1 gap-3 sm:grid-cols-2">
                                {compType === 'catalog' ? (
                                    <div className="sm:col-span-2">
                                        <select value={compForm.competenceId} onChange={e => setCompForm({ ...compForm, competenceId: e.target.value })} required
                                            className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 bg-white">
                                            <option value="">-- Choisir une compétence du référentiel --</option>
                                            {availableCompetences.map(c => <option key={c.id} value={c.id}>{c.nom} {c.description ? `(${c.description})` : ''}</option>)}
                                        </select>
                                    </div>
                                ) : (
                                    <>
                                        <div className="sm:col-span-2">
                                            <input
                                                value={compForm.competenceNom}
                                                onChange={e => setCompForm({ ...compForm, competenceNom: e.target.value })}
                                                required
                                                placeholder="Nom de la compétence (ex: React JS) *"
                                                className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100 bg-white"
                                            />
                                        </div>
                                        <div className="sm:col-span-2">
                                            <input
                                                value={compForm.competenceDescription}
                                                onChange={e => setCompForm({ ...compForm, competenceDescription: e.target.value })}
                                                placeholder="Description courte (optionnel)"
                                                className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100 bg-white"
                                            />
                                        </div>
                                    </>
                                )}
                                <div>
                                    <label className="mb-1 block text-xs font-medium text-slate-600">Niveau requis</label>
                                    <select value={compForm.niveauRequis} onChange={e => setCompForm({ ...compForm, niveauRequis: e.target.value })}
                                        className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 bg-white">
                                        {NIVEAUX_SI.map(n => <option key={n.value} value={n.value}>{n.value} – {n.label}</option>)}
                                    </select>
                                </div>
                                <div className="flex items-center gap-3 pt-4">
                                    <input type="checkbox" id="oblig" checked={compForm.obligatoire} onChange={e => setCompForm({ ...compForm, obligatoire: e.target.checked })}
                                        className="h-4 w-4 rounded text-blue-600" />
                                    <label htmlFor="oblig" className="text-sm text-slate-700">Obligatoire</label>
                                </div>
                                <div className="flex gap-2 justify-end items-center sm:col-span-2">
                                    <button type="button" onClick={() => { setShowCompForm(false); setCompType('catalog') }} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-white border border-transparent">Annuler</button>
                                    <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                        {saving ? 'Ajout…' : 'Ajouter'}
                                    </button>
                                </div>
                            </form>
                        </div>
                    )}

                    {/* Edit niveau modal */}
                    {editComp && (
                        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={() => setEditComp(null)}>
                            <div className="w-full max-w-sm rounded-2xl bg-white p-6 shadow-2xl" onClick={e => e.stopPropagation()}>
                                <h4 className="mb-4 font-bold text-slate-900">Modifier : {editComp.competenceNom}</h4>
                                <form onSubmit={handleUpdateCompetence} className="flex flex-col gap-4">
                                    <div>
                                        <label className="mb-1 block text-sm font-medium text-slate-700">Niveau requis</label>
                                        <select value={editCompForm.niveauRequis} onChange={e => setEditCompForm({ ...editCompForm, niveauRequis: e.target.value })}
                                            className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 bg-white">
                                            {NIVEAUX_SI.map(n => <option key={n.value} value={n.value}>{n.value} – {n.label}</option>)}
                                        </select>
                                    </div>
                                    <div className="flex items-center gap-3">
                                        <input type="checkbox" id="editOblig" checked={editCompForm.obligatoire} onChange={e => setEditCompForm({ ...editCompForm, obligatoire: e.target.checked })}
                                            className="h-4 w-4 rounded text-blue-600" />
                                        <label htmlFor="editOblig" className="text-sm text-slate-700">Obligatoire</label>
                                    </div>
                                    <div className="flex justify-end gap-2 pt-2">
                                        <button type="button" onClick={() => setEditComp(null)} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-slate-100">Annuler</button>
                                        <button type="submit" disabled={saving} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                            {saving ? 'Mise à jour…' : 'Mettre à jour'}
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    )}

                    {competences.length === 0 ? (
                        <div className="rounded-2xl border border-dashed border-slate-200 bg-white py-12 text-center text-slate-400">Aucune compétence liée à ce métier</div>
                    ) : (
                        competences.map((c, i) => (
                            <div key={c.competenceId}
                                className="animate-in flex items-center gap-4 rounded-2xl border border-slate-100 bg-white p-4 shadow-sm hover:shadow-md transition-all"
                                style={{ animationDelay: `${i * 30}ms` }}
                            >
                                <div className="flex-1">
                                    <div className="flex items-center gap-2 flex-wrap">
                                        <button 
                                            onClick={() => setSelectedCompForFormations({ id: c.competenceId, nom: c.competenceNom, description: c.competenceDescription })}
                                            className="font-semibold text-slate-900 hover:text-blue-600 transition-colors text-left"
                                        >
                                            {c.competenceNom}
                                        </button>
                                        <NiveauBadge niveau={c.niveauRequis} />
                                        {c.obligatoire && <span className="rounded-full bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-700">Obligatoire</span>}
                                    </div>
                                    {c.competenceDescription && <p className="text-sm text-slate-500 mt-0.5">{c.competenceDescription}</p>}
                                </div>
                                <div className="flex gap-1">
                                    <button onClick={() => { setEditComp(c); setEditCompForm({ niveauRequis: String(c.niveauRequis), obligatoire: c.obligatoire }) }}
                                        className="rounded-lg p-1.5 text-slate-400 hover:bg-sky-50 hover:text-sky-600 transition-colors">✏️</button>
                                    <button onClick={() => handleRemoveCompetence(c)} className="rounded-lg p-1.5 text-slate-400 hover:bg-red-50 hover:text-red-500 transition-colors">🗑️</button>
                                </div>
                            </div>
                        ))
                    )}
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
