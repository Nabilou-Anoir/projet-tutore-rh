package isis.projet.backend.metiers.dto;

import jakarta.validation.constraints.NotBlank;

/** DTO for Activite */
public record ActiviteDTO(
                Long id,
                Long metierId,
                @NotBlank String libelle,
                String description,
                Integer ordre) {
}
