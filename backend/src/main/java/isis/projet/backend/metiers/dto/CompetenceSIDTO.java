package isis.projet.backend.metiers.dto;

import jakarta.validation.constraints.NotBlank;

/** DTO for CompetenceSI (catalogue) */
public record CompetenceSIDTO(
        Long id,
        @NotBlank String nom,
        String description) {
}
