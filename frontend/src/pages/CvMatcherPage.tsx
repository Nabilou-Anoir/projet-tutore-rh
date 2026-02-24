import CvMatcher from '../components/CvMatcher/CvMatcher'

const CvMatcherPage = () => {
    return (
        <div className="mx-auto flex max-w-6xl flex-col gap-8 px-4 py-8 min-h-screen">
            <header className="rounded-3xl p-8 text-white shadow-xl" style={{ background: '#10b981' }}>
                <div>
                    <p className="text-sm uppercase tracking-widest text-emerald-100">Outil Recruteur</p>
                    <h1 className="mt-2 text-3xl font-semibold">Tri intelligent de CV par mots-clés</h1>
                    <p className="mt-4 max-w-3xl text-base text-emerald-50">
                        Importez des CV au format PDF ou texte, indiquez vos mots-clés, et laissez l'IA analyser et classer les meilleurs profils pour votre recrutement.
                    </p>
                </div>
            </header>

            <CvMatcher />

            <footer className="mt-auto flex flex-row items-center justify-between py-6 w-full opacity-50">
                <img
                    src="/asinhpa-logo.png"
                    alt="Asinhpa Logo"
                    style={{ maxWidth: 200, width: '100%', height: 'auto' }}
                    className="ml-4"
                />
                <img
                    src="/isis-logo.png"
                    alt="ISIS Ingénieur Santé numérique"
                    style={{ maxWidth: 200, width: '100%', height: 'auto' }}
                    className="mr-4"
                />
            </footer>
        </div>
    )
}

export default CvMatcherPage
