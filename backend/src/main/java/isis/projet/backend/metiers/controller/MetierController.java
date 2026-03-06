package isis.projet.backend.metiers.controller;

import isis.projet.backend.metiers.dto.MetierDTO;
import isis.projet.backend.metiers.service.MetierService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/metiers")
@CrossOrigin(origins = "*")
public class MetierController {

    private final MetierService service;

    public MetierController(MetierService service) {
        this.service = service;
    }

    /**
     * GET /api/metiers?familleId=1&q=chef&page=0&size=20
     * Renvoie une page de métiers filtrés.
     */
    @GetMapping
    public Map<String, Object> getAll(
            @RequestParam(required = false) Long familleId,
            @RequestParam(required = false) String q,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return service.findFiltered(familleId, q, page, size);
    }

    @GetMapping("/{id}")
    public MetierDTO getById(@PathVariable Long id) {
        return service.findById(id);
    }

    @PostMapping
    public ResponseEntity<MetierDTO> create(@Valid @RequestBody MetierDTO dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(dto));
    }

    @PutMapping("/{id}")
    public MetierDTO update(@PathVariable Long id, @Valid @RequestBody MetierDTO dto) {
        return service.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
