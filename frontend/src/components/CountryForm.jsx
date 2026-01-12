import { useCallback, useEffect, useState } from 'react'
import doAjaxRequest from '@/util/util.js'

const createEmptyCountry = () => ({
  code: '',
  name: '',
})

function CountryForm() {
  const [formData, setFormData] = useState(() => createEmptyCountry())
  const [countries, setCountries] = useState([])
  const [submitting, setSubmitting] = useState(false)

  const refreshCountries = useCallback(async () => {
    try {
      const result = await doAjaxRequest('/api/countries')
      setCountries(result?._embedded?.countries ?? [])
    } catch (error) {
      alert(error?.message ?? 'Une erreur est survenue lors du chargement des pays.')
    }
  }, [])

  useEffect(() => {
    refreshCountries()
  }, [refreshCountries])

  const handleChange = (event) => {
    const { name, value } = event.target
    setFormData((current) => ({
      ...current,
      [name]: value,
    }))
  }

  const handleSubmit = async (event) => {
    event.preventDefault()
    setSubmitting(true)
    try {
      await doAjaxRequest('/api/countries', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      })
      setFormData(createEmptyCountry())
      await refreshCountries()
    } catch (error) {
      alert(error?.message ?? 'Impossible d’ajouter le pays pour le moment.')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="mx-auto w-full max-w-xl space-y-6 rounded-3xl bg-white/80 p-6 shadow-xl ring-1 ring-slate-200 backdrop-blur">
      <form className="space-y-4" onSubmit={handleSubmit}>
        <div className="space-y-1">
          <label className="text-sm font-semibold text-slate-700" htmlFor="code">
            Code ISO :
          </label>
          <input
            id="code"
            name="code"
            value={formData.code}
            onChange={handleChange}
            maxLength={2}
            required
            className="w-full rounded-2xl border border-slate-200 bg-white/80 px-4 py-2 text-sm font-semibold uppercase tracking-widest text-slate-900 shadow-sm transition focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-200"
          />
        </div>

        <div className="space-y-1">
          <label className="text-sm font-semibold text-slate-700" htmlFor="name">
            Nom du pays :
          </label>
          <input
            id="name"
            name="name"
            value={formData.name}
            onChange={handleChange}
            required
            className="w-full rounded-2xl border border-slate-200 bg-white/80 px-4 py-2 text-sm text-slate-900 shadow-sm transition focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-200"
          />
        </div>

        <button
          type="submit"
          disabled={submitting}
          className="inline-flex w-full items-center justify-center rounded-2xl bg-emerald-600 px-4 py-3 text-base font-semibold text-white shadow-lg transition hover:bg-emerald-500 focus:outline-none focus:ring-4 focus:ring-emerald-200 disabled:cursor-not-allowed disabled:opacity-70"
        >
          {submitting ? 'Ajout...' : 'Ajouter'}
        </button>
      </form>

      <div className="overflow-hidden rounded-3xl border border-slate-200 bg-white/60 shadow-lg">
        <table className="min-w-full divide-y divide-slate-200 text-left text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wider text-slate-500">
            <tr>
              <th scope="col" className="px-6 py-3">
                Code
              </th>
              <th scope="col" className="px-6 py-3">
                Nom
              </th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {countries.length === 0 ? (
              <tr>
                <td colSpan={2} className="px-6 py-8 text-center text-slate-500">
                  Aucun pays n&rsquo;a encore été ajouté.
                </td>
              </tr>
            ) : (
              countries.map((country) => (
                <tr key={country.id ?? country.code} className="odd:bg-white even:bg-slate-50">
                  <td className="px-6 py-4 font-semibold tracking-wider text-slate-800">
                    {country.code}
                  </td>
                  <td className="px-6 py-4 text-slate-700">{country.name}</td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </div>
  )
}

export default CountryForm
