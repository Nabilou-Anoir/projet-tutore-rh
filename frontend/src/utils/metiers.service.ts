import type { Famille, Metier, Activite, CompetenceSI, MetierCompetence } from '../types/referentiel'

const BASE = '/api'

// ─── helpers ────────────────────────────────────────────────────────────────
async function request<T>(url: string, init?: RequestInit): Promise<T> {
    const res = await fetch(url, {
        headers: { 'Content-Type': 'application/json', ...init?.headers },
        ...init,
    })
    if (!res.ok) {
        try {
            const body = await res.json()
            throw new Error(body.message || `HTTP ${res.status}`)
        } catch (e: any) {
            if (e instanceof Error && e.message !== `HTTP ${res.status}`) throw e
            const text = await res.text().catch(() => `HTTP ${res.status}`)
            throw new Error(text)
        }
    }
    return res.json() as Promise<T>
}

// ─── Familles ────────────────────────────────────────────────────────────────
export const familleApi = {
    list: () => request<Famille[]>(`${BASE}/familles`),
    getById: (id: number) => request<Famille>(`${BASE}/familles/${id}`),
    create: (data: Omit<Famille, 'id'>) =>
        request<Famille>(`${BASE}/familles`, { method: 'POST', body: JSON.stringify(data) }),
    update: (id: number, data: Partial<Famille>) =>
        request<Famille>(`${BASE}/familles/${id}`, { method: 'PUT', body: JSON.stringify(data) }),
    delete: (id: number) => request<void>(`${BASE}/familles/${id}`, { method: 'DELETE' }),
}

// ─── Métiers ─────────────────────────────────────────────────────────────────
export interface MetiersPage {
    content: Metier[]
    totalElements: number
    totalPages: number
    page: number
    size: number
}

export const metierApi = {
    list: (params?: { familleId?: number; q?: string; page?: number; size?: number }) => {
        const qs = new URLSearchParams()
        if (params?.familleId) qs.set('familleId', String(params.familleId))
        if (params?.q) qs.set('q', params.q)
        if (params?.page !== undefined) qs.set('page', String(params.page))
        if (params?.size !== undefined) qs.set('size', String(params.size))
        return request<MetiersPage>(`${BASE}/metiers?${qs}`)
    },
    getById: (id: number) => request<Metier>(`${BASE}/metiers/${id}`),
    create: (data: Omit<Metier, 'id' | 'familleNom'>) =>
        request<Metier>(`${BASE}/metiers`, { method: 'POST', body: JSON.stringify(data) }),
    update: (id: number, data: Partial<Metier>) =>
        request<Metier>(`${BASE}/metiers/${id}`, { method: 'PUT', body: JSON.stringify(data) }),
    delete: (id: number) => request<void>(`${BASE}/metiers/${id}`, { method: 'DELETE' }),
}

// ─── Activités ───────────────────────────────────────────────────────────────
export const activiteApi = {
    list: (metierId: number) => request<Activite[]>(`${BASE}/metiers/${metierId}/activites`),
    create: (metierId: number, data: Omit<Activite, 'id' | 'metierId'>) =>
        request<Activite>(`${BASE}/metiers/${metierId}/activites`, { method: 'POST', body: JSON.stringify(data) }),
    update: (metierId: number, activiteId: number, data: Partial<Activite>) =>
        request<Activite>(`${BASE}/metiers/${metierId}/activites/${activiteId}`, { method: 'PUT', body: JSON.stringify(data) }),
    delete: (metierId: number, activiteId: number) =>
        request<void>(`${BASE}/metiers/${metierId}/activites/${activiteId}`, { method: 'DELETE' }),
}

// ─── Compétences SI ──────────────────────────────────────────────────────────
export interface CompetencesPage {
    content: CompetenceSI[]
    totalElements: number
    totalPages: number
    page: number
    size: number
}

export const competenceSIApi = {
    list: (params?: { q?: string; page?: number; size?: number }) => {
        const qs = new URLSearchParams()
        if (params?.q) qs.set('q', params.q)
        if (params?.page !== undefined) qs.set('page', String(params.page))
        if (params?.size !== undefined) qs.set('size', String(params.size))
        return request<CompetencesPage>(`${BASE}/competences-si?${qs}`)
    },
    create: (data: Omit<CompetenceSI, 'id'>) =>
        request<CompetenceSI>(`${BASE}/competences-si`, { method: 'POST', body: JSON.stringify(data) }),
    update: (id: number, data: Partial<CompetenceSI>) =>
        request<CompetenceSI>(`${BASE}/competences-si/${id}`, { method: 'PUT', body: JSON.stringify(data) }),
    delete: (id: number) => request<void>(`${BASE}/competences-si/${id}`, { method: 'DELETE' }),
    getMetiers: (id: number) => request<Metier[]>(`${BASE}/competences-si/${id}/metiers`),
}

// ─── Métier ↔ Compétences ─────────────────────────────────────────────────────
export const metierCompetenceApi = {
    list: (metierId: number) => request<MetierCompetence[]>(`${BASE}/metiers/${metierId}/competences`),
    add: (metierId: number, data: Omit<MetierCompetence, 'competenceNom' | 'competenceDescription'>) =>
        request<MetierCompetence>(`${BASE}/metiers/${metierId}/competences`, { method: 'POST', body: JSON.stringify(data) }),
    update: (metierId: number, competenceId: number, data: Partial<MetierCompetence>) =>
        request<MetierCompetence>(`${BASE}/metiers/${metierId}/competences/${competenceId}`, { method: 'PUT', body: JSON.stringify(data) }),
    remove: (metierId: number, competenceId: number) =>
        request<void>(`${BASE}/metiers/${metierId}/competences/${competenceId}`, { method: 'DELETE' }),
}
