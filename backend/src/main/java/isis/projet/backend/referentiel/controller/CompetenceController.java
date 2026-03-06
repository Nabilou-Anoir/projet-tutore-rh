package isis.projet.backend.referentiel.controller;

import isis.projet.backend.referentiel.entity.Competence;
import isis.projet.backend.referentiel.service.CompetenceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/rest/competences")
@CrossOrigin(origins = "*")
public class CompetenceController {

    private final CompetenceService service;

    public CompetenceController(CompetenceService service) {
        this.service = service;
    }

    @GetMapping
    public List<Competence> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Competence> getById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Competence create(@RequestBody Map<String, Object> body) {
        String nom = (String) body.get("nom");
        String description = (String) body.get("description");
        String niveauAttendu = (String) body.get("niveauAttendu");
        Long domaineId = body.get("domaineId") != null ? ((Number) body.get("domaineId")).longValue() : null;
        return service.create(nom, description, niveauAttendu, domaineId);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Competence> update(@PathVariable Long id, @RequestBody Map<String, Object> body) {
        try {
            String nom = (String) body.get("nom");
            String description = (String) body.get("description");
            String niveauAttendu = (String) body.get("niveauAttendu");
            Long domaineId = body.get("domaineId") != null ? ((Number) body.get("domaineId")).longValue() : null;
            return ResponseEntity.ok(service.update(id, nom, description, niveauAttendu, domaineId));
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        if (service.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        service.delete(id);
        return ResponseEntity.ok().build();
    }
}
