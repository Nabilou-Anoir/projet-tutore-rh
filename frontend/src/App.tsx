import { Navigate, Route, Routes } from 'react-router-dom'
import { SurveyProvider } from './contexts/SurveyContext'
import { CvMatcherProvider } from './contexts/CvMatcherContext'
import Navbar from './components/Navbar'
import DashboardPage from './pages/DashboardPage'
import CvMatcherPage from './pages/CvMatcherPage'
import FamillesListPage from './pages/FamillesListPage'
import FamilleDetailPage from './pages/FamilleDetailPage'
import MetierDetailPage from './pages/MetierDetailPage'
import CompetencesSIPage from './pages/CompetencesSIPage'

const App = () => {
  return (
    <SurveyProvider>
      <CvMatcherProvider>
        <Navbar />
        <Routes>
          <Route path="/" element={<DashboardPage />} />
          <Route path="/cv-matcher" element={<CvMatcherPage />} />

          {/* Nouveau Référentiel Métiers SI (remplaçant l'ancien) */}
          <Route path="/referentiel" element={<FamillesListPage />} />
          <Route path="/referentiel/famille/:id" element={<FamilleDetailPage />} />
          <Route path="/referentiel/metier/:id" element={<MetierDetailPage />} />
          <Route path="/referentiel/competences" element={<CompetencesSIPage />} />

          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </CvMatcherProvider>
    </SurveyProvider>
  )
}

export default App
