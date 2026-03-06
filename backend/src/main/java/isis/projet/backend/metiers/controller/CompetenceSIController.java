package isis.projet.backend.metiers.controller;

import isis.projet.backend.metiers.dto.CompetenceSIDTO;
import isis.projet.backend.metiers.dto.MetierDTO;
import isis.projet.backend.metiers.service.CompetenceSIService;
import isis.projet.backend.metiers.service.MetierService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/competences-si")
@CrossOrigin(origins = "*")
public class CompetenceSIController {

    private final CompetenceSIService service;
    private final MetierService metierService;

    public CompetenceSIController(CompetenceSIService service, MetierService metierService) {
        this.service = service;
        this.metierService = metierService;
    }

    @GetMapping("/{id}/metiers")
    public List<MetierDTO> getMetiers(@PathVariable Long id) {
        return metierService.findByCompetenceId(id);
    }

    /** GET /api/competences-si?q=gestion&page=0&size=20 */
    @GetMapping
    public Map<String, Object> getAll(
            @RequestParam(required = false) String q,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return service.findFiltered(q, page, size);
    }

    @GetMapping("/{id}")
    public CompetenceSIDTO getById(@PathVariable Long id) {
        return service.findById(id);
    }

    @PostMapping
    public ResponseEntity<CompetenceSIDTO> create(@Valid @RequestBody CompetenceSIDTO dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(dto));
    }

    @PutMapping("/{id}")
    public CompetenceSIDTO update(@PathVariable Long id, @Valid @RequestBody CompetenceSIDTO dto) {
        return service.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
