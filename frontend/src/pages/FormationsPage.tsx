import { useEffect, useMemo, useState } from 'react'
import { formationApi, competenceSIApi } from '../utils/metiers.service'
import type { Formation, CompetenceSI } from '../types/referentiel'
import { useAuth } from '../contexts/AuthContext'
import LogoFooter from '../components/LogoFooter'

const masteryLevels = [
    {
        id: 'level-1',
        icon: '🟢',
        title: 'Niveau 1 — Notions',
        badgeClass: 'bg-emerald-100 text-emerald-700',
        borderClass: 'border-emerald-100',
        definition: 'Le niveau Notions correspond à une compréhension générale d’une compétence. Les bases théoriques sont acquises mais la compétence n’est pas encore mobilisée opérationnellement.',
        characteristics: [
            'Compréhension des concepts clés et des enjeux',
            'Capacité à expliquer le sujet de manière simple',
            'Pas ou très peu de pratique réelle'
        ],
        autonomy: 'Autonomie : très faible, nécessite un encadrement constant',
        complexity: 'Complexité : situations simples ou théoriques',
        responsibility: 'Responsabilité : aucune responsabilité opérationnelle',
        observables: [
            'Suit des formations ou des présentations',
            'Participe aux échanges sans intervenir techniquement',
            'Pose des questions pertinentes'
        ]
    },
    {
        id: 'level-2',
        icon: '🔵',
        title: 'Niveau 2 — Intermédiaire',
        badgeClass: 'bg-sky-100 text-sky-700',
        borderClass: 'border-sky-100',
        definition: 'Le niveau Intermédiaire correspond à une capacité à mettre en œuvre la compétence dans des situations courantes, en s’appuyant sur des méthodes ou des procédures existantes.',
        characteristics: [
            'Application concrète dans des cas standards',
            'Utilisation de bonnes pratiques existantes',
            'Résolution de problèmes simples'
        ],
        autonomy: 'Autonomie : partielle, validation nécessaire sur les points sensibles',
        complexity: 'Complexité : situations courantes, peu critiques',
        responsibility: 'Responsabilité : contribution à une activité ou un projet',
        observables: [
            'Réalise des tâches avec appui ou supervision',
            'Suit des procédures ou des standards définis',
            'Identifie et corrige des erreurs simples'
        ]
    },
    {
        id: 'level-3',
        icon: '🟠',
        title: 'Niveau 3 — Avancé',
        badgeClass: 'bg-amber-100 text-amber-700',
        borderClass: 'border-amber-100',
        definition: 'Le niveau Avancé correspond à une maîtrise opérationnelle permettant de travailler en autonomie sur des situations variées, y compris complexes.',
        characteristics: [
            'Adaptation aux contextes et contraintes',
            'Résolution de problèmes complexes',
            'Contribution active à l’amélioration des pratiques'
        ],
        autonomy: 'Autonomie : élevée, travail en autonomie',
        complexity: 'Complexité : situations variées et complexes',
        responsibility: 'Responsabilité : responsabilité de livrables ou de périmètre',
        observables: [
            'Propose des solutions adaptées',
            'Prend des décisions techniques ou fonctionnelles',
            'Accompagne ou aide d’autres collaborateurs'
        ]
    },
    {
        id: 'level-4',
        icon: '🔴',
        title: 'Niveau 4 — Expert',
        badgeClass: 'bg-rose-100 text-rose-700',
        borderClass: 'border-rose-100',
        definition: 'Le niveau Expert correspond à une maîtrise complète avec capacité de pilotage, de structuration et de diffusion de la compétence à l’échelle d’une organisation.',
        characteristics: [
            'Vision globale et stratégique',
            'Définition des standards et des bonnes pratiques',
            'Intervention sur des situations critiques ou inédites'
        ],
        autonomy: 'Autonomie : totale',
        complexity: 'Complexité : situations critiques, transverses ou incertaines',
        responsibility: 'Responsabilité : responsabilité stratégique ou organisationnelle',
        observables: [
            'Définit des référentiels, normes ou architectures',
            'Forme et accompagne les équipes',
            'Est identifié comme référent ou expert'
        ]
    }
]

