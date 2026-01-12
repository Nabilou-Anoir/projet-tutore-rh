import { NavLink, Route, Routes } from 'react-router-dom'
import HelloWorld from './components/HelloWorld.jsx'
import HomeView from './views/HomeView.jsx'
import AboutView from './views/AboutView.jsx'
import logo from './assets/logo.svg'
import './App.css'

const navLinkClassName = ({ isActive }) =>
  [
    'rounded-full px-4 py-2 text-sm font-semibold transition-colors duration-200',
    isActive ? 'active bg-slate-900 text-white shadow-lg' : 'text-slate-700 hover:bg-slate-100',
  ].join(' ')

function App() {
  return (
    <>
      <header className="rounded-3xl bg-white/80 p-8 shadow-2xl ring-1 ring-slate-200 backdrop-blur">
        <img alt="React logo" className="logo" src={logo} width="125" height="125" />

        <div className="wrapper gap-6">
          <HelloWorld msg="You did it!" />

          <nav className="flex flex-wrap items-center justify-center gap-4 md:justify-start">
            <NavLink to="/" end className={navLinkClassName}>
              Home
            </NavLink>
            <NavLink to="/about" className={navLinkClassName}>
              Les pays
            </NavLink>
          </nav>
        </div>
      </header>

      <Routes>
        <Route path="/" element={<HomeView />} />
        <Route path="/about" element={<AboutView />} />
      </Routes>
    </>
  )
}

export default App
