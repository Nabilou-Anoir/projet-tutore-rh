package isis.projet.backend.metiers.dto;

import jakarta.validation.constraints.NotBlank;
import java.util.Set;

public record FormationDTO(
        Long id,
        @NotBlank String nom,
        String description,
        String url,
        String organisme,
        Set<Long> competenceIds
) {
}
