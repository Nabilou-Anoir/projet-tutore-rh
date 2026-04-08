import { useState } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'

const navLinks = [
    { to: '/', label: 'Dashboard'},
    { to: '/referentiel', label: 'Référentiel'},
    { to: '/referentiel/comparateur', label: "Comparateur & Évolution"},
    { to: '/referentiel/formations', label: 'Formations & Compétences'},
    { to: '/cv-matcher', label: 'Tri CV IA'},
]

const Navbar = () => {
    const location = useLocation()
    const { role, user, signIn, signOut, loading } = useAuth()
    const [showModal, setShowModal] = useState(false)
    const [menuOpen, setMenuOpen] = useState(false)
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [error, setError] = useState<string | null>(null)
    const [submitting, setSubmitting] = useState(false)

    const handleSubmit = async (event: React.FormEvent) => {
        event.preventDefault()
        setSubmitting(true)
        setError(null)
        try {
            await signIn(email, password)
            setShowModal(false)
            setEmail('')
            setPassword('')
        } catch (err: any) {
            setError(err.message || 'Impossible de vous authentifier')
        } finally {
            setSubmitting(false)
        }
    }

    return (
        <>
        <nav className="sticky top-0 z-50 border-b border-slate-200/60 bg-white/80 backdrop-blur-xl">
            <div className="mx-auto flex max-w-6xl items-center justify-between gap-3 px-4 py-3">
                <Link to="/" className="flex items-center gap-2 text-lg font-bold text-slate-900 no-underline">
                    <span className="flex h-8 w-8 items-center justify-center rounded-lg text-white text-sm" style={{ background: '#3299CC' }}>
                        A
                    </span>
                    <span>ASINHPA</span>
                </Link>
                <button
                    type="button"
                    className="inline-flex h-10 w-10 items-center justify-center rounded-xl border border-slate-200 text-slate-600 transition-colors hover:border-slate-300 md:hidden"
                    onClick={() => setMenuOpen((prev) => !prev)}
                    aria-label="Menu"
                >
                    <span className="sr-only">Ouvrir le menu</span>
                    {menuOpen ? '✕' : '☰'}
                </button>
                <div className="hidden items-center gap-1 md:flex">
                    {navLinks.map((link) => {
                        const isActive = location.pathname === link.to
                        return (
                            <Link
                                key={link.to}
                                to={link.to}
                                className={`flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium no-underline transition-all duration-200 ${isActive
                                    ? 'bg-sky-50 text-sky-700 shadow-sm'
                                    : 'text-slate-600 hover:bg-slate-50 hover:text-slate-900'
                                    } whitespace-nowrap`}
                            >
                                <span>{link.label}</span>
                            </Link>
                        )
                    })}
                </div>
                <div className="hidden items-center gap-2 md:flex">
                    <span className={`rounded-full px-3 py-1 text-xs font-semibold ${role === 'rh' ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-500'}`}>
                        {role === 'rh' ? 'Profil RH' : 'Profil Public'}
                    </span>
                    {user ? (
                        <button
                            onClick={() => { void signOut() }}
                            className="rounded-lg border border-slate-200 px-3 py-1.5 text-xs font-medium text-slate-600 hover:bg-slate-50"
                        >
                            Déconnexion
                        </button>
                    ) : (
                        <button
                            onClick={() => setShowModal(true)}
                            className="rounded-lg bg-sky-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-sky-700"
                            disabled={loading}
                        >
                            Connexion RH
                        </button>
                    )}
                </div>
            </div>
            {menuOpen && (
                <div className="border-t border-slate-200 bg-white md:hidden">
                    <div className="mx-auto flex max-w-6xl flex-col gap-3 px-4 py-4">
                        <div className="grid gap-2">
                            {navLinks.map((link) => {
                                const isActive = location.pathname === link.to
                                return (
                                    <Link
                                        key={link.to}
                                        to={link.to}
                                        onClick={() => setMenuOpen(false)}
                                        className={`flex items-center justify-between rounded-xl px-3 py-2 text-sm font-medium transition ${isActive
                                            ? 'bg-sky-50 text-sky-700'
                                            : 'text-slate-600 hover:bg-slate-50'}`}
                                    >
                                        <span className="flex items-center gap-2">
                                            {link.label}
                                        </span>
                                        <span className="text-xs text-slate-400">→</span>
                                    </Link>
                                )
                            })}
                        </div>
                        <div className="flex flex-wrap gap-2 rounded-2xl border border-slate-100 p-3">
                            <span className={`rounded-full px-3 py-1 text-xs font-semibold ${role === 'rh' ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-500'}`}>
                                {role === 'rh' ? 'Profil RH' : 'Profil Public'}
                            </span>
                            {user ? (
                                <button
                                    onClick={() => { void signOut(); setMenuOpen(false) }}
                                    className="flex-1 rounded-lg border border-slate-200 px-3 py-2 text-xs font-semibold text-slate-700 hover:bg-slate-50"
                                >
                                    Déconnexion
                                </button>
                            ) : (
                                <button
                                    onClick={() => { setShowModal(true); setMenuOpen(false) }}
                                    className="flex-1 rounded-lg bg-sky-600 px-3 py-2 text-xs font-semibold text-white hover:bg-sky-700"
                                    disabled={loading}
                                >
                                    Connexion RH
                                </button>
                            )}
                        </div>
                    </div>
                </div>
            )}
        </nav>
        {showModal && (
            <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/60 backdrop-blur" onClick={() => !submitting && setShowModal(false)}>
                <div className="w-full max-w-sm rounded-2xl bg-white p-6 shadow-xl" onClick={e => e.stopPropagation()}>
                    <h2 className="text-lg font-bold text-slate-900 mb-4">Connexion RH</h2>
                    <form className="flex flex-col gap-3" onSubmit={handleSubmit}>
                        <label className="flex flex-col gap-1 text-sm text-slate-600">
                            Email
                            <input
                                type="email"
                                value={email}
                                onChange={e => setEmail(e.target.value)}
                                className="rounded-lg border border-slate-200 px-3 py-2 outline-none focus:border-sky-500"
                                required
                            />
                        </label>
                        <label className="flex flex-col gap-1 text-sm text-slate-600">
                            Mot de passe
                            <input
                                type="password"
                                value={password}
                                onChange={e => setPassword(e.target.value)}
                                className="rounded-lg border border-slate-200 px-3 py-2 outline-none focus:border-sky-500"
                                required
                            />
                        </label>
                        {error && <p className="text-sm text-red-600">{error}</p>}
                        <div className="flex justify-end gap-2 pt-2">
                            <button
                                type="button"
                                className="rounded-lg px-3 py-2 text-sm text-slate-500 hover:bg-slate-100"
                                onClick={() => setShowModal(false)}
                                disabled={submitting}
                            >
                                Annuler
                            </button>
                            <button
                                type="submit"
                                className="rounded-lg bg-sky-600 px-4 py-2 text-sm font-semibold text-white hover:bg-sky-700 disabled:opacity-50"
                                disabled={submitting}
                            >
                                {submitting ? 'Connexion…' : 'Se connecter'}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        )}
        </>
    )
}

export default Navbar
