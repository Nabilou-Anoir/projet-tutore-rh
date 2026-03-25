import { NIVEAUX_SI } from '../../types/referentiel'

interface NiveauBadgeProps {
  niveau: number
}

const NiveauBadge = ({ niveau }: NiveauBadgeProps) => {
  const value = Number(niveau)
  const match =
    NIVEAUX_SI.find((item) => item.value === value) ??
    (value > 5 ? NIVEAUX_SI[NIVEAUX_SI.length - 1] : NIVEAUX_SI[0])

  return (
    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${match?.color ?? ''}`}>
      {match?.label ?? ''}
    </span>
  )
}

export default NiveauBadge

