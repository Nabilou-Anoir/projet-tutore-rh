package isis.projet.backend.metiers.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/** DTO for Metier */
public record MetierDTO(
        Long id,
        @NotNull Long familleId,
        String familleNom,
        @NotBlank String titre,
        String description,
        String missionCourte,
        Boolean actif) {
}
