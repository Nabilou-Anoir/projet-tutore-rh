import { useState } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'

const navLinks = [
    { to: '/', label: 'Dashboard', icon: '📊' },
    { to: '/referentiel', label: 'Référentiel', icon: '🗂️' },
    { to: '/referentiel/comparateur', label: 'Comparateur', icon: '⚖️' },
    { to: '/referentiel/formations', label: 'Formations', icon: '🎓' },
    { to: '/cv-matcher', label: 'Tri CV IA', icon: '🤖' },
]

const Navbar = () => {
    const location = useLocation()
    const { role, user, signIn, signOut, loading } = useAuth()
    const [showModal, setShowModal] = useState(false)
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
            <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
                <Link to="/" className="flex items-center gap-2 text-lg font-bold text-slate-900 no-underline">
                    <span className="flex h-8 w-8 items-center justify-center rounded-lg text-white text-sm" style={{ background: '#3299CC' }}>
                        A
                    </span>
                    <span>ASINHPA</span>
                </Link>
                <div className="flex items-center gap-1">
                    {navLinks.map((link) => {
                        const isActive = link.to === '/' ? location.pathname === '/' : location.pathname.startsWith(link.to)
                        return (
                            <Link
                                key={link.to}
                                to={link.to}
                                className={`flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium no-underline transition-all duration-200 ${isActive
                                    ? 'bg-sky-50 text-sky-700 shadow-sm'
                                    : 'text-slate-600 hover:bg-slate-50 hover:text-slate-900'
                                    }`}
                            >
                                <span>{link.icon}</span>
                                <span>{link.label}</span>
                            </Link>
                        )
                    })}
                </div>
                <div className="flex items-center gap-2">
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
