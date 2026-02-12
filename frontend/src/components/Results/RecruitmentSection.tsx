import ResultSection from './ResultSection'

interface RecruitmentSectionProps {
  q9List: string[]
  q10List: string[]
  q11Distribution: Record<string, number>
}

const RecruitmentSection = ({ q9List, q10List, q11Distribution }: RecruitmentSectionProps) => {
  return (
    <ResultSection
      title="Section 4 — Recrutement & montée en compétences"
      description="Difficultés, leviers et formats plébiscités"
    >
      <div className="grid gap-6 lg:grid-cols-2">
        <div className="space-y-3">
          <h4 className="text-base font-semibold text-slate-800">Q9. Difficultés de recrutement ({q9List.length})</h4>
          {q9List.length === 0 ? (
            <p className="text-sm text-slate-500">Aucune réponse disponible.</p>
          ) : (
            <ul className="space-y-2 text-sm">
              {q9List.map((item, index) => (
                <li key={`${item}-${index}`} className="rounded-xl bg-slate-100 px-3 py-2">
                  {item}
                </li>
              ))}
            </ul>
          )}
        </div>
        <div className="space-y-3">
          <h4 className="text-base font-semibold text-slate-800">Q10. Compétences à développer ({q10List.length})</h4>
          {q10List.length === 0 ? (
            <p className="text-sm text-slate-500">Aucune réponse disponible.</p>
          ) : (
            <ul className="space-y-2 text-sm">
              {q10List.map((item, index) => (
                <li key={`${item}-${index}`} className="rounded-xl bg-slate-100 px-3 py-2">
                  {item}
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>
      <div className="mt-6">
        <h4 className="text-base font-semibold text-slate-800">Q11. Formats privilégiés</h4>
        {Object.keys(q11Distribution).length === 0 ? (
          <p className="text-sm text-slate-500">Aucun format sélectionné.</p>
        ) : (
          <table className="mt-2 min-w-full divide-y divide-slate-100 text-sm">
            <tbody>
              {Object.entries(q11Distribution).map(([label, value]) => (
                <tr key={label} className="odd:bg-white even:bg-slate-50">
                  <td className="px-3 py-2 font-medium text-slate-700">{label}</td>
                  <td className="px-3 py-2 text-right text-slate-500">{value}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </ResultSection>
  )
}

export default RecruitmentSection
