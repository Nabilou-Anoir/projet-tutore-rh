import { Link, useNavigate, useParams } from 'react-router-dom'
import { formations, slugToDomain } from '../utils/formations'

const FormationsPage = () => {
  const params = useParams<{ slug: string }>()
  const navigate = useNavigate()
  const domain = params.slug ? slugToDomain(params.slug) : undefined

  if (!domain) {
    return (
      <div className="mx-auto flex min-h-screen max-w-4xl flex-col items-center justify-center gap-4 px-4 text-center">
        <p className="text-lg font-semibold">Domaine introuvable</p>
        <button className="rounded-full bg-slate-900 px-4 py-2 text-white" onClick={() => navigate('/')}>Retour</button>
      </div>
    )
  }

  const list = formations[domain]

  return (
    <div className="mx-auto flex max-w-4xl flex-col gap-6 px-4 py-8">
      <button
        onClick={() => navigate(-1)}
        className="self-start rounded-full bg-slate-900 px-4 py-2 text-sm font-semibold text-white"
      >
        ← Retour aux résultats
      </button>
      <header>
        <p className="text-sm uppercase tracking-widest text-emerald-600">Parcours de formation</p>
        <h1 className="text-3xl font-semibold text-slate-900">{domain}</h1>
        <p className="mt-2 text-slate-600">
          Sélection de formations suggérées pour renforcer ce domaine prioritaire. Liens externes fournis à titre indicatif.
        </p>
      </header>
      <div className="grid gap-4">
        {list.map((item) => (
          <div key={item.label} className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
            <p className="text-lg font-semibold text-slate-900">{item.label}</p>
            {item.organisme && <p className="text-sm text-slate-500">{item.organisme}</p>}
            <Link
              className="mt-3 inline-flex items-center gap-2 text-sm font-semibold text-emerald-600"
              to={item.url}
              target="_blank"
              rel="noreferrer"
            >
              Consulter la formation ↗
            </Link>
          </div>
        ))}
      </div>
    </div>
  )
}

export default FormationsPage
