import { PropsWithChildren, useState } from 'react'

interface ResultSectionProps extends PropsWithChildren {
  title: string
  description?: string
  defaultOpen?: boolean
}

const ResultSection = ({ title, description, defaultOpen = true, children }: ResultSectionProps) => {
  const [open, setOpen] = useState(defaultOpen)

  return (
    <section className="rounded-2xl border border-slate-200 bg-white shadow-sm">
      <button
        type="button"
        onClick={() => setOpen((prev) => !prev)}
        className="flex w-full items-center justify-between px-5 py-4 text-left"
      >
        <div>
          <h3 className="text-lg font-semibold text-slate-900">{title}</h3>
          {description && <p className="text-sm text-slate-500">{description}</p>}
        </div>
        <span className="text-sm font-medium text-emerald-600">{open ? 'Réduire' : 'Afficher'}</span>
      </button>
      {open && <div className="border-t border-slate-100 px-5 py-4">{children}</div>}
    </section>
  )
}

export default ResultSection
