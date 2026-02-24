package isis.projet.backend.formation.service;

import isis.projet.backend.formation.entity.Formation;
import isis.projet.backend.formation.repository.FormationRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FormationService {

    private final FormationRepository repository;

    public FormationService(FormationRepository repository) {
        this.repository = repository;
    }

    public List<Formation> findAll() {
        return repository.findAll();
    }

    public Optional<Formation> findById(Long id) {
        return repository.findById(id);
    }

    public Formation create(String name, String description, String url, String domain, String organisme, String duree,
            Boolean certifiant) {
        Formation formation = new Formation(name, description, url, domain, organisme, duree, certifiant);
        return repository.save(formation);
    }

    public Formation update(Long id, String name, String description, String url, String domain, String organisme,
            String duree, Boolean certifiant) {
        Formation formation = repository.findById(id).orElseThrow(() -> new RuntimeException("Formation non trouvée"));
        formation.setName(name);
        formation.setDescription(description);
        formation.setUrl(url);
        formation.setDomain(domain);
        formation.setOrganisme(organisme);
        formation.setDuree(duree);
        formation.setCertifiant(certifiant);
        return repository.save(formation);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
}
