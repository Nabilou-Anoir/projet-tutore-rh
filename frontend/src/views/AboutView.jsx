import CountryForm from '@/components/CountryForm.jsx'

function AboutView() {
  return (
    <div className="about-view flex flex-col gap-6 rounded-3xl bg-white/80 p-8 text-slate-900 shadow-2xl ring-1 ring-slate-200 backdrop-blur">
      <h2 className="text-2xl font-semibold text-slate-800">Ajouter un pays</h2>
      <CountryForm />
    </div>
  )
}

export default AboutView