const masteryMatrixColumns = ['Notions', 'Intermédiaire', 'Avancé', 'Expert']

const masteryMatrix = [
    { criteria: 'Autonomie', values: ['Faible', 'Partielle', 'Élevée', 'Totale'] },
    { criteria: 'Complexité', values: ['Simple', 'Standard', 'Complexe', 'Critique'] },
    { criteria: 'Responsabilité', values: ['Aucune', 'Contribution', 'Livrable', 'Stratégique'] },
    { criteria: 'Impact', values: ['Individuel', 'Activité', 'Projet', 'Organisation'] },
    { criteria: 'Rôle', values: ['Comprend', 'Applique', 'Maîtrise', 'Structure'] }
]

export default function FormationsPage() {
    const [formations, setFormations] = useState<Formation[]>([])
    const [competences, setCompetences] = useState<CompetenceSI[]>([])
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [success, setSuccess] = useState<string | null>(null)
    const [saving, setSaving] = useState(false)
    const [catalogView, setCatalogView] = useState<'formations' | 'competences' | 'levels'>('formations')
    const [searchQuery, setSearchQuery] = useState('')
    const [showCompetenceForm, setShowCompetenceForm] = useState(false)
    const [competenceForm, setCompetenceForm] = useState({ nom: '', description: '' })
    const [savingCompetence, setSavingCompetence] = useState(false)
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

    const fetchAllCompetences = async () => {
        const buffer: CompetenceSI[] = []
        let page = 0
        const size = 200
        let totalPages = 1
        while (page < totalPages) {
            const res = await competenceSIApi.list({ page, size })
            buffer.push(...res.content)
            totalPages = res.totalPages || 1
            page += 1
            if (res.totalPages === 0) break
        }
        return buffer
    }

    const load = () => {
        setLoading(true)
        Promise.all([formationApi.list(), fetchAllCompetences()])
            .then(([f, allCompetences]) => {
                setFormations(f)
                setCompetences(allCompetences)
                setError(null)
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

    const openCreateCompetence = () => {
        if (!guardRh()) return
        setCompetenceForm({ nom: '', description: '' })
        setShowCompetenceForm(true)
    }

    const handleSaveCompetence = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!guardRh()) return
        setSavingCompetence(true)
        try {
            await competenceSIApi.create({ nom: competenceForm.nom, description: competenceForm.description })
            notify('Compétence créée')
            setShowCompetenceForm(false)
            setCompetenceForm({ nom: '', description: '' })
            load()
        } catch {
            setError('Erreur lors de la création de la compétence')
        } finally {
            setSavingCompetence(false)
        }
    }

    const normalizedSearch = searchQuery.trim().toLowerCase()
    const filteredFormations = useMemo(() => {
        if (!normalizedSearch) return formations
        return formations.filter((f) => {
            const target = `${f.nom ?? ''} ${f.description ?? ''} ${f.organisme ?? ''}`.toLowerCase()
            return target.includes(normalizedSearch)
        })
    }, [formations, normalizedSearch])

    const filteredCompetences = useMemo(() => {
        if (!normalizedSearch) return competences
        return competences.filter((c) => {
            const target = `${c.nom ?? ''} ${c.description ?? ''}`.toLowerCase()
            return target.includes(normalizedSearch)
        })
    }, [competences, normalizedSearch])

    return (
        <div className="mx-auto max-w-6xl flex flex-col gap-6 px-4 py-8 min-h-screen">
            <header className="animate-in rounded-3xl p-8 text-white shadow-xl" style={{ background: '#323366' }}>
                <h1 className="mt-2 text-2xl font-bold">Catalogue Formations & Compétences</h1>
                <p className="mt-2 text-blue-100 text-sm">Retrouvez l’ensemble des formations et des compétences référencées au même endroit.</p>
            </header>

            {success && <div className="animate-in rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div>}
            {error && (
                <div className="animate-in rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 flex justify-between">
                    {error}<button onClick={() => setError(null)}>✕</button>
                </div>
            )}

            {!canEdit && (
                <div className="animate-in rounded-xl border border-amber-100 bg-amber-50 px-4 py-3 text-sm text-amber-700">
                    Mode lecture seule activé. Connectez-vous en RH pour modifier le catalogue.
                </div>
            )}

            {loading ? (
                <div className="flex justify-center py-20">
                    <div className="h-10 w-10 animate-spin rounded-full border-4 border-blue-100 border-t-blue-600" />
                </div>
            ) : (
                <section className="animate-in rounded-3xl border border-slate-200 bg-white/80 p-6 shadow-sm space-y-8">
                    <div className="flex flex-col gap-4">
                        <div>
                            <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Catalogue global</p>
                            <h2 className="text-xl font-semibold text-slate-900 whitespace-nowrap">Formations & Compétences</h2>
                            <p className="text-sm text-slate-500">
                                {formations.length} formation{formations.length > 1 ? 's' : ''} · {competences.length} compétence{competences.length > 1 ? 's' : ''}
                            </p>
                        </div>
                        <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-end w-full lg:w-auto">
                            <div className="w-full sm:w-72 lg:w-96">
                                <label className="sr-only" htmlFor="catalog-search">Recherche</label>
                                <input
                                    id="catalog-search"
                                    type="search"
                                    value={searchQuery}
                                    onChange={(e) => setSearchQuery(e.target.value)}
                                    placeholder={
                                        catalogView === 'formations'
                                            ? 'Rechercher une formation…'
                                            : catalogView === 'competences'
                                                ? 'Rechercher une compétence…'
                                                : 'Recherche désactivée pour cette vue'
                                    }
                                    disabled={catalogView === 'levels'}
                                    className={`w-full rounded-2xl border px-4 py-2 text-sm text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-100 ${catalogView === 'levels'
                                        ? 'border-slate-200 bg-slate-50 text-slate-400'
                                        : 'border-slate-200 focus:border-sky-500'}`}
                                />
                            </div>
                            <div className="inline-flex rounded-2xl bg-slate-100 p-1">
                                <button
                                    type="button"
                                    onClick={() => setCatalogView('formations')}
                                    className={`rounded-xl px-4 py-2 text-xs font-semibold transition-all ${catalogView === 'formations' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-900'}`}
                                >
                                    Formations
                                </button>
                                <button
                                    type="button"
                                    onClick={() => setCatalogView('competences')}
                                    className={`rounded-xl px-4 py-2 text-xs font-semibold transition-all ${catalogView === 'competences' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-900'}`}
                                >
                                    Compétences
                                </button>
                                <button
                                    type="button"
                                    onClick={() => setCatalogView('levels')}
                                    className={`rounded-xl px-4 py-2 text-xs font-semibold transition-all text-center ${catalogView === 'levels' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-900'}`}
                                >
                                    Niveaux de maîtrise des compétences
                                </button>
                            </div>
                            {canEdit && catalogView === 'formations' && (
                                <button
                                    onClick={openCreate}
                                    className="flex items-center justify-center gap-2 rounded-xl px-4 py-2 text-xs font-semibold text-white shadow-md transition-all hover:opacity-90 active:scale-95"
                                    style={{ background: '#323366' }}
                                >
                                    + Nouvelle Formation
                                </button>
                            )}
                            {canEdit && catalogView === 'competences' && (
                                <button
                                    onClick={openCreateCompetence}
                                    className="flex items-center justify-center gap-2 rounded-xl px-4 py-2 text-xs font-semibold text-white shadow-md transition-all hover:opacity-90 active:scale-95"
                                    style={{ background: '#323366' }}
                                >
                                    + Nouvelle Compétence
                                </button>
                            )}
                        </div>
                    </div>

                    {catalogView === 'formations' ? (
                        <div className="space-y-4">
                            <div>
                                <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Formations</p>
                                <h3 className="text-lg font-semibold text-slate-900">Catalogue des formations</h3>
                            </div>
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                {filteredFormations.map((f, idx) => (
                                    <div
                                      key={f.id}
                                      className="animate-in group flex flex-col rounded-3xl border border-slate-100 bg-white p-6 shadow-sm hover:shadow-xl transition-all duration-300"
                                      style={{ animationDelay: `${idx * 40}ms` }}
                                    >
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
                                {filteredFormations.length === 0 && (
                                    <div className="md:col-span-2 rounded-3xl border-2 border-dashed border-slate-100 bg-slate-50/50 py-20 text-center">
                                        <div className="text-4xl mb-4">📂</div>
                                        <p className="text-slate-500 font-medium">
                                            {formations.length === 0
                                                ? 'Aucune formation enregistrée pour le moment.'
                                                : 'Aucune formation ne correspond à votre recherche.'}
                                        </p>
                                        {canEdit && formations.length === 0 && (
                                            <button onClick={openCreate} className="mt-4 text-blue-600 font-bold hover:underline">
                                                Ajouter votre première formation
                                            </button>
                                        )}
                                    </div>
                                )}
                            </div>
                        </div>
                    ) : catalogView === 'competences' ? (
                        <div className="space-y-4">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Compétences</p>
                                    <h3 className="text-lg font-semibold text-slate-900">Catalogue des compétences</h3>
                                </div>
                                <span className="text-xs font-semibold text-slate-400">
                                    {filteredCompetences.length} entrée{filteredCompetences.length > 1 ? 's' : ''}
                                </span>
                            </div>
                            {filteredCompetences.length === 0 ? (
                                <div className="rounded-2xl border border-dashed border-slate-200 bg-slate-50/70 px-4 py-10 text-center text-sm text-slate-500">
                                    {competences.length === 0
                                        ? 'Aucune compétence référencée pour le moment.'
                                        : 'Aucune compétence ne correspond à votre recherche.'}
                                </div>
                            ) : (
                                <div className="grid gap-3 md:grid-cols-2 max-h-[32rem] overflow-y-auto pr-1 custom-scrollbar">
                                    {filteredCompetences.map((c, idx) => (
                                        <div
                                          key={c.id}
                                          className="animate-in rounded-2xl border border-slate-100 bg-slate-50/80 p-4 shadow-sm"
                                          style={{ animationDelay: `${idx * 30}ms` }}
                                        >
                                            <p className="font-semibold text-slate-900">{c.nom}</p>
                                            {c.description ? (
                                                <p className="text-sm text-slate-500 mt-1 line-clamp-3">{c.description}</p>
                                            ) : (
                                                <p className="text-xs text-slate-400 mt-1">Pas de description</p>
                                            )}
                                        </div>
                                    ))}
                                </div>
                            )}
                        </div>
                    ) : (
                        <div className="space-y-6">
                            <div>
                                <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Référentiel interne</p>
                                <h3 className="text-lg font-semibold text-slate-900">Niveaux de maîtrise des compétences</h3>
                                <p className="text-sm text-slate-500">
                                    Utilisez cette grille pour interpréter les niveaux ANAP (1 à 4) lorsque vous associez une compétence à un métier ou à un plan de formation.
                                </p>
                            </div>
                            <div className="grid gap-4 lg:grid-cols-2">
                                {masteryLevels.map((level) => (
                                    <article
                                        key={level.id}
                                        className={`rounded-3xl border ${level.borderClass} bg-white/90 p-5 shadow-sm`}
                                    >
                                        <div className="flex items-center gap-3">
                                            <span className={`inline-flex h-10 w-10 items-center justify-center rounded-2xl text-xl font-bold ${level.badgeClass}`}>
                                                {level.icon}
                                            </span>
                                            <h4 className="text-base font-semibold text-slate-900">{level.title}</h4>
                                        </div>
                                        <p className="mt-3 text-sm text-slate-600">{level.definition}</p>
                                        <div className="mt-4 space-y-2 text-sm">
                                            <p className="font-semibold text-slate-800">Caractéristiques</p>
                                            <ul className="list-disc space-y-1 pl-5 text-slate-600">
                                                {level.characteristics.map((item) => (
                                                    <li key={`${level.id}-char-${item}`}>{item}</li>
                                                ))}
                                            </ul>
                                        </div>
                                        <div className="mt-4 space-y-1 text-sm text-slate-600">
                                            <p>{level.autonomy}</p>
                                            <p>{level.complexity}</p>
                                            <p>{level.responsibility}</p>
                                        </div>
                                        <div className="mt-4 text-sm">
                                            <p className="font-semibold text-slate-800">Indicateurs observables</p>
                                            <ul className="list-disc space-y-1 pl-5 text-slate-600">
                                                {level.observables.map((item) => (
                                                    <li key={`${level.id}-obs-${item}`}>{item}</li>
                                                ))}
                                            </ul>
                                        </div>
                                    </article>
                                ))}
                            </div>
                            <div className="rounded-3xl border border-slate-100 bg-slate-50/60 p-5">
                                <div className="flex items-center gap-2 text-slate-700">
                                    <div>
                                        <p className="text-sm font-semibold uppercase tracking-[0.3em] text-slate-500">Grille de lecture rapide</p>
                                        <p className="text-base font-semibold text-slate-900">Aide — niveaux ANAP</p>
                                    </div>
                                </div>
                                <div className="mt-4 overflow-x-auto">
                                    <table className="min-w-full divide-y divide-slate-200 text-sm">
                                        <thead className="bg-white">
                                            <tr>
                                                <th className="px-4 py-2 text-left font-semibold text-slate-500">Critère</th>
                                                {masteryMatrixColumns.map((col) => (
                                                    <th key={col} className="px-4 py-2 text-left font-semibold text-slate-500">
                                                        {col}
                                                    </th>
                                                ))}
                                            </tr>
                                        </thead>
                                        <tbody className="divide-y divide-slate-100">
                                            {masteryMatrix.map((row) => (
                                                <tr key={row.criteria} className="odd:bg-white even:bg-white/60">
                                                    <td className="px-4 py-2 font-semibold text-slate-700">{row.criteria}</td>
                                                    {row.values.map((value, index) => (
                                                        <td key={`${row.criteria}-${index}`} className="px-4 py-2 text-slate-600">
                                                            {value}
                                                        </td>
                                                    ))}
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    )}
                </section>
            )}

            {showCompetenceForm && canEdit && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm p-4" onClick={() => setShowCompetenceForm(false)}>
                    <div className="w-full max-w-lg rounded-3xl bg-white p-6 shadow-2xl" onClick={(e) => e.stopPropagation()}>
                        <h3 className="mb-4 text-lg font-bold text-slate-900">Nouvelle compétence</h3>
                        <form onSubmit={handleSaveCompetence} className="flex flex-col gap-4">
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Nom *</label>
                                <input
                                    value={competenceForm.nom}
                                    onChange={(e) => setCompetenceForm({ ...competenceForm, nom: e.target.value })}
                                    required
                                    placeholder="Ex : Gestion de projet"
                                    className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100"
                                />
                            </div>
                            <div>
                                <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                                <textarea
                                    value={competenceForm.description}
                                    onChange={(e) => setCompetenceForm({ ...competenceForm, description: e.target.value })}
                                    rows={3}
                                    placeholder="Détaillez cette compétence…"
                                    className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-100"
                                />
                            </div>
                            <div className="flex justify-end gap-3 pt-2">
                                <button type="button" onClick={() => setShowCompetenceForm(false)} className="rounded-xl px-4 py-2 text-sm text-slate-600 hover:bg-slate-100">Annuler</button>
                                <button type="submit" disabled={savingCompetence} className="rounded-xl px-5 py-2 text-sm font-semibold text-white disabled:opacity-50" style={{ background: 'linear-gradient(135deg, #2563eb, #0ea5e9)' }}>
                                    {savingCompetence ? 'Création…' : 'Créer'}
                                </button>
                            </div>
                        </form>
                    </div>
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
                                    <button type="submit" disabled={saving} className="rounded-2xl px-8 py-3 text-sm font-bold text-white shadow-lg disabled:opacity-50 transition-all hover:scale-105" style={{ background: '#00679A' }}>
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
