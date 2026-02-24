package isis.projet.backend.formation.controller;

import isis.projet.backend.formation.entity.Formation;
import isis.projet.backend.formation.service.FormationService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/rest/formations")
@CrossOrigin(origins = "*")
public class FormationController {

    private final FormationService service;

    public FormationController(FormationService service) {
        this.service = service;
    }

    @GetMapping
    public List<Formation> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Formation> getById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Formation create(@RequestBody Map<String, Object> body) {
        String name = (String) body.get("name");
        String description = (String) body.get("description");
        String url = (String) body.get("url");
        String domain = (String) body.get("domain");
        String organisme = (String) body.get("organisme");
        String duree = (String) body.get("duree");
        Boolean certifiant = body.get("certifiant") != null ? (Boolean) body.get("certifiant") : false;

        return service.create(name, description, url, domain, organisme, duree, certifiant);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Formation> update(@PathVariable Long id, @RequestBody Map<String, Object> body) {
        try {
            String name = (String) body.get("name");
            String description = (String) body.get("description");
            String url = (String) body.get("url");
            String domain = (String) body.get("domain");
            String organisme = (String) body.get("organisme");
            String duree = (String) body.get("duree");
            Boolean certifiant = body.get("certifiant") != null ? (Boolean) body.get("certifiant") : false;

            return ResponseEntity.ok(service.update(id, name, description, url, domain, organisme, duree, certifiant));
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
