import { Navigate, Route, Routes } from 'react-router-dom'
import DashboardPage from './pages/DashboardPage'
import FormationsPage from './pages/FormationsPage'

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<DashboardPage />} />
      <Route path="/formations/:slug" element={<FormationsPage />} />
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}

export default App
