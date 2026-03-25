import { useCallback, useEffect, useMemo, useState } from 'react'
import type { ReactNode } from 'react'
import NiveauBadge from '../components/Referentiel/NiveauBadge'
import type { Activite, Metier, MetierCompetence } from '../types/referentiel'
import { activiteApi, metierApi, metierCompetenceApi } from '../utils/metiers.service'

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

const normalizeLabel = (value: string) =>
  value
    ? value
        .normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .trim()
        .toLowerCase()
    : ''

const toneMap = {
  emerald: 'text-emerald-600',
  sky: 'text-sky-600',
  violet: 'text-violet-600',
  amber: 'text-amber-600',
} as const

const SummaryCard = ({
  title,
  value,
  tone,
  subtitle,
}: {
  title: string
  value: number
  tone: keyof typeof toneMap
  subtitle?: string
}) => (
  <div className="rounded-2xl border border-slate-200 bg-white/80 p-4 shadow-sm">
    <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">{title}</p>
    {subtitle && <p className="text-xs text-slate-500">{subtitle}</p>}
    <p className={`mt-2 text-3xl font-semibold ${toneMap[tone]}`}>{value}</p>
  </div>
)

interface MetierPanelProps {
  data: LoadedMetier
  label: string
  renderContent: (data: LoadedMetier) => ReactNode
}

const MetierPanel = ({ data, label, renderContent }: MetierPanelProps) => {
  const metierName = data.metier?.titre ?? `Sélection ${label}`

  return (
    <div className="rounded-3xl border border-slate-200 bg-white/70 p-6 shadow-sm">
      <div className="flex items-start justify-between gap-4">
        <div>
          <p className="text-xs uppercase tracking-wide text-slate-500">{label}</p>
          <h3 className="text-xl font-semibold text-slate-900">{metierName}</h3>
          {data.metier?.familleNom && <p className="text-sm text-slate-500">{data.metier.familleNom}</p>}
        </div>
        {data.loading && <span className="text-xs font-medium text-slate-500 animate-pulse">Chargement…</span>}
      </div>

      {data.error && (
        <p className="mt-3 rounded-2xl border border-red-200 bg-red-50 px-4 py-2 text-sm text-red-700">{data.error}</p>
      )}

      {!data.metier && !data.loading && (
        <p className="mt-4 text-sm text-slate-500">Choisissez un métier pour afficher ses activités et compétences.</p>
      )}

      {data.metier && <div className="mt-6">{renderContent(data)}</div>}
    </div>
  )
}

const ActivitiesList = ({ activites, counterpart }: { activites: Activite[]; counterpart: Set<string> }) => (
  <div>
    <h4 className="text-sm font-semibold text-slate-700">
      Activités <span className="text-slate-400">({activites.length})</span>
    </h4>
    <div className="mt-3 space-y-3">
      {activites.length === 0 && <p className="text-sm text-slate-500">Aucune activité n&apos;est renseignée pour ce métier.</p>}
      {activites.map((activite) => {
        const shared = counterpart.has(normalizeLabel(activite.libelle))
        return (
          <div
            key={activite.id}
            className={`rounded-2xl border px-4 py-3 ${shared ? 'border-emerald-200 bg-emerald-50/60' : 'border-slate-200 bg-slate-50/60'}`}
          >
            <div className="flex items-start justify-between gap-4">
              <div>
                <p className="font-medium text-slate-900">{activite.libelle}</p>
                {activite.description && <p className="text-sm text-slate-500">{activite.description}</p>}
              </div>
              <span className={`text-xs font-semibold uppercase ${shared ? 'text-emerald-700' : 'text-slate-500'}`}>
                {shared ? 'Commune' : 'Spécifique'}
              </span>
            </div>
          </div>
        )
      })}
    </div>
  </div>
)

