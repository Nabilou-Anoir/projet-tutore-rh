import { useMemo } from 'react'
import { useSurvey } from '../contexts/SurveyContext'
import FileImport from '../components/FileImport'
import MappingPanel from '../components/MappingPanel'
import GeneralInfoSection from '../components/Results/GeneralInfoSection'
import SkillsNeedsSection from '../components/Results/SkillsNeedsSection'
import CertificationsSection from '../components/Results/CertificationsSection'
import RecruitmentSection from '../components/Results/RecruitmentSection'
import PerspectivesSection from '../components/Results/PerspectivesSection'
import { calculateAggregates } from '../utils/aggregate'
import { createEmptyMapping, loadStoredMapping, mappingIsReady, persistMapping } from '../utils/mapping'
import { Aggregates, MappingConfig, SurveyRow } from '../types/survey'


const DashboardPage = () => {
  const { rows, mapping, mappingValidated, handleImport } = useSurvey()

  const aggregates: Aggregates | null = useMemo(() => {
    if (!mappingValidated || rows.length === 0) return null
    return calculateAggregates(rows, mapping)
  }, [mappingValidated, rows, mapping])

  // Le mapping panel et le bouton de validation sont masqués
  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-8 px-4 py-8 min-h-screen">
      <header className="rounded-3xl p-8 text-white shadow-xl" style={{ background: '#3299CC' }}>
        <div>
          <p className="text-sm uppercase tracking-widest text-emerald-200">Observatoire compétences</p>
          <h1 className="mt-2 text-3xl font-semibold">Analyse LimeSurvey des besoins en compétences numériques</h1>
          <p className="mt-4 max-w-3xl text-base text-slate-100">
            Importez le CSV anonymisé exporté de LimeSurvey et consultez directement la synthèse visuelle des
            priorités des organisations, des certifications attendues et des besoins en recrutement.
          </p>
        </div>
      </header>

      <FileImport onImport={handleImport} />

      {/* MappingPanel et messages de validation masqués car mapping auto */}

      {mappingValidated && rows.length === 0 && (
        <p className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          Impossible de calculer les résultats : aucun CSV chargé.
        </p>
      )}

      {aggregates && (
        <div className="space-y-6">
          <GeneralInfoSection
            q1Distribution={aggregates.generalInfo.q1Distribution}
            q2Distribution={aggregates.generalInfo.q2Distribution}
            totalResponses={aggregates.generalInfo.totalResponses}
          />
          <SkillsNeedsSection
            scores={aggregates.skills.q3Scores}
            top3={aggregates.skills.q3Top3}
            topDomain={aggregates.skills.topDomain}
            q5Responses={aggregates.skills.q5Responses}
            warnings={aggregates.warnings}
          />
          <CertificationsSection
            q8Distribution={aggregates.certifications.q8Distribution}
            q7Counts={aggregates.certifications.q7Counts}
            q7Other={aggregates.certifications.q7Other}
            q7bisCounts={aggregates.certifications.q7bisCounts}
            q7bisOther={aggregates.certifications.q7bisOther}
            q8bisDistribution={aggregates.certifications.q8bisDistribution}
          />
          <RecruitmentSection
            q9List={aggregates.recruitment.q9List}
            q10List={aggregates.recruitment.q10List}
            q11Distribution={aggregates.recruitment.q11Distribution}
          />
          <PerspectivesSection
            q12List={aggregates.perspectives.q12List}
            q13Distribution={aggregates.perspectives.q13Distribution}
          />
        </div>
      )}

      <footer className="mt-12 flex flex-row items-center justify-between py-6 w-full">
        <img
          src="/asinhpa-logo.png"
          alt="Asinhpa Logo"
          style={{ maxWidth: 300, width: '100%', height: 'auto' }}
          className="ml-4"
        />
        <img
          src="/isis-logo.png"
          alt="ISIS Ingénieur Santé numérique"
          style={{ maxWidth: 300, width: '100%', height: 'auto' }}
          className="mr-4"
        />
      </footer>
    </div>
  )
}

export default DashboardPage
