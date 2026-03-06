package isis.projet.backend.metiers.controller;

import isis.projet.backend.metiers.dto.ActiviteDTO;
import isis.projet.backend.metiers.service.ActiviteService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/metiers/{metierId}/activites")
@CrossOrigin(origins = "*")
public class ActiviteController {

    private final ActiviteService service;

    public ActiviteController(ActiviteService service) {
        this.service = service;
    }

    @GetMapping
    public List<ActiviteDTO> getAll(@PathVariable Long metierId) {
        return service.findByMetierId(metierId);
    }

    @PostMapping
    public ResponseEntity<ActiviteDTO> create(@PathVariable Long metierId,
            @Valid @RequestBody ActiviteDTO dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(metierId, dto));
    }

    @PutMapping("/{activiteId}")
    public ActiviteDTO update(@PathVariable Long metierId,
            @PathVariable Long activiteId,
            @Valid @RequestBody ActiviteDTO dto) {
        return service.update(metierId, activiteId, dto);
    }

    @DeleteMapping("/{activiteId}")
    public ResponseEntity<Void> delete(@PathVariable Long metierId,
            @PathVariable Long activiteId) {
        service.delete(metierId, activiteId);
        return ResponseEntity.noContent().build();
    }
}
