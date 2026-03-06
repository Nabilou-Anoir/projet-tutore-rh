package isis.projet.backend.referentiel.service;

import isis.projet.backend.referentiel.entity.Competence;
import isis.projet.backend.referentiel.entity.DomaineCompetence;
import isis.projet.backend.referentiel.repository.CompetenceRepository;
import isis.projet.backend.referentiel.repository.DomaineCompetenceRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CompetenceService {
    private final CompetenceRepository competenceRepository;
    private final DomaineCompetenceRepository domaineRepository;

    public CompetenceService(CompetenceRepository competenceRepository,
            DomaineCompetenceRepository domaineRepository) {
        this.competenceRepository = competenceRepository;
        this.domaineRepository = domaineRepository;
    }

    public List<Competence> findAll() {
        return competenceRepository.findAll();
    }

    public Optional<Competence> findById(Long id) {
        return competenceRepository.findById(id);
    }

    public List<Competence> findByDomaineId(Long domaineId) {
        return competenceRepository.findByDomaineId(domaineId);
    }

    public Competence create(String nom, String description, String niveauAttendu, Long domaineId) {
        Competence c = new Competence();
        c.setNom(nom);
        c.setDescription(description);
        c.setNiveauAttendu(niveauAttendu);
        if (domaineId != null) {
            DomaineCompetence domaine = domaineRepository.findById(domaineId)
                    .orElseThrow(() -> new RuntimeException("Domaine introuvable : " + domaineId));
            c.setDomaine(domaine);
        }
        return competenceRepository.save(c);
    }

    public Competence update(Long id, String nom, String description, String niveauAttendu, Long domaineId) {
        Competence c = competenceRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Compétence introuvable : " + id));
        if (nom != null)
            c.setNom(nom);
        if (description != null)
            c.setDescription(description);
        if (niveauAttendu != null)
            c.setNiveauAttendu(niveauAttendu);
        if (domaineId != null) {
            DomaineCompetence domaine = domaineRepository.findById(domaineId)
                    .orElseThrow(() -> new RuntimeException("Domaine introuvable : " + domaineId));
            c.setDomaine(domaine);
        }
        return competenceRepository.save(c);
    }

    public void delete(Long id) {
        competenceRepository.deleteById(id);
    }
}
