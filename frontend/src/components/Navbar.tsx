import { Link, useLocation } from 'react-router-dom'

const navLinks = [
    { to: '/', label: 'Dashboard', icon: '📊' },
    { to: '/referentiel', label: 'Référentiel', icon: '🗂️' },
    { to: '/cv-matcher', label: 'Tri CV IA', icon: '🤖' },
]

const Navbar = () => {
    const location = useLocation()

    return (
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
            </div>
        </nav>
    )
}

export default Navbar
