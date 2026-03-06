package isis.projet.backend.metiers.dto;

import jakarta.validation.constraints.NotBlank;

/** DTO for Famille — used for create/update requests and list responses */
public record FamilleDTO(
                Long id,
                @NotBlank String nom,
                String description,
                Integer ordre,
                String icone) {
}
