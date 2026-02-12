import { Link } from 'react-router-dom'
import ResultSection from './ResultSection'
import { DomainScore } from '../../types/survey'
import { domainToSlug } from '../../utils/formations'

interface SkillsNeedsSectionProps {
  scores: DomainScore[]
  top3: DomainScore[]
  topDomain?: DomainScore
  q5Responses: string[]
  warnings: string[]
}

const formatPercentage = (score: DomainScore, allScores: DomainScore[]) => {
  const total = allScores.reduce((sum, entry) => sum + entry.score, 0)
  if (total === 0) return 0
  return Math.round((score.score / total) * 100)
}

const SkillsNeedsSection = ({ scores, top3, topDomain, q5Responses, warnings }: SkillsNeedsSectionProps) => {
  return (
    <ResultSection
      title="Section 2 — Besoins en compétences"
      description="Classement des domaines stratégiques et analyse des réponses libres"
    >
      {warnings.length > 0 && (
        <div className="mb-4 rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
          {warnings.map((warning) => (
            <p key={warning}>{warning}</p>
          ))}
        </div>
      )}
      <div className="grid gap-6 lg:grid-cols-2">
        <div className="space-y-4">
          <h4 className="text-base font-semibold text-slate-800">Classement global (Q3)</h4>
          <div className="overflow-hidden rounded-2xl border border-slate-100">
            <table className="min-w-full divide-y divide-slate-100 text-sm">
              <thead className="bg-slate-50 text-slate-500">
                <tr>
                  <th className="px-4 py-2 text-left">Domaine</th>
                  <th className="px-4 py-2 text-right">Score</th>
                  <th className="px-4 py-2 text-right">% pondéré</th>
                  <th className="px-4 py-2 text-right">Actions</th>
                </tr>
              </thead>
              <tbody>
                {scores.map((entry) => (
                  <tr key={entry.domain} className="odd:bg-white even:bg-slate-50">
                    <td className="px-4 py-2 font-medium text-slate-800">{entry.domain}</td>
                    <td className="px-4 py-2 text-right text-slate-600">{entry.score}</td>
                    <td className="px-4 py-2 text-right text-slate-600">{formatPercentage(entry, scores)}%</td>
                    <td className="px-4 py-2 text-right">
                      <Link
                        className="rounded-full bg-slate-900 px-3 py-1 text-xs font-semibold text-white"
                        to={`/formations/${domainToSlug(entry.domain)}`}
                      >
                        Voir formations
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {top3.length > 0 && (
            <div className="rounded-xl bg-emerald-50 p-4 text-sm text-emerald-900">
              <p className="font-semibold">Top 3 domaines prioritaires</p>
              <ol className="mt-2 list-decimal space-y-1 pl-5">
                {top3.map((entry) => (
                  <li key={entry.domain}>
                    {entry.domain} — {entry.score} pts ({entry.responses} réponses)
                  </li>
                ))}
              </ol>
              {topDomain && topDomain.score > 0 && (
                <p className="mt-3 font-medium">
                  Domaine le plus prioritaire : {topDomain.domain} ({topDomain.score} pts)
                </p>
              )}
            </div>
          )}
        </div>
        <div className="space-y-4">
          <h4 className="text-base font-semibold text-slate-800">Q5. Autres compétences clés citées</h4>
          {q5Responses.length === 0 ? (
            <p className="text-sm text-slate-500">Aucune réponse libre importée.</p>
          ) : (
            <div className="space-y-2">
              <p className="text-sm text-slate-500">{q5Responses.length} réponses libres</p>
              <ul className="space-y-2 text-sm">
                {q5Responses.map((response, index) => (
                  <li key={`${response}-${index}`} className="rounded-xl bg-slate-100 px-3 py-2">
                    {response}
                  </li>
                ))}
              </ul>
            </div>
          )}
        </div>
      </div>
    </ResultSection>
  )
}

export default SkillsNeedsSection
