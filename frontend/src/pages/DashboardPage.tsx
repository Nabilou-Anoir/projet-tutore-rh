import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type { FamilleOverview } from '../types/referentiel'
import { formationApi, referentielOverviewApi, competenceSIApi, metierApi } from '../utils/metiers.service'
import LogoFooter from '../components/LogoFooter'

const numberFormatter = new Intl.NumberFormat('fr-FR')

const DashboardPage = () => {
  const [overview, setOverview] = useState<FamilleOverview[]>([])
  const [formationCount, setFormationCount] = useState(0)
  const [metierCount, setMetierCount] = useState(0)
  const [competenceCount, setCompetenceCount] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let current = true
    async function load() {
      try {
        const [overviewData, formations, competencesPage, metiersPage] = await Promise.all([
          referentielOverviewApi.list(),
          formationApi.list(),
          competenceSIApi.list({ page: 0, size: 1 }),
          metierApi.list({ page: 0, size: 1 }),
        ])
        if (!current) return
        setOverview(overviewData)
        setFormationCount(formations.length)
        setCompetenceCount(competencesPage.totalElements)
        setMetierCount(metiersPage.totalElements)
        setError(null)
      } catch (err) {
        if (!current) return
        setError(err instanceof Error ? err.message : 'Erreur inconnue')
      } finally {
        if (current) setLoading(false)
      }
    }
    load()
    return () => {
      current = false
    }
  }, [])

  const globalStats = useMemo(() => {
    const totalFamilles = overview.length
    const totalMetiers = metierCount
    const actifs = overview.reduce((sum, item) => sum + item.metiersActifs, 0)
    const competences = competenceCount

    return {
      totalFamilles,
      totalMetiers,
      actifs,
      competences,
      formationCount,
    }
  }, [overview, formationCount, competenceCount, metierCount])

  const famillesByNiveau = useMemo(
    () => [...overview].sort((a, b) => b.niveauMoyenRequis - a.niveauMoyenRequis),
    [overview],
  )

  return (
    <div className="mx-auto flex w-full max-w-6xl flex-col gap-8 px-4 py-8 sm:px-6 min-h-screen">
      <header className="flex flex-col gap-6 rounded-3xl p-6 text-white shadow-xl sm:p-8" style={{ background: '#1f2937' }}>
        <div className="flex flex-col gap-3">
          <p className="text-xs font-semibold tracking-[0.3em] text-emerald-200 sm:text-sm uppercase">Référentiel SI</p>
          <h1 className="text-2xl font-semibold leading-snug sm:text-3xl">Référentiel en un coup d’œil</h1>
        </div>
      </header>

      {loading && (
        <div className="rounded-2xl border border-slate-200 bg-white p-6 text-sm text-slate-500 shadow-sm">
          Chargement des données du référentiel…
        </div>
      )}

      {error && (
        <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          Impossible de récupérer les données : {error}
        </div>
      )}

      {!loading && !error && (
        <>
          <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <StatCard label="Familles suivies" value={globalStats.totalFamilles} />
            <StatCard label="Métiers référencés" value={globalStats.totalMetiers} />
            <StatCard label="Compétences distinctes" value={globalStats.competences} />
            <StatCard label="Formations disponibles" value={globalStats.formationCount} />
          </section>

          <section className="space-y-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Carte du référentiel</p>
                <h2 className="text-xl font-semibold text-slate-900">Familles de métiers</h2>
              </div>
              <p className="text-sm text-slate-500">Cliquez sur une carte pour approfondir la famille dans le référentiel.</p>
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              {famillesByNiveau.map((famille, index) => (
                <Link
                  key={famille.familleId}
                  to={`/referentiel/famille/${famille.familleId}`}
                  className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm transition hover:-translate-y-1 hover:border-blue-200 hover:shadow-lg"
                >
                  <div className="flex items-center justify-between">
                    <div className="text-3xl">{famille.icone ?? '🗂️'}</div>
                    <span className="text-xs font-semibold text-slate-400">#{index + 1}</span>
                  </div>
                  <h3 className="mt-4 text-lg font-semibold text-slate-900">{famille.nom}</h3>
                  <dl className="mt-4 space-y-2 text-sm text-slate-600">
                    <div className="flex justify-between">
                      <dt>Métiers référencés</dt>
                      <dd>{numberFormatter.format(famille.metiersTotal)}</dd>
                    </div>
                    <div className="flex justify-between">
                      <dt>Compétences couvertes</dt>
                      <dd>{numberFormatter.format(famille.competencesDistinctes)}</dd>
                    </div>
                    <div className="flex items-center justify-between">
                      <dt>Niveau moyen requis</dt>
                      <dd className="font-semibold text-slate-900">{famille.niveauMoyenRequis.toFixed(1)}</dd>
                    </div>
                  </dl>
                </Link>
              ))}
            </div>
          </section>
        </>
      )}
      <LogoFooter />
    </div>
  )
}

interface StatCardProps {
  label: string
  value: number | string
  subtitle?: string
}

const StatCard = ({ label, value, subtitle }: StatCardProps) => (
  <div className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
    <p className="text-xs font-semibold uppercase tracking-widest text-slate-400">{label}</p>
    <p className="mt-3 text-3xl font-semibold text-slate-900">{typeof value === 'number' ? numberFormatter.format(value) : value}</p>
    {subtitle && <p className="text-sm text-slate-500">{subtitle}</p>}
  </div>
)

export default DashboardPage
