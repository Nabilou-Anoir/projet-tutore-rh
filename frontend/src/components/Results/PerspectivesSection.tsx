import ResultSection from './ResultSection'

interface PerspectivesSectionProps {
  q12List: string[]
  q13Distribution: Record<string, number>
}

const PerspectivesSection = ({ q12List, q13Distribution }: PerspectivesSectionProps) => {
  return (
    <ResultSection
      title="Section 5 — Perspectives"
      description="Profils émergents et dispositifs attendus"
    >
      <div className="grid gap-6 lg:grid-cols-2">
        <div className="space-y-3">
          <h4 className="text-base font-semibold text-slate-800">Q12. Métiers / profils émergents ({q12List.length})</h4>
          {q12List.length === 0 ? (
            <p className="text-sm text-slate-500">Aucune réponse libre.</p>
          ) : (
            <ul className="space-y-2 text-sm">
              {q12List.map((item, index) => (
                <li key={`${item}-${index}`} className="rounded-xl bg-slate-100 px-3 py-2">
                  {item}
                </li>
              ))}
            </ul>
          )}
        </div>
        <div className="space-y-3">
          <h4 className="text-base font-semibold text-slate-800">Q13. Dispositifs utiles</h4>
          {Object.keys(q13Distribution).length === 0 ? (
            <p className="text-sm text-slate-500">Aucun dispositif sélectionné.</p>
          ) : (
            <table className="min-w-full divide-y divide-slate-100 text-sm">
              <tbody>
                {Object.entries(q13Distribution).map(([label, value]) => (
                  <tr key={label} className="odd:bg-white even:bg-slate-50">
                    <td className="px-3 py-2 font-medium text-slate-700">{label}</td>
                    <td className="px-3 py-2 text-right text-slate-500">{value}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      </div>
    </ResultSection>
  )
}

export default PerspectivesSection