const CompetencesList = ({
  competences,
  counterpart,
}: {
  competences: MetierCompetence[]
  counterpart: Set<number>
}) => (
  <div>
    <h4 className="text-sm font-semibold text-slate-700">
      Compétences SI <span className="text-slate-400">({competences.length})</span>
    </h4>
    <div className="mt-3 space-y-3">
      {competences.length === 0 && <p className="text-sm text-slate-500">Aucune compétence n&apos;est définie pour ce métier.</p>}
      {competences.map((competence) => {
        const shared = counterpart.has(competence.competenceId)
        return (
          <div
            key={competence.competenceId}
            className={`rounded-2xl border px-4 py-3 ${shared ? 'border-violet-200 bg-violet-50/60' : 'border-slate-200 bg-white'}`}
          >
            <div className="flex items-start justify-between gap-4">
              <div>
                <p className="font-medium text-slate-900">{competence.competenceNom}</p>
                {competence.competenceDescription && (
                  <p className="text-sm text-slate-500">{competence.competenceDescription}</p>
                )}
                <div className="mt-2 flex flex-wrap items-center gap-2">
                  <NiveauBadge niveau={competence.niveauRequis} />
                  {competence.obligatoire && (
                    <span className="rounded-full bg-slate-900/90 px-2 py-0.5 text-xs font-medium text-white">Obligatoire</span>
                  )}
                  <span className={`text-xs font-semibold uppercase tracking-wide ${shared ? 'text-violet-700' : 'text-slate-500'}`}>
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

const MetiersComparisonPage = () => {
  const [metiers, setMetiers] = useState<Metier[]>([])
  const [listLoading, setListLoading] = useState(true)
  const [listError, setListError] = useState<string | null>(null)
  const [search, setSearch] = useState('')

  const [selectedA, setSelectedA] = useState<number | null>(null)
  const [selectedB, setSelectedB] = useState<number | null>(null)

  const [metierAData, setMetierAData] = useState<LoadedMetier>(createEmptyState())
  const [metierBData, setMetierBData] = useState<LoadedMetier>(createEmptyState())

  const fetchAllMetiers = useCallback(async () => {
    setListLoading(true)
    setListError(null)
    try {
      const buffer: Metier[] = []
      const pageSize = 200
      let page = 0
      let totalPages = 1
      while (page < totalPages) {
        const resp = await metierApi.list({ page, size: pageSize })
        buffer.push(...resp.content)
        totalPages = resp.totalPages || totalPages
        page += 1
        if (resp.totalPages === 0) break
      }
      const map = new Map(buffer.map((item) => [item.id, item]))
      const sorted = Array.from(map.values()).sort((a, b) =>
        a.titre.localeCompare(b.titre, 'fr', { sensitivity: 'base' }),
      )
      setMetiers(sorted)
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : null
      setListError(message || 'Impossible de charger la liste des métiers')
    } finally {
      setListLoading(false)
    }
  }, [])

  useEffect(() => {
    fetchAllMetiers()
  }, [fetchAllMetiers])

  const handleSelect = (slot: 'A' | 'B', value: string) => {
    const parsed = value ? Number(value) : null
    if (slot === 'A') {
      setSelectedA(parsed)
      if (parsed !== null && parsed === selectedB) setSelectedB(null)
    } else {
      setSelectedB(parsed)
      if (parsed !== null && parsed === selectedA) setSelectedA(null)
    }
  }

  useEffect(() => {
    let cancelled = false
    if (!selectedA) {
      setMetierAData(createEmptyState())
      return () => {
        cancelled = true
      }
    }
    setMetierAData((prev) => ({ ...prev, loading: true, error: null }))
    ;(async () => {
      try {
        const [metier, activites, competences] = await Promise.all([
          metierApi.getById(selectedA),
          activiteApi.list(selectedA),
          metierCompetenceApi.list(selectedA),
        ])
        if (!cancelled) {
          setMetierAData({ metier, activites, competences, loading: false, error: null })
        }
      } catch (err: unknown) {
        const message = err instanceof Error ? err.message : null
        if (!cancelled) {
          setMetierAData((prev) => ({ ...prev, loading: false, error: message || 'Chargement impossible' }))
        }
      }
    })()
    return () => {
      cancelled = true
    }
  }, [selectedA])

  useEffect(() => {
    let cancelled = false
    if (!selectedB) {
      setMetierBData(createEmptyState())
      return () => {
        cancelled = true
      }
    }
    setMetierBData((prev) => ({ ...prev, loading: true, error: null }))
    ;(async () => {
      try {
        const [metier, activites, competences] = await Promise.all([
          metierApi.getById(selectedB),
          activiteApi.list(selectedB),
          metierCompetenceApi.list(selectedB),
        ])
        if (!cancelled) {
          setMetierBData({ metier, activites, competences, loading: false, error: null })
        }
      } catch (err: unknown) {
        const message = err instanceof Error ? err.message : null
        if (!cancelled) {
          setMetierBData((prev) => ({ ...prev, loading: false, error: message || 'Chargement impossible' }))
        }
      }
    })()
    return () => {
      cancelled = true
    }
  }, [selectedB])

  const filteredMetiers = useMemo(() => {
    const term = search.trim().toLowerCase()
    if (!term) return metiers
    return metiers.filter((metier) => {
      const titre = metier.titre.toLowerCase()
      const famille = (metier.familleNom ?? '').toLowerCase()
      return titre.includes(term) || famille.includes(term)
    })
  }, [metiers, search])

  const activiteKeysA = useMemo(
    () => new Set(metierAData.activites.map((activite) => normalizeLabel(activite.libelle))),
    [metierAData.activites],
  )
  const activiteKeysB = useMemo(
    () => new Set(metierBData.activites.map((activite) => normalizeLabel(activite.libelle))),
    [metierBData.activites],
  )

  const competenceIdsA = useMemo(
    () => new Set(metierAData.competences.map((competence) => competence.competenceId)),
    [metierAData.competences],
  )
  const competenceIdsB = useMemo(
    () => new Set(metierBData.competences.map((competence) => competence.competenceId)),
    [metierBData.competences],
  )

  const activiteSummary = useMemo(() => {
    let common = 0
    activiteKeysA.forEach((key) => {
      if (activiteKeysB.has(key)) common += 1
    })
    return {
      totalA: activiteKeysA.size,
      totalB: activiteKeysB.size,
      common,
      uniqueA: Math.max(activiteKeysA.size - common, 0),
      uniqueB: Math.max(activiteKeysB.size - common, 0),
    }
  }, [activiteKeysA, activiteKeysB])

  const competenceSummary = useMemo(() => {
    let common = 0
    competenceIdsA.forEach((id) => {
      if (competenceIdsB.has(id)) common += 1
    })
    return {
      totalA: competenceIdsA.size,
      totalB: competenceIdsB.size,
      common,
      uniqueA: Math.max(competenceIdsA.size - common, 0),
      uniqueB: Math.max(competenceIdsB.size - common, 0),
    }
  }, [competenceIdsA, competenceIdsB])

  const labelA = metierAData.metier?.titre ?? 'Métier A'
  const labelB = metierBData.metier?.titre ?? 'Métier B'

  const canSwap = Boolean(selectedA && selectedB)

  const swapSelections = () => {
    if (!canSwap) return
    setSelectedA(selectedB)
    setSelectedB(selectedA)
  }

  return (
    <div className="mx-auto max-w-6xl px-4 py-10">
      <header className="mb-8 rounded-3xl border border-slate-200 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-700 p-8 text-white shadow-lg">
        <p className="text-sm uppercase tracking-[0.25em] text-white/70">Comparateur</p>
        <h1 className="mt-2 text-3xl font-semibold">Comparer deux métiers SI</h1>
        <p className="mt-3 max-w-3xl text-sm text-white/80">
          Sélectionnez deux métiers du référentiel Cigref pour visualiser instantanément leurs activités clés et les
          compétences attendues. Les éléments communs sont mis en avant pour faciliter l&apos;identification des
          passerelles possibles entre métiers.
        </p>
      </header>

      <section className="rounded-3xl border border-slate-200 bg-white/80 p-6 shadow-sm">
        <div className="flex flex-col gap-4 md:flex-row md:items-end">
          <div className="flex-1">
            <label className="text-xs font-semibold uppercase text-slate-500">Filtrer les métiers</label>
            <input
              type="search"
              placeholder="Rechercher par titre ou famille…"
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              className="mt-1 w-full rounded-2xl border border-slate-200 px-4 py-2 text-sm focus:border-sky-500 focus:outline-none focus:ring-2 focus:ring-sky-200"
            />
          </div>
          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={swapSelections}
              disabled={!canSwap}
              className={`rounded-2xl px-4 py-2 text-sm font-medium transition ${canSwap ? 'bg-slate-900 text-white hover:bg-slate-800' : 'bg-slate-100 text-slate-400'}`}
            >
              Inverser
            </button>
            <button
              type="button"
              onClick={fetchAllMetiers}
              className="rounded-2xl border border-slate-200 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50"
            >
              Recharger
            </button>
          </div>
        </div>

        {listError && (
          <p className="mt-3 rounded-2xl border border-red-200 bg-red-50 px-4 py-2 text-sm text-red-700">{listError}</p>
        )}

        <div className="mt-6 grid gap-6 md:grid-cols-2">
          <div>
            <label className="text-xs font-semibold uppercase text-slate-500">Métier A</label>
            <select
              value={selectedA ?? ''}
              onChange={(event) => handleSelect('A', event.target.value)}
              className="mt-1 w-full rounded-2xl border border-slate-200 px-4 py-3 text-sm focus:border-sky-500 focus:outline-none focus:ring-2 focus:ring-sky-200"
            >
              <option value="">{listLoading ? 'Chargement…' : 'Sélectionner un métier'}</option>
              {filteredMetiers.map((metier) => (
                <option key={metier.id} value={metier.id} disabled={metier.id === selectedB}>
                  {metier.titre}
                  {metier.familleNom ? ` — ${metier.familleNom}` : ''}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="text-xs font-semibold uppercase text-slate-500">Métier B</label>
            <select
              value={selectedB ?? ''}
              onChange={(event) => handleSelect('B', event.target.value)}
              className="mt-1 w-full rounded-2xl border border-slate-200 px-4 py-3 text-sm focus:border-violet-500 focus:outline-none focus:ring-2 focus:ring-violet-200"
            >
              <option value="">{listLoading ? 'Chargement…' : 'Sélectionner un métier'}</option>
              {filteredMetiers.map((metier) => (
                <option key={metier.id} value={metier.id} disabled={metier.id === selectedA}>
                  {metier.titre}
                  {metier.familleNom ? ` — ${metier.familleNom}` : ''}
                </option>
              ))}
            </select>
          </div>
        </div>
      </section>

      <section className="mt-8 grid gap-6 lg:grid-cols-2">
        <div className="rounded-3xl border border-slate-200 bg-white/80 p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Activités</p>
              <h3 className="text-lg font-semibold text-slate-900">Comparaison des activités</h3>
            </div>
            <span className="text-sm text-slate-500">Profil A & B</span>
          </div>
          <div className="mt-4 grid gap-4 sm:grid-cols-3">
            <SummaryCard title="Communes" value={activiteSummary.common} tone="emerald" subtitle="Activités identiques" />
            <SummaryCard title={labelA} value={activiteSummary.uniqueA} tone="sky" subtitle="Spécifiques" />
            <SummaryCard title={labelB} value={activiteSummary.uniqueB} tone="violet" subtitle="Spécifiques" />
          </div>
        </div>

        <div className="rounded-3xl border border-slate-200 bg-white/80 p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Compétences</p>
              <h3 className="text-lg font-semibold text-slate-900">Comparaison des compétences</h3>
            </div>
            <span className="text-sm text-slate-500">Profil A & B</span>
          </div>
          <div className="mt-4 grid gap-4 sm:grid-cols-3">
            <SummaryCard title="Communes" value={competenceSummary.common} tone="emerald" subtitle="Compétences partagées" />
            <SummaryCard title={labelA} value={competenceSummary.uniqueA} tone="sky" subtitle="Spécifiques" />
            <SummaryCard title={labelB} value={competenceSummary.uniqueB} tone="violet" subtitle="Spécifiques" />
          </div>
        </div>
      </section>

      <section className="mt-8 space-y-10">
        <div>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Activités</p>
              <h3 className="text-lg font-semibold text-slate-900">Comparaison des activités</h3>
            </div>
          </div>
          <div className="mt-4 grid gap-6 lg:grid-cols-2">
            <MetierPanel
              data={metierAData}
              label="Profil A"
              renderContent={(data) => <ActivitiesList activites={data.activites} counterpart={activiteKeysB} />}
            />
            <MetierPanel
              data={metierBData}
              label="Profil B"
              renderContent={(data) => <ActivitiesList activites={data.activites} counterpart={activiteKeysA} />}
            />
          </div>
        </div>

        <div>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Compétences SI</p>
              <h3 className="text-lg font-semibold text-slate-900">Comparaison des compétences</h3>
            </div>
          </div>
          <div className="mt-4 grid gap-6 lg:grid-cols-2">
            <MetierPanel
              data={metierAData}
              label="Profil A"
              renderContent={(data) => <CompetencesList competences={data.competences} counterpart={competenceIdsB} />}
            />
            <MetierPanel
              data={metierBData}
              label="Profil B"
              renderContent={(data) => <CompetencesList competences={data.competences} counterpart={competenceIdsA} />}
            />
          </div>
        </div>
      </section>
    </div>
  )
}

export default MetiersComparisonPage
