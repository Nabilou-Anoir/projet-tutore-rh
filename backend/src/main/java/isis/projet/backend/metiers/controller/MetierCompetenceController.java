package isis.projet.backend.metiers.controller;

import isis.projet.backend.metiers.dto.MetierCompetenceDTO;
import isis.projet.backend.metiers.service.MetierCompetenceService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/metiers/{metierId}/competences")
@CrossOrigin(origins = "*")
public class MetierCompetenceController {

    private final MetierCompetenceService service;

    public MetierCompetenceController(MetierCompetenceService service) {
        this.service = service;
    }

    @GetMapping
    public List<MetierCompetenceDTO> getAll(@PathVariable Long metierId) {
        return service.findByMetierId(metierId);
    }

    @PostMapping
    public ResponseEntity<MetierCompetenceDTO> add(@PathVariable Long metierId,
            @Valid @RequestBody MetierCompetenceDTO dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.addCompetence(metierId, dto));
    }

    @PutMapping("/{competenceId}")
    public MetierCompetenceDTO update(@PathVariable Long metierId,
            @PathVariable Long competenceId,
            @RequestBody MetierCompetenceDTO dto) {
        return service.updateCompetence(metierId, competenceId, dto);
    }

    @DeleteMapping("/{competenceId}")
    public ResponseEntity<Void> delete(@PathVariable Long metierId,
            @PathVariable Long competenceId) {
        service.removeCompetence(metierId, competenceId);
        return ResponseEntity.noContent().build();
    }
}
