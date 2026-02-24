package isis.projet.backend.referentiel.service;

import isis.projet.backend.formation.entity.Formation;
import isis.projet.backend.formation.repository.FormationRepository;
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
    private final FormationRepository formationRepository;

    public CompetenceService(CompetenceRepository competenceRepository,
            DomaineCompetenceRepository domaineRepository,
            FormationRepository formationRepository) {
        this.competenceRepository = competenceRepository;
        this.domaineRepository = domaineRepository;
        this.formationRepository = formationRepository;
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
        Competence c = new Competence(nom, description, niveauAttendu);
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

    public Competence linkFormation(Long competenceId, Long formationId) {
        Competence c = competenceRepository.findById(competenceId)
                .orElseThrow(() -> new RuntimeException("Compétence introuvable : " + competenceId));
        Formation f = formationRepository.findById(formationId)
                .orElseThrow(() -> new RuntimeException("Formation introuvable : " + formationId));
        c.getFormations().add(f);
        return competenceRepository.save(c);
    }

    public Competence unlinkFormation(Long competenceId, Long formationId) {
        Competence c = competenceRepository.findById(competenceId)
                .orElseThrow(() -> new RuntimeException("Compétence introuvable : " + competenceId));
        c.getFormations().removeIf(f -> f.getId().equals(formationId));
        return competenceRepository.save(c);
    }
}
