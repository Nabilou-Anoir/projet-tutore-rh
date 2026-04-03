package isis.projet.backend.metiers.dto;

public record FamilleOverviewDTO(
        Long familleId,
        String nom,
        String icone,
        Integer ordre,
        long metiersTotal,
        long metiersActifs,
        long competencesDistinctes,
        double niveauMoyenRequis) {
}
