package isis.projet.backend.metiers.controller;

import isis.projet.backend.metiers.dto.FamilleDTO;
import isis.projet.backend.metiers.service.FamilleService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/familles")
@CrossOrigin(origins = "*")
public class FamilleController {

    private final FamilleService service;

    public FamilleController(FamilleService service) {
        this.service = service;
    }

    @GetMapping
    public List<FamilleDTO> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public FamilleDTO getById(@PathVariable Long id) {
        return service.findById(id);
    }

    @PostMapping
    public ResponseEntity<FamilleDTO> create(@Valid @RequestBody FamilleDTO dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(dto));
    }

    @PutMapping("/{id}")
    public FamilleDTO update(@PathVariable Long id, @Valid @RequestBody FamilleDTO dto) {
        return service.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
