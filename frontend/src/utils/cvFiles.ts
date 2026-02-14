import type { CvDocument, CvSourceType } from '../types/cv'

const TEXT_EXTENSIONS = new Set(['txt', 'md', 'markdown'])

interface CvLoadFailure {
  name: string
  reason: string
}

export interface CvBatchResult {
  documents: CvDocument[]
  failures: CvLoadFailure[]
}

const sanitizeText = (raw: string): string =>
  raw
    .replace(/\r\n/g, '\n')
    .replace(/\r/g, '\n')
    .replace(/\t/g, ' ')
    .replace(/[^\S\n]+/g, ' ')
    .replace(/\n{3,}/g, '\n\n')
    .trim()

const createId = () =>
  typeof crypto !== 'undefined' && 'randomUUID' in crypto ? crypto.randomUUID() : Math.random().toString(36).slice(2)

const getExtension = (filename: string) => {
  const parts = filename.split('.')
  return parts.length > 1 ? parts.pop()!.toLowerCase() : ''
}

const readPdf = async (file: File): Promise<string> => {
  const pdfjsLib = await loadPdfLib()
  const data = await file.arrayBuffer()
  const pdf = await pdfjsLib.getDocument({ data }).promise
  let output = ''
  for (let pageNumber = 1; pageNumber <= pdf.numPages; pageNumber += 1) {
    const page = await pdf.getPage(pageNumber)
    const content = await page.getTextContent()
    const strings = content.items
      .map((item: any) => ('str' in item ? item.str : ''))
      .join(' ')
    output += `${strings}\n`
  }
  return output
}

const isPdf = (file: File, extension: string) => file.type === 'application/pdf' || extension === 'pdf'

const readCv = async (file: File): Promise<CvDocument> => {
  const extension = getExtension(file.name)
  let text: string
  let sourceType: CvSourceType = 'unknown'

  if (isPdf(file, extension)) {
    text = await readPdf(file)
    sourceType = 'pdf'
  } else if (TEXT_EXTENSIONS.has(extension) || file.type.startsWith('text/')) {
    text = await file.text()
    sourceType = 'text'
  } else {
    throw new Error("Format non supporté. Utilisez un PDF ou un fichier texte.")
  }

  const normalized = sanitizeText(text)
  if (!normalized) {
    throw new Error('Fichier vide ou impossible à extraire.')
  }

  const tokens = normalized.split(/\s+/).filter(Boolean)

  return {
    id: createId(),
    name: file.name,
    size: file.size,
    text: normalized,
    sourceType,
    wordCount: tokens.length,
    createdAt: Date.now(),
  }
}

export const loadCvBatch = async (files: FileList | File[]): Promise<CvBatchResult> => {
  const inputs = Array.from(files ?? [])
  if (inputs.length === 0) {
    return { documents: [], failures: [] }
  }

  const settled = await Promise.allSettled(inputs.map((file) => readCv(file)))
  const documents: CvDocument[] = []
  const failures: CvLoadFailure[] = []

  settled.forEach((result, index) => {
    if (result.status === 'fulfilled') {
      documents.push(result.value)
    } else {
      failures.push({
        name: inputs[index].name,
        reason: result.reason instanceof Error ? result.reason.message : 'Erreur inconnue',
      })
    }
  })

  return { documents, failures }
}

type PdfJsLib = typeof import('pdfjs-dist/legacy/build/pdf')

let cachedPdfLib: PdfJsLib | null = null
let workerConfigured = false

const loadPdfLib = async (): Promise<PdfJsLib> => {
  if (cachedPdfLib) return cachedPdfLib
  const pdfjsLib = await import('pdfjs-dist/legacy/build/pdf')
  if (!workerConfigured) {
    const workerSrcModule = await import('pdfjs-dist/build/pdf.worker?url')
    pdfjsLib.GlobalWorkerOptions.workerSrc = workerSrcModule.default
    workerConfigured = true
  }
  cachedPdfLib = pdfjsLib
  return pdfjsLib
}
