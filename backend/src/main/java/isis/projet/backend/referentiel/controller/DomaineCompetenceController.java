package isis.projet.backend.referentiel.controller;

import isis.projet.backend.referentiel.entity.DomaineCompetence;
import isis.projet.backend.referentiel.service.DomaineCompetenceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/rest/domaines")
@CrossOrigin(origins = "*")
public class DomaineCompetenceController {

    private final DomaineCompetenceService service;

    public DomaineCompetenceController(DomaineCompetenceService service) {
        this.service = service;
    }

    @GetMapping
    public List<DomaineCompetence> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<DomaineCompetence> getById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public DomaineCompetence create(@RequestBody DomaineCompetence domaine) {
        return service.save(domaine);
    }

    @PutMapping("/{id}")
    public ResponseEntity<DomaineCompetence> update(@PathVariable Long id, @RequestBody DomaineCompetence domaine) {
        return service.findById(id).map(existing -> {
            if (domaine.getNom() != null)
                existing.setNom(domaine.getNom());
            if (domaine.getDescription() != null)
                existing.setDescription(domaine.getDescription());
            if (domaine.getIcone() != null)
                existing.setIcone(domaine.getIcone());
            return ResponseEntity.ok(service.save(existing));
        }).orElse(ResponseEntity.notFound().build());
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
