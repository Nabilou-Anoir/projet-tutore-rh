import { useState } from 'react'

interface Props {
    onClose: () => void
    onSave: (data: {
        name: string
        description: string
        url: string
        organisme: string
        duree: string
        certifiant: boolean
        domain: string
    }) => void
    initial?: {
        name: string
        description: string
        url: string
        organisme: string
        duree: string
        certifiant: boolean
        domain: string
    }
    domaineName?: string
}

const FormationForm = ({ onClose, onSave, initial, domaineName }: Props) => {
    const [name, setName] = useState(initial?.name ?? '')
    const [description, setDescription] = useState(initial?.description ?? '')
    const [url, setUrl] = useState(initial?.url ?? '')
    const [organisme, setOrganisme] = useState(initial?.organisme ?? '')
    const [duree, setDuree] = useState(initial?.duree ?? '')
    const [certifiant, setCertifiant] = useState(initial?.certifiant ?? false)
    const [domain, setDomain] = useState(initial?.domain ?? domaineName ?? '')

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault()
        if (!name.trim() || !url.trim()) return
        onSave({ name, description, url, organisme, duree, certifiant, domain })
    }

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm" onClick={onClose}>
            <div
                className="w-full max-w-lg max-h-[90vh] overflow-y-auto rounded-2xl bg-white p-6 shadow-2xl"
                onClick={(e) => e.stopPropagation()}
                style={{ animation: 'slideUp 0.3s ease-out' }}
            >
                <h3 className="mb-4 text-lg font-bold text-slate-900">
                    {initial ? 'Modifier la formation' : 'Nouvelle formation'}
                </h3>
                <form onSubmit={handleSubmit} className="flex flex-col gap-4">
                    <div>
                        <label className="mb-1 block text-sm font-medium text-slate-700">Nom *</label>
                        <input
                            type="text"
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            placeholder="Ex : DevOps et automatisation"
                            required
                            className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                        />
                    </div>
                    <div>
                        <label className="mb-1 block text-sm font-medium text-slate-700">Description</label>
                        <textarea
                            value={description}
                            onChange={(e) => setDescription(e.target.value)}
                            placeholder="Décrivez cette formation…"
                            rows={2}
                            className="w-full resize-none rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                        />
                    </div>
                    <div>
                        <label className="mb-1 block text-sm font-medium text-slate-700">URL du site *</label>
                        <input
                            type="url"
                            value={url}
                            onChange={(e) => setUrl(e.target.value)}
                            placeholder="https://example.com/formation/…"
                            required
                            className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                        />
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                        <div>
                            <label className="mb-1 block text-sm font-medium text-slate-700">Organisme</label>
                            <input
                                type="text"
                                value={organisme}
                                onChange={(e) => setOrganisme(e.target.value)}
                                placeholder="Ex : Cloud Académie"
                                className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                            />
                        </div>
                        <div>
                            <label className="mb-1 block text-sm font-medium text-slate-700">Durée</label>
                            <input
                                type="text"
                                value={duree}
                                onChange={(e) => setDuree(e.target.value)}
                                placeholder="Ex : 3 jours"
                                className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                            />
                        </div>
                    </div>
                    <div>
                        <label className="mb-1 block text-sm font-medium text-slate-700">Domaine</label>
                        <input
                            type="text"
                            value={domain}
                            onChange={(e) => setDomain(e.target.value)}
                            placeholder="Ex : Cybersécurité"
                            className="w-full rounded-xl border border-slate-200 px-4 py-2.5 text-sm outline-none transition-all focus:border-sky-400 focus:ring-2 focus:ring-sky-100"
                        />
                    </div>
                    <label className="flex items-center gap-2 cursor-pointer">
                        <input
                            type="checkbox"
                            checked={certifiant}
                            onChange={(e) => setCertifiant(e.target.checked)}
                            className="h-4 w-4 rounded border-slate-300 text-sky-600 focus:ring-sky-500"
                        />
                        <span className="text-sm text-slate-700">Formation certifiante</span>
                    </label>
                    <div className="flex justify-end gap-3 pt-2">
                        <button
                            type="button"
                            onClick={onClose}
                            className="rounded-xl px-4 py-2 text-sm font-medium text-slate-600 hover:bg-slate-100 transition-colors"
                        >
                            Annuler
                        </button>
                        <button
                            type="submit"
                            className="rounded-xl px-5 py-2 text-sm font-semibold text-white shadow-md transition-all hover:shadow-lg active:scale-95"
                            style={{ background: 'linear-gradient(135deg, #10b981, #059669)' }}
                        >
                            {initial ? 'Enregistrer' : 'Ajouter'}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    )
}

export default FormationForm
