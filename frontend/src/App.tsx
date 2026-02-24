import { Navigate, Route, Routes } from 'react-router-dom'
import { SurveyProvider } from './contexts/SurveyContext'
import { CvMatcherProvider } from './contexts/CvMatcherContext'
import Navbar from './components/Navbar'
import DashboardPage from './pages/DashboardPage'
import FormationsPage from './pages/FormationsPage'
import ReferentielPage from './pages/ReferentielPage'
import CompetenceDetailPage from './pages/CompetenceDetailPage'
import CvMatcherPage from './pages/CvMatcherPage'

const App = () => {
  return (
    <SurveyProvider>
      <CvMatcherProvider>
        <Navbar />
        <Routes>
          <Route path="/" element={<DashboardPage />} />
          <Route path="/cv-matcher" element={<CvMatcherPage />} />
          <Route path="/formations/:slug" element={<FormationsPage />} />
          <Route path="/referentiel" element={<ReferentielPage />} />
          <Route path="/referentiel/competence/:id" element={<CompetenceDetailPage />} />
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </CvMatcherProvider>
    </SurveyProvider>
  )
}

export default App
