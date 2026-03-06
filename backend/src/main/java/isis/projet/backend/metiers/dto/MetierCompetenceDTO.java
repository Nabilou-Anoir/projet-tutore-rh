package isis.projet.backend.metiers.dto;

import jakarta.validation.constraints.NotNull;

/**
 * DTO for the MetierCompetenceSI link (returned + accepted as request payload)
 */
public record MetierCompetenceDTO(
        Long competenceId,
        String competenceNom,
        String competenceDescription,
        @NotNull Integer niveauRequis,
        Boolean obligatoire,
        Integer ordre) {
}
