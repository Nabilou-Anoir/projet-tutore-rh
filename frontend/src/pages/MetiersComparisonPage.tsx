import { useCallback, useEffect, useMemo, useState } from 'react'
import NiveauBadge from '../components/Referentiel/NiveauBadge'
import type { Activite, Formation, Metier, MetierCompetence } from '../types/referentiel'
import { NIVEAUX_SI } from '../types/referentiel'
import { activiteApi, formationApi, metierApi, metierCompetenceApi } from '../utils/metiers.service'
import LogoFooter from '../components/LogoFooter'

const STORAGE_KEY = 'metiers-comparison-state-v1'

type LoadedMetier = {
  metier: Metier | null
  activites: Activite[]
  competences: MetierCompetence[]
  loading: boolean
  error: string | null
}

const createEmptyState = (): LoadedMetier => ({
  metier: null,
  activites: [],
  competences: [],
  loading: false,
  error: null,
})

const normalizeLabel = (v: string) =>
  v ? v.normalize('NFD').replace(/[\u0300-\u036f]/g, '').trim().toLowerCase() : ''

const niveauLabel = (n: number) => NIVEAUX_SI.find((x) => x.value === n)?.label ?? `Niv. ${n}`
const niveauColor = (n: number) => NIVEAUX_SI.find((x) => x.value === n)?.color ?? 'bg-slate-100 text-slate-600'

// ─── Sub-components ────────────────────────────────────────────────────────────

const SummaryCard = ({
  title,
  value,
  subtitle,
  colorClass,
}: {
  title: string
  value: number
  subtitle?: string
  colorClass: string
}) => (
  <div className="rounded-2xl border border-slate-200 bg-white/80 p-4 shadow-sm">
    <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">{title}</p>
    {subtitle && <p className="text-xs text-slate-400">{subtitle}</p>}
    <p className={`mt-2 text-3xl font-semibold ${colorClass}`}>{value}</p>
  </div>
)

const FormationPill = ({ f }: { f: Formation }) => (
  <a
    href={f.url || '#'}
    target="_blank"
    rel="noopener noreferrer"
    title={f.organisme}
    className="inline-flex items-center gap-1.5 rounded-full border border-indigo-200 bg-indigo-50 px-3 py-1 text-xs font-medium text-indigo-700 hover:bg-indigo-100 transition"
  >
    {f.nom}
    {f.organisme && <span className="text-indigo-400">· {f.organisme}</span>}
  </a>
)

// ─── Comparison mode ───────────────────────────────────────────────────────────

const ActivitiesList = ({ activites, counterpart }: { activites: Activite[]; counterpart: Set<string> }) => (
  <div>
    <h4 className="text-sm font-semibold text-slate-700">
      Activités <span className="text-slate-400">({activites.length})</span>
    </h4>
    <div className="mt-3 space-y-2">
      {activites.length === 0 && <p className="text-sm text-slate-500">Aucune activité renseignée.</p>}
      {activites.map((a) => {
        const shared = counterpart.has(normalizeLabel(a.libelle))
        return (
          <div
            key={a.id}
            className={`rounded-2xl border px-4 py-3 ${shared ? 'border-emerald-200 bg-emerald-50/60' : 'border-slate-200 bg-slate-50/60'}`}
          >
            <div className="flex items-start justify-between gap-4">
              <div>
                <p className="font-medium text-slate-900">{a.libelle}</p>
                {a.description && <p className="text-sm text-slate-500">{a.description}</p>}
              </div>
              <span className={`text-xs font-semibold uppercase ${shared ? 'text-emerald-700' : 'text-slate-400'}`}>
                {shared ? 'Commune' : 'Spécifique'}
              </span>
            </div>
          </div>
        )
      })}
    </div>
  </div>
)

