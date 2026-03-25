package isis.projet.backend.metiers.controller;

import isis.projet.backend.metiers.dto.FormationDTO;
import isis.projet.backend.metiers.service.FormationService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/formations")
@CrossOrigin(origins = "*")
public class FormationController {

    private final FormationService service;

    public FormationController(FormationService service) {
        this.service = service;
    }

    @GetMapping
    public List<FormationDTO> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public FormationDTO getById(@PathVariable Long id) {
        return service.findById(id);
    }

    @GetMapping("/competence/{competenceId}")
    public List<FormationDTO> getByCompetenceId(@PathVariable Long competenceId) {
        return service.findByCompetenceId(competenceId);
    }

    @PostMapping
    public ResponseEntity<FormationDTO> create(@Valid @RequestBody FormationDTO dto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(dto));
    }

    @PutMapping("/{id}")
    public FormationDTO update(@PathVariable Long id, @Valid @RequestBody FormationDTO dto) {
        return service.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
