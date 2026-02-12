import ResultSection from './ResultSection'

interface CertificationsSectionProps {
  q8Distribution: Record<string, number>
  q7Counts: Record<string, number>
  q7Other: string[]
  q7bisCounts: Record<string, number>
  q7bisOther: string[]
  q8bisDistribution: Record<string, number>
}

const renderDistribution = (data: Record<string, number>) => (
  <table className="min-w-full divide-y divide-slate-100 text-sm">
    <tbody>
      {Object.entries(data).map(([label, value]) => (
        <tr key={label} className="odd:bg-white even:bg-slate-50">
          <td className="px-3 py-2 font-medium text-slate-700">{label}</td>
          <td className="px-3 py-2 text-right text-slate-500">{value}</td>
        </tr>
      ))}
    </tbody>
  </table>
)

const CertificationsSection = ({
  q8Distribution,
  q7Counts,
  q7Other,
  q7bisCounts,
  q7bisOther,
  q8bisDistribution,
}: CertificationsSectionProps) => {
  return (
    <ResultSection
      title="Section 3 — Certifications & qualifications"
      description="Importance des badges, certifications phare et normes citées"
    >
      <div className="grid gap-6 lg:grid-cols-2">
        <div className="space-y-4">
          <h4 className="text-base font-semibold text-slate-800">Q8. Importance badges / certifs</h4>
          {Object.keys(q8Distribution).length === 0 ? (
            <p className="text-sm text-slate-500">Aucune donnée mappée.</p>
          ) : (
            renderDistribution(q8Distribution)
          )}
        </div>
        <div className="space-y-4">
          <h4 className="text-base font-semibold text-slate-800">Q8bis. Notoriété des formations</h4>
          {Object.keys(q8bisDistribution).length === 0 ? (
            <p className="text-sm text-slate-500">Aucune donnée mappée.</p>
          ) : (
            renderDistribution(q8bisDistribution)
          )}
        </div>
      </div>
      <div className="mt-6 grid gap-6 lg:grid-cols-2">
        <div className="space-y-3">
          <h4 className="text-base font-semibold text-slate-800">Q7. Certifications valorisées</h4>
          {Object.keys(q7Counts).length === 0 ? (
            <p className="text-sm text-slate-500">Aucune donnée mappée.</p>
          ) : (
            renderDistribution(q7Counts)
          )}
          {q7Other.length > 0 && (
            <div className="rounded-xl bg-slate-100 p-3 text-sm">
              <p className="font-semibold">Autres cités</p>
              <ul className="mt-2 list-disc space-y-1 pl-5">
                {q7Other.map((item, index) => (
                  <li key={`${item}-${index}`}>{item}</li>
                ))}
              </ul>
            </div>
          )}
        </div>
        <div className="space-y-3">
          <h4 className="text-base font-semibold text-slate-800">Q7bis. Normes / référentiels</h4>
          {Object.keys(q7bisCounts).length === 0 ? (
            <p className="text-sm text-slate-500">Aucune donnée mappée.</p>
          ) : (
            renderDistribution(q7bisCounts)
          )}
          {q7bisOther.length > 0 && (
            <div className="rounded-xl bg-slate-100 p-3 text-sm">
              <p className="font-semibold">Autres normatifs</p>
              <ul className="mt-2 list-disc space-y-1 pl-5">
                {q7bisOther.map((item, index) => (
                  <li key={`${item}-${index}`}>{item}</li>
                ))}
              </ul>
            </div>
          )}
        </div>
      </div>
    </ResultSection>
  )
}

export default CertificationsSection