const CompetencesList = ({ competences, counterpart }: { competences: MetierCompetence[]; counterpart: Set<number> }) => (
  <div>
    <h4 className="text-sm font-semibold text-slate-700">
      Compétences SI <span className="text-slate-400">({competences.length})</span>
    </h4>
    <div className="mt-3 space-y-2">
      {competences.length === 0 && <p className="text-sm text-slate-500">Aucune compétence définie.</p>}
      {competences.map((c) => {
        const shared = counterpart.has(c.competenceId)
        return (
          <div
            key={c.competenceId}
            className={`rounded-2xl border px-4 py-3 ${shared ? 'border-violet-200 bg-violet-50/60' : 'border-slate-200 bg-white'}`}
          >
            <div className="flex items-start justify-between gap-4">
              <div>
                <p className="font-medium text-slate-900">{c.competenceNom}</p>
                {c.competenceDescription && <p className="text-sm text-slate-500">{c.competenceDescription}</p>}
                <div className="mt-2 flex flex-wrap items-center gap-2">
                  <NiveauBadge niveau={c.niveauRequis} />
                  {c.obligatoire && (
                    <span className="rounded-full bg-slate-900/90 px-2 py-0.5 text-xs font-medium text-white">Obligatoire</span>
                  )}
                  <span className={`text-xs font-semibold uppercase tracking-wide ${shared ? 'text-violet-700' : 'text-slate-400'}`}>
                    {shared ? 'Commune' : 'Spécifique'}
                  </span>
                </div>
              </div>
            </div>
          </div>
        )
      })}
    </div>
  </div>
)

// ─── Evolution mode ────────────────────────────────────────────────────────────

type EvolutionSection = {
  missing: MetierCompetence[]       // dans B, pas dans A → à acquérir
  toUpgrade: { compA: MetierCompetence; compB: MetierCompetence }[]  // dans A et B mais niveau B > niveau A
  mastered: { compA: MetierCompetence; compB: MetierCompetence }[]   // dans A et B, niveau A >= niveau B
}

