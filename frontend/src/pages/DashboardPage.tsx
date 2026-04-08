import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type { FamilleOverview } from '../types/referentiel'
import { formationApi, referentielOverviewApi, competenceSIApi, metierApi } from '../utils/metiers.service'
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell, CartesianGrid } from 'recharts'
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

  const chartData = useMemo(() => [
    { name: 'Familles', value: globalStats.totalFamilles, color1: '#3b82f6', color2: '#1d4ed8' }, // blue
    { name: 'Métiers', value: globalStats.totalMetiers, color1: '#8b5cf6', color2: '#6d28d9' }, // violet
    { name: 'Compétences', value: globalStats.competences, color1: '#10b981', color2: '#047857' }, // emerald
    { name: 'Formations', value: globalStats.formationCount, color1: '#f59e0b', color2: '#b45309' }, // amber
  ], [globalStats])

  return (
    <div className="mx-auto flex w-full max-w-6xl flex-col gap-8 px-4 py-8 sm:px-6 min-h-screen">
      <header className="animate-in flex flex-col gap-6 rounded-3xl p-6 text-white shadow-xl sm:p-8" style={{ background: '#4EBCC2' }}>
        <div className="flex flex-col gap-3">
          <h1 className="text-2xl font-semibold leading-snug sm:text-3xl">Référentiel en un coup d’œil</h1>
          <p className="text-sm text-white sm:text-base">
            Visualisez la couverture des compétences, les métiers et les formations disponibles pour piloter vos décisions.
          </p>
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
          <section className="animate-in grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <StatCard label="Familles suivies" value={globalStats.totalFamilles} />
            <StatCard label="Métiers référencés" value={globalStats.totalMetiers} />
            <StatCard label="Compétences distinctes" value={globalStats.competences} />
            <StatCard label="Formations disponibles" value={globalStats.formationCount} />
          </section>

          <section className="animate-in relative overflow-hidden rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            {/* Background design elements */}
            <div className="pointer-events-none absolute -right-20 -top-20 h-64 w-64 rounded-full bg-blue-50 opacity-60 blur-3xl" />
            <div className="pointer-events-none absolute -bottom-20 -left-20 h-64 w-64 rounded-full bg-emerald-50 opacity-60 blur-3xl" />
            
            <div className="relative z-10 mb-6">
              <p className="text-xs font-semibold uppercase tracking-[0.3em] text-slate-400">Aperçu Global</p>
              <h2 className="text-xl font-semibold text-slate-900">Répartition du Référentiel</h2>
            </div>
            
            <div className="relative z-10 h-[320px] w-full rounded-2xl border border-slate-100 bg-slate-50/50 p-4">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={chartData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
                  <defs>
                    {chartData.map((entry, index) => (
                      <linearGradient key={`grad-${index}`} id={`colorGrad-${index}`} x1="0" y1="0" x2="0" y2="1">
                        <stop offset="0%" stopColor={entry.color1} stopOpacity={0.9} />
                        <stop offset="100%" stopColor={entry.color2} stopOpacity={0.8} />
                      </linearGradient>
                    ))}
                  </defs>
                  <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e2e8f0" />
                  <XAxis dataKey="name" stroke="#64748b" fontSize={13} tickLine={false} axisLine={false} dy={10} />
                  <YAxis stroke="#64748b" fontSize={12} tickLine={false} axisLine={false} dx={-10} />
                  <Tooltip 
                    cursor={{ fill: '#f1f5f9', opacity: 0.5 }} 
                    contentStyle={{ 
                      borderRadius: '16px', 
                      border: '1px solid #e2e8f0', 
                      boxShadow: '0 10px 25px -5px rgb(0 0 0 / 0.1)', 
                      backgroundColor: 'rgba(255, 255, 255, 0.95)',
                      backdropFilter: 'blur(8px)',
                      color: '#0f172a'
                    }}
                    itemStyle={{ color: '#0f172a', fontWeight: 600 }}
                  />
                  <Bar dataKey="value" radius={[12, 12, 12, 12]} barSize={50} animationDuration={1500}>
                    {
                      chartData.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={`url(#colorGrad-${index})`} style={{ filter: 'drop-shadow(0px 4px 6px rgba(0,0,0,0.1))' }} />
                      ))
                    }
                  </Bar>
                </BarChart>
              </ResponsiveContainer>
            </div>
          </section>

          <section className="space-y-4 animate-in">
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
                  className="animate-in rounded-3xl border border-slate-200 bg-white p-5 shadow-sm transition hover:-translate-y-1 hover:border-blue-200 hover:shadow-lg"
                  style={{ animationDelay: `${index * 60}ms` }}
                >
                  <div className="flex items-center justify-between">
                    <div className="text-3xl">{famille.icone ?? ''}</div>
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
  <div className="animate-in rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
    <p className="text-xs font-semibold uppercase tracking-widest text-slate-400">{label}</p>
    <p className="mt-3 text-3xl font-semibold text-slate-900">{typeof value === 'number' ? numberFormatter.format(value) : value}</p>
    {subtitle && <p className="text-sm text-slate-500">{subtitle}</p>}
  </div>
)

export default DashboardPage
