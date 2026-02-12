import ResultSection from './ResultSection'

interface DistributionProps {
  label: string
  value: number
  total: number
}

const DistributionBar = ({ label, value, total }: DistributionProps) => {
  const percentage = total > 0 ? Math.round((value / total) * 100) : 0
  return (
    <div className="space-y-1">
      <div className="flex items-center justify-between text-sm text-slate-600">
        <span>{label}</span>
        <span>{value} ({percentage}%)</span>
      </div>
      <div className="h-2 rounded-full bg-slate-100">
        <div className="h-full rounded-full bg-emerald-500" style={{ width: `${percentage}%` }} />
      </div>
    </div>
  )
}

interface GeneralInfoSectionProps {
  q1Distribution: Record<string, number>
  q2Distribution: Record<string, number>
  totalResponses: number
}

const GeneralInfoSection = ({ q1Distribution, q2Distribution, totalResponses }: GeneralInfoSectionProps) => {
  return (
    <ResultSection
      title="Section 1 — Informations générales"
      description={`Total de réponses prises en compte : ${totalResponses}`}
    >
      <div className="grid gap-6 md:grid-cols-2">
        <div className="space-y-4">
          <h4 className="text-base font-semibold text-slate-800">Q1. Répartition des organisations</h4>
          {Object.entries(q1Distribution).length === 0 && (
            <p className="text-sm text-slate-500">Aucune donnée mappée pour le moment.</p>
          )}
          {Object.entries(q1Distribution).map(([label, value]) => (
            <DistributionBar key={label} label={label} value={value} total={totalResponses} />
          ))}
        </div>
        <div className="space-y-4">
          <h4 className="text-base font-semibold text-slate-800">Q2. Répartition par taille</h4>
          {Object.entries(q2Distribution).length === 0 && (
            <p className="text-sm text-slate-500">Aucune donnée mappée pour le moment.</p>
          )}
          {Object.entries(q2Distribution).map(([label, value]) => (
            <DistributionBar key={label} label={label} value={value} total={totalResponses} />
          ))}
        </div>
      </div>
    </ResultSection>
  )
}

export default GeneralInfoSection
