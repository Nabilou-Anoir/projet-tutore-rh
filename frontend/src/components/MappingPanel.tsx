import { MappingConfig, MultiChoiceMapping, Q3_DOMAINS } from '../types/survey'

interface MappingPanelProps {
  columns: string[]
  mapping: MappingConfig
  onChange: (next: MappingConfig) => void
  onValidate: () => void
  disabled?: boolean
}

const modeOptions = [
  { value: 'single', label: 'Colonne unique' },
  { value: 'multi', label: 'Colonnes multiples (1/0)' },
]

const MultiChoiceConfigurator = ({
  label,
  config,
  onUpdate,
  columns,
}: {
  label: string
  config?: MultiChoiceMapping
  onUpdate: (next: MultiChoiceMapping) => void
  columns: string[]
}) => {
  const merged: MultiChoiceMapping = config ?? { mode: 'single' }

  return (
    <div className="space-y-2 rounded-xl border border-slate-200 p-4">
      <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
        <div>
          <p className="font-semibold text-slate-800">{label}</p>
          <p className="text-sm text-slate-500">
            Choisissez la colonne contenant les réponses ou plusieurs colonnes binaires.
          </p>
        </div>
        <div className="flex gap-4 text-sm">
          {modeOptions.map((option) => (
            <label key={option.value} className="flex items-center gap-2">
              <input
                type="radio"
                className="accent-emerald-600"
                name={`${label}-mode`}
                value={option.value}
                checked={merged.mode === option.value}
                onChange={(event) =>
                  onUpdate({
                    ...merged,
                    mode: event.target.value as MultiChoiceMapping['mode'],
                    multiColumns: event.target.value === 'multi' ? merged.multiColumns ?? [] : merged.multiColumns,
                  })
                }
              />
              {option.label}
            </label>
          ))}
        </div>
      </div>
      {merged.mode === 'single' ? (
        <select
          className="w-full rounded-xl border border-slate-200 px-3 py-2"
          value={merged.singleColumn ?? ''}
          onChange={(event) => onUpdate({ ...merged, singleColumn: event.target.value || undefined })}
        >
          <option value="">-- Choisir une colonne --</option>
          {columns.map((column) => (
            <option key={column} value={column}>
              {column}
            </option>
          ))}
        </select>
      ) : (
        <select
          multiple
          className="w-full rounded-xl border border-slate-200 px-3 py-2"
          value={merged.multiColumns ?? []}
          onChange={(event) =>
            onUpdate({
              ...merged,
              multiColumns: Array.from(event.target.selectedOptions).map((option) => option.value),
            })
          }
        >
          {columns.map((column) => (
            <option key={column} value={column}>
              {column}
            </option>
          ))}
        </select>
      )}
    </div>
  )
}

const MappingPanel = ({ columns, mapping, onChange, onValidate, disabled }: MappingPanelProps) => {
  const handleSingleColumn = (key: keyof MappingConfig, column: string) => {
    onChange({
      ...mapping,
      [key]: column || undefined,
    })
  }

  const handleQ3Change = (domain: (typeof Q3_DOMAINS)[number], column: string) => {
    onChange({
      ...mapping,
      q3: {
        ...(mapping.q3 ?? {}),
        [domain]: column || undefined,
      },
    })
  }

  return (
    <section className="rounded-2xl bg-white p-6 shadow-lg">
      <div className="flex flex-col gap-3 md:flex-row md:items-start md:justify-between">
        <div>
          <h2 className="text-xl font-semibold text-slate-900">Mapping des colonnes</h2>
          <p className="text-sm text-slate-500">
            Sélectionnez les colonnes correspondantes pour chaque question. Le mapping est conservé localement.
          </p>
        </div>
        <button
          className="inline-flex items-center justify-center rounded-xl bg-emerald-600 px-4 py-2 font-semibold text-white shadow-lg hover:bg-emerald-500 disabled:opacity-50"
          onClick={onValidate}
          disabled={disabled}
        >
          Valider le mapping
        </button>
      </div>

      <div className="mt-6 grid gap-4 md:grid-cols-2">
        {[
          { key: 'q1', label: 'Q1 - Organisation' },
          { key: 'q2', label: 'Q2 - Taille de la structure' },
          { key: 'q5', label: 'Q5 - Autres compétences clés (texte)' },
          { key: 'q8', label: 'Q8 - Importance badges/certifs' },
          { key: 'q8bis', label: 'Q8bis - Notoriété formation' },
          { key: 'q9', label: 'Q9 - Difficultés de recrutement (texte)' },
          { key: 'q10', label: 'Q10 - Compétences à développer (texte)' },
          { key: 'q12', label: 'Q12 - Métiers émergents (texte)' },
        ].map(({ key, label }) => (
          <label key={key} className="space-y-2 text-sm font-medium text-slate-700">
            <span>{label}</span>
            <select
              className="w-full rounded-xl border border-slate-200 px-3 py-2"
              value={(mapping as Record<string, string | undefined>)[key] ?? ''}
              onChange={(event) => handleSingleColumn(key as keyof MappingConfig, event.target.value)}
            >
              <option value="">-- Choisir une colonne --</option>
              {columns.map((column) => (
                <option key={column} value={column}>
                  {column}
                </option>
              ))}
            </select>
          </label>
        ))}
      </div>

      <div className="mt-8 space-y-4">
        <div>
          <h3 className="text-lg font-semibold text-slate-900">Q3 - Domaines à classer</h3>
          <p className="text-sm text-slate-500">
            Chaque domaine doit être relié à une colonne contenant un rang (1 à 8). Les domaines non mappés seront ignorés.
          </p>
        </div>
        <div className="grid gap-4 md:grid-cols-2">
          {Q3_DOMAINS.map((domain) => (
            <label key={domain} className="text-sm font-medium text-slate-700">
              <span className="mb-1 block text-slate-600">{domain}</span>
              <select
                className="w-full rounded-xl border border-slate-200 px-3 py-2"
                value={mapping.q3?.[domain] ?? ''}
                onChange={(event) => handleQ3Change(domain, event.target.value)}
              >
                <option value="">-- Choisir une colonne --</option>
                {columns.map((column) => (
                  <option key={column} value={column}>
                    {column}
                  </option>
                ))}
              </select>
            </label>
          ))}
        </div>
      </div>

      <div className="mt-8 space-y-4">
        <MultiChoiceConfigurator
          label="Q7 - Certifications valorisées"
          config={mapping.q7}
          columns={columns}
          onUpdate={(next) => onChange({ ...mapping, q7: next })}
        />
        <MultiChoiceConfigurator
          label="Q7bis - Connaissances normatives"
          config={mapping.q7bis}
          columns={columns}
          onUpdate={(next) => onChange({ ...mapping, q7bis: next })}
        />
        <MultiChoiceConfigurator
          label="Q11 - Formats privilégiés"
          config={mapping.q11}
          columns={columns}
          onUpdate={(next) => onChange({ ...mapping, q11: next })}
        />
        <MultiChoiceConfigurator
          label="Q13 - Outils / dispositifs utiles"
          config={mapping.q13}
          columns={columns}
          onUpdate={(next) => onChange({ ...mapping, q13: next })}
        />
      </div>
    </section>
  )
}

export default MappingPanel
