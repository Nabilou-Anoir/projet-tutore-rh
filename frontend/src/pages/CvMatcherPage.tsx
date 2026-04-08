import CvMatcher from '../components/CvMatcher/CvMatcherTest'
import LogoFooter from '../components/LogoFooter'

const CvMatcherPage = () => {
    return (
        <div className="mx-auto flex max-w-6xl flex-col gap-8 px-4 py-8 min-h-screen">
            <header className="animate-in rounded-3xl p-8 text-white shadow-xl" style={{ background: '#10b981' }}>
                <div>
                    <p className="text-sm uppercase tracking-widest text-emerald-100">Outil Recruteur</p>
                    <h1 className="mt-2 text-3xl font-semibold">Tri intelligent de CV par mots-clés</h1>
                    <p className="mt-4 max-w-3xl text-base text-emerald-50">
                        Importez des CV au format PDF ou texte, indiquez vos mots-clés, et laissez l'IA analyser et classer les meilleurs profils pour votre recrutement.
                    </p>
                </div>
            </header>

            <div className="animate-in">
                <CvMatcher />
            </div>

            <LogoFooter />
        </div>
    )
}

export default CvMatcherPage