const EvolutionView = ({
  dataA,
  dataB,
  formations,
}: {
  dataA: LoadedMetier
  dataB: LoadedMetier
  formations: Record<number, Formation[]>
}) => {
  const evolution = useMemo<EvolutionSection>(() => {
    const mapA = new Map(dataA.competences.map((c) => [c.competenceId, c]))
    const missing: MetierCompetence[] = []
    const toUpgrade: { compA: MetierCompetence; compB: MetierCompetence }[] = []
    const mastered: { compA: MetierCompetence; compB: MetierCompetence }[] = []

    for (const compB of dataB.competences) {
      const compA = mapA.get(compB.competenceId)
      if (!compA) {
        missing.push(compB)
        continue
      }
      const labelA = niveauLabel(compA.niveauRequis)
      const labelB = niveauLabel(compB.niveauRequis)
      if (compB.niveauRequis > compA.niveauRequis && labelA !== labelB) {
        toUpgrade.push({ compA, compB })
      } else {
        mastered.push({ compA, compB })
      }
    }
    return { missing, toUpgrade, mastered }
  }, [dataA.competences, dataB.competences])

  return (
    <div className="space-y-8">
      {/* KPIs */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-3">
        <SummaryCard title="Déjà maîtrisées" value={evolution.mastered.length} subtitle="Compétences suffisantes" colorClass="text-emerald-600" />
        <SummaryCard title="À renforcer" value={evolution.toUpgrade.length} subtitle="Niveau insuffisant" colorClass="text-amber-600" />
        <SummaryCard title="À acquérir" value={evolution.missing.length} subtitle="Absentes du profil A" colorClass="text-rose-600" />
      </div>

      {/* Compétences à acquérir */}
      {evolution.missing.length > 0 && (
        <div>
          <h3 className="text-base font-bold text-rose-700 mb-3">
            Compétences à acquérir <span className="text-rose-400">({evolution.missing.length})</span>
          </h3>
          <div className="space-y-3">
            {evolution.missing.map((c) => {
              const fms = formations[c.competenceId] ?? []
              return (
                <div key={c.competenceId} className="rounded-2xl border border-rose-200 bg-rose-50/50 px-5 py-4">
                  <div className="flex items-start justify-between gap-4">
                    <div className="flex-1">
                      <p className="font-semibold text-slate-900">{c.competenceNom}</p>
                      {c.competenceDescription && <p className="text-sm text-slate-500 mt-0.5">{c.competenceDescription}</p>}
                      <div className="mt-2 flex flex-wrap items-center gap-2">
                        <span className="text-xs text-slate-400">Niveau cible :</span>
                        <span className={`rounded-full px-2 py-0.5 text-xs font-semibold ${niveauColor(c.niveauRequis)}`}>
                          {niveauLabel(c.niveauRequis)}
                        </span>
                        {c.obligatoire && (
                          <span className="rounded-full bg-rose-700 px-2 py-0.5 text-xs font-medium text-white">Obligatoire</span>
                        )}
                      </div>
                      {fms.length > 0 && (
                        <div className="mt-3">
                          <p className="text-xs font-semibold text-slate-600 mb-2">Formations disponibles :</p>
                          <div className="flex flex-wrap gap-2">
                            {fms.map((f) => <FormationPill key={f.id} f={f} />)}
                          </div>
                        </div>
                      )}
                      {fms.length === 0 && (
                        <p className="mt-2 text-xs text-slate-400 italic">Aucune formation enregistrée pour cette compétence.</p>
                      )}
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        </div>
      )}

      {/* Compétences à renforcer */}
      {evolution.toUpgrade.length > 0 && (
        <div>
          <h3 className="text-base font-bold text-amber-700 mb-3">
            Compétences à renforcer <span className="text-amber-400">({evolution.toUpgrade.length})</span>
          </h3>
          <div className="space-y-3">
            {evolution.toUpgrade.map(({ compA, compB }) => {
              const fms = formations[compB.competenceId] ?? []
              return (
                <div key={compB.competenceId} className="rounded-2xl border border-amber-200 bg-amber-50/50 px-5 py-4">
                  <p className="font-semibold text-slate-900">{compB.competenceNom}</p>
                  {compB.competenceDescription && <p className="text-sm text-slate-500 mt-0.5">{compB.competenceDescription}</p>}
                  <div className="mt-2 flex flex-wrap items-center gap-3">
                    <div className="flex items-center gap-1.5">
                      <span className="text-xs text-slate-400">Niveau actuel :</span>
                      <span className={`rounded-full px-2 py-0.5 text-xs font-semibold ${niveauColor(compA.niveauRequis)}`}>
                        {niveauLabel(compA.niveauRequis)}
                      </span>
                    </div>
                    <span className="text-slate-400">→</span>
                    <div className="flex items-center gap-1.5">
                      <span className="text-xs text-slate-400">Niveau cible :</span>
                      <span className={`rounded-full px-2 py-0.5 text-xs font-semibold ${niveauColor(compB.niveauRequis)}`}>
                        {niveauLabel(compB.niveauRequis)}
                      </span>
                    </div>
                    <span className="text-xs font-semibold text-amber-600">
                      +{compB.niveauRequis - compA.niveauRequis} niveau{compB.niveauRequis - compA.niveauRequis > 1 ? 'x' : ''}
                    </span>
                  </div>
                  {fms.length > 0 && (
                    <div className="mt-3">
                      <p className="text-xs font-semibold text-slate-600 mb-2">Formations pour progresser :</p>
                      <div className="flex flex-wrap gap-2">
                        {fms.map((f) => <FormationPill key={f.id} f={f} />)}
                      </div>
                    </div>
                  )}
                </div>
              )
            })}
          </div>
        </div>
      )}

      {/* Compétences maîtrisées */}
      {evolution.mastered.length > 0 && (
        <div>
          <h3 className="text-base font-bold text-emerald-700 mb-3">
            Compétences déjà maîtrisées <span className="text-emerald-400">({evolution.mastered.length})</span>
          </h3>
          <div className="space-y-2">
            {evolution.mastered.map(({ compA, compB }) => (
              <div key={compB.competenceId} className="rounded-2xl border border-emerald-200 bg-emerald-50/40 px-5 py-3 flex items-center justify-between gap-4">
                <div>
                  <p className="font-medium text-slate-900">{compB.competenceNom}</p>
                </div>
                <div className="flex items-center gap-2 shrink-0">
                  <span className={`rounded-full px-2 py-0.5 text-xs font-semibold ${niveauColor(compA.niveauRequis)}`}>
                    {niveauLabel(compA.niveauRequis)}
                  </span>
                  {compA.niveauRequis > compB.niveauRequis && (
                    <span className="text-xs text-emerald-600 font-semibold">+{compA.niveauRequis - compB.niveauRequis} excédent</span>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}

// ─── Main page ─────────────────────────────────────────────────────────────────

const MetiersComparisonPage = () => {
  const [metiers, setMetiers] = useState<Metier[]>([])
  const [listLoading, setListLoading] = useState(true)
  const [listError, setListError] = useState<string | null>(null)
  const [mode, setMode] = useState<'comparaison' | 'evolution'>('comparaison')

  const [selectedA, setSelectedA] = useState<number | null>(null)
  const [selectedB, setSelectedB] = useState<number | null>(null)

  const [metierAData, setMetierAData] = useState<LoadedMetier>(createEmptyState())
  const [metierBData, setMetierBData] = useState<LoadedMetier>(createEmptyState())

  // formations indexed by competenceId
  const [formations, setFormations] = useState<Record<number, Formation[]>>({})

  const fetchAllMetiers = useCallback(async () => {
    setListLoading(true)
    setListError(null)
    try {
      const buf: Metier[] = []
      let page = 0
      let totalPages = 1
      while (page < totalPages) {
        const resp = await metierApi.list({ page, size: 200 })
        buf.push(...resp.content)
        totalPages = resp.totalPages || 1
        page += 1
        if (resp.totalPages === 0) break
      }
      const sorted = Array.from(new Map(buf.map((m) => [m.id, m])).values()).sort((a, b) =>
        a.titre.localeCompare(b.titre, 'fr', { sensitivity: 'base' }),
      )
      setMetiers(sorted)
    } catch (err) {
      setListError(err instanceof Error ? err.message : 'Impossible de charger les métiers')
    } finally {
      setListLoading(false)
    }
  }, [])

  useEffect(() => { fetchAllMetiers() }, [fetchAllMetiers])

  useEffect(() => {
    if (typeof window === 'undefined') return
    try {
      const raw = window.localStorage.getItem(STORAGE_KEY)
      if (!raw) return
      const saved = JSON.parse(raw) as {
        selectedA: number | null
        selectedB: number | null
        mode: 'comparaison' | 'evolution'
      }
      if (typeof saved.selectedA === 'number') setSelectedA(saved.selectedA)
      if (typeof saved.selectedB === 'number') setSelectedB(saved.selectedB)
      if (saved.mode === 'comparaison' || saved.mode === 'evolution') setMode(saved.mode)
    } catch (err) {
      console.warn('Impossible de restaurer la sélection du comparateur', err)
    }
  }, [])

  useEffect(() => {
    if (typeof window === 'undefined') return
    try {
      const payload = { selectedA, selectedB, mode }
      if (payload.selectedA !== null || payload.selectedB !== null || payload.mode !== 'comparaison') {
        window.localStorage.setItem(STORAGE_KEY, JSON.stringify(payload))
      } else {
        window.localStorage.removeItem(STORAGE_KEY)
      }
    } catch (err) {
      console.warn('Impossible de sauvegarder la sélection du comparateur', err)
    }
  }, [selectedA, selectedB, mode])

  const loadMetier = useCallback(async (id: number, setter: typeof setMetierAData) => {
    setter((p) => ({ ...p, loading: true, error: null }))
    try {
      const [metier, activites, competences] = await Promise.all([
        metierApi.getById(id),
        activiteApi.list(id),
        metierCompetenceApi.list(id),
      ])
      setter({ metier, activites, competences, loading: false, error: null })
    } catch (err) {
      setter((p) => ({ ...p, loading: false, error: err instanceof Error ? err.message : 'Chargement impossible' }))
    }
  }, [])

  useEffect(() => {
    if (!selectedA) { setMetierAData(createEmptyState()); return }
    loadMetier(selectedA, setMetierAData)
  }, [selectedA, loadMetier])

  useEffect(() => {
    if (!selectedB) { setMetierBData(createEmptyState()); return }
    loadMetier(selectedB, setMetierBData)
  }, [selectedB, loadMetier])

  // Load formations for all competences of metier B when in evolution mode
  useEffect(() => {
    if (mode !== 'evolution' || metierBData.competences.length === 0) return
    let cancelled = false
    const load = async () => {
      const entries = await Promise.all(
        metierBData.competences.map(async (c) => {
          try {
            const fms = await formationApi.getByCompetenceId(c.competenceId)
            return [c.competenceId, fms] as [number, Formation[]]
          } catch {
            return [c.competenceId, []] as [number, Formation[]]
          }
        }),
      )
      if (!cancelled) setFormations(Object.fromEntries(entries))
    }
    load()
    return () => { cancelled = true }
  }, [mode, metierBData.competences])

  const activiteKeysA = useMemo(() => new Set(metierAData.activites.map((a) => normalizeLabel(a.libelle))), [metierAData.activites])
  const activiteKeysB = useMemo(() => new Set(metierBData.activites.map((a) => normalizeLabel(a.libelle))), [metierBData.activites])
  const competenceIdsA = useMemo(() => new Set(metierAData.competences.map((c) => c.competenceId)), [metierAData.competences])
  const competenceIdsB = useMemo(() => new Set(metierBData.competences.map((c) => c.competenceId)), [metierBData.competences])

  const bothLoaded = Boolean(metierAData.metier && metierBData.metier)
  const labelA = metierAData.metier?.titre ?? 'Métier A'
  const labelB = metierBData.metier?.titre ?? 'Métier B'

  return (
    <div className="mx-auto max-w-6xl px-4 py-10">
      {/* Header */}
      <header className="animate-in mb-8 rounded-3xl border border-[#0a598c] bg-gradient-to-r from-[#16345e] via-[#114c7d] to-[#0a7abf] p-8 text-white shadow-lg">
        <h1 className="text-3xl font-semibold">Comparateur & Parcours d'évolution</h1>
        <p className="mt-3 max-w-3xl text-sm text-white/80">
          Comparez deux métiers ou simulez un parcours d'évolution : compétences communes, manquantes et formations disponibles dans la base.
        </p>
      </header>

      {/* Sélection + mode */}
      <section className="animate-in rounded-3xl border border-slate-200 bg-white/80 p-6 shadow-sm">
        <div className="flex flex-col gap-4 md:flex-row md:items-end md:justify-between">
          <div className="flex items-center gap-2">
            {bothLoaded && (
              <button
                type="button"
                onClick={() => { setSelectedA(selectedB); setSelectedB(selectedA) }}
                className="rounded-2xl bg-slate-900 px-4 py-2 text-sm font-medium text-white hover:bg-slate-800 transition"
              >
                Inverser
              </button>
            )}
          </div>
        </div>

        {listError && <p className="mt-3 rounded-2xl border border-red-200 bg-red-50 px-4 py-2 text-sm text-red-700">{listError}</p>}

        <div className="mt-6 grid gap-6 md:grid-cols-2">
          {/* Sélect A */}
          <div>
            <label className="text-xs font-semibold uppercase text-slate-500">
              {mode === 'evolution' ? 'Métier actuel (A)' : 'Métier A'}
            </label>
            <select
              value={selectedA ?? ''}
              onChange={(e) => {
                const v = e.target.value ? Number(e.target.value) : null
                setSelectedA(v)
                if (v !== null && v === selectedB) setSelectedB(null)
              }}
              className="mt-1 w-full rounded-2xl border border-slate-200 px-4 py-3 text-sm focus:border-sky-500 focus:outline-none focus:ring-2 focus:ring-sky-200"
            >
              <option value="">{listLoading ? 'Chargement…' : 'Sélectionner un métier'}</option>
              {metiers.map((m) => (
                <option key={m.id} value={m.id} disabled={m.id === selectedB}>
                  {m.titre}{m.familleNom ? ` — ${m.familleNom}` : ''}
                </option>
              ))}
            </select>
          </div>

          {/* Sélect B */}
          <div>
            <label className="text-xs font-semibold uppercase text-slate-500">
              {mode === 'evolution' ? 'Métier cible (B)' : 'Métier B'}
            </label>
            <select
              value={selectedB ?? ''}
              onChange={(e) => {
                const v = e.target.value ? Number(e.target.value) : null
                setSelectedB(v)
                if (v !== null && v === selectedA) setSelectedA(null)
              }}
              className="mt-1 w-full rounded-2xl border border-violet-200 px-4 py-3 text-sm focus:border-violet-500 focus:outline-none focus:ring-2 focus:ring-violet-200"
            >
              <option value="">{listLoading ? 'Chargement…' : 'Sélectionner un métier'}</option>
              {metiers.map((m) => (
                <option key={m.id} value={m.id} disabled={m.id === selectedA}>
                  {m.titre}{m.familleNom ? ` — ${m.familleNom}` : ''}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Mode toggle */}
        {bothLoaded && (
          <div className="mt-6 flex items-center justify-center">
            <div className="inline-flex rounded-2xl bg-slate-100 p-1 gap-1">
              <button
                type="button"
                onClick={() => setMode('comparaison')}
                className={`rounded-xl px-5 py-2.5 text-sm font-semibold transition-all ${mode === 'comparaison' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-800'}`}
              >
                Comparaison côte à côte
              </button>
              <button
                type="button"
                onClick={() => setMode('evolution')}
                className={`rounded-xl px-5 py-2.5 text-sm font-semibold transition-all ${mode === 'evolution' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-800'}`}
              >
                Parcours d'évolution A → B
              </button>
            </div>
          </div>
        )}
      </section>

      {/* ── EVOLUTION MODE ─────────────────────────────────────────────────────── */}
      {mode === 'evolution' && bothLoaded && (
        <section className="mt-8 animate-in">
          <div className="mb-4 rounded-2xl border border-sky-200 bg-sky-50 px-5 py-4">
            <p className="text-sm font-semibold text-sky-800">
              Parcours : <span className="text-sky-600">{labelA}</span>
              <span className="mx-2 text-sky-400">→</span>
              <span className="text-violet-700">{labelB}</span>
            </p>
            <p className="text-xs text-sky-600 mt-0.5">
              Analyse des compétences manquantes, à renforcer, et formations disponibles en base.
            </p>
          </div>
          <EvolutionView dataA={metierAData} dataB={metierBData} formations={formations} />
        </section>
      )}

      {/* ── COMPARAISON MODE ───────────────────────────────────────────────────── */}
      {mode === 'comparaison' && bothLoaded && (
        <>
          <section className="mt-8 space-y-10 animate-in">
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Compétences SI</p>
              <h3 className="text-lg font-semibold text-slate-900">Comparaison des compétences</h3>
              <div className="mt-4 grid gap-6 lg:grid-cols-2">
            <div className="animate-in rounded-3xl border border-slate-200 bg-white/70 p-6 shadow-sm">
                  <p className="text-xs uppercase tracking-wide text-slate-500 mb-1">Profil A</p>
                  <h4 className="text-lg font-semibold text-slate-900 mb-4">{labelA}</h4>
                  <CompetencesList competences={metierAData.competences} counterpart={competenceIdsB} />
                </div>
            <div className="animate-in rounded-3xl border border-slate-200 bg-white/70 p-6 shadow-sm">
                  <p className="text-xs uppercase tracking-wide text-slate-500 mb-1">Profil B</p>
                  <h4 className="text-lg font-semibold text-slate-900 mb-4">{labelB}</h4>
                  <CompetencesList competences={metierBData.competences} counterpart={competenceIdsA} />
                </div>
              </div>
            </div>
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Activités</p>
              <h3 className="text-lg font-semibold text-slate-900">Comparaison des activités</h3>
              <div className="mt-4 grid gap-6 lg:grid-cols-2">
                <div className="animate-in rounded-3xl border border-slate-200 bg-white/70 p-6 shadow-sm" style={{ animationDelay: '80ms' }}>
                  <p className="text-xs uppercase tracking-wide text-slate-500 mb-1">Profil A</p>
                  <h4 className="text-lg font-semibold text-slate-900 mb-4">{labelA}</h4>
                  <ActivitiesList activites={metierAData.activites} counterpart={activiteKeysB} />
                </div>
                <div className="animate-in rounded-3xl border border-slate-200 bg-white/70 p-6 shadow-sm" style={{ animationDelay: '160ms' }}>
                  <p className="text-xs uppercase tracking-wide text-slate-500 mb-1">Profil B</p>
                  <h4 className="text-lg font-semibold text-slate-900 mb-4">{labelB}</h4>
                  <ActivitiesList activites={metierBData.activites} counterpart={activiteKeysA} />
                </div>
              </div>
            </div>
          </section>
        </>
      )}

      {/* Empty state */}
      {!bothLoaded && (
        <div className="animate-in mt-12 rounded-3xl border border-dashed border-slate-300 bg-white/50 p-16 text-center">
          <p className="font-semibold text-slate-700">Sélectionnez deux métiers pour démarrer</p>
          <p className="text-sm text-slate-500 mt-1">Utilisez le mode "Parcours d'évolution" pour obtenir le plan de formation personnalisé.</p>
        </div>
      )}

      <LogoFooter />
    </div>
  )
}

export default MetiersComparisonPage
