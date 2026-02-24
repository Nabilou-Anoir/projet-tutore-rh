package isis.projet.backend.referentiel.service;

import isis.projet.backend.referentiel.entity.DomaineCompetence;
import isis.projet.backend.referentiel.repository.DomaineCompetenceRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class DomaineCompetenceService {

    private final DomaineCompetenceRepository repository;

    public DomaineCompetenceService(DomaineCompetenceRepository repository) {
        this.repository = repository;
    }

    public List<DomaineCompetence> findAll() {
        return repository.findAll();
    }

    public Optional<DomaineCompetence> findById(Long id) {
        return repository.findById(id);
    }

    public DomaineCompetence save(DomaineCompetence domaine) {
        return repository.save(domaine);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
}
