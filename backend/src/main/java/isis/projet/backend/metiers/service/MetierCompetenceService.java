package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.MetierCompetenceDTO;
import isis.projet.backend.metiers.entity.CompetenceSI;
import isis.projet.backend.metiers.entity.Metier;
import isis.projet.backend.metiers.entity.MetierCompetenceId;
import isis.projet.backend.metiers.entity.MetierCompetenceSI;
import isis.projet.backend.metiers.repository.CompetenceSIRepository;
import isis.projet.backend.metiers.repository.MetierCompetenceSIRepository;
import isis.projet.backend.metiers.repository.MetierRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;

@Service
@Transactional
public class MetierCompetenceService {

    private final MetierCompetenceSIRepository linkRepo;
    private final MetierRepository metierRepo;
    private final CompetenceSIRepository competenceRepo;

    public MetierCompetenceService(MetierCompetenceSIRepository linkRepo,
            MetierRepository metierRepo,
            CompetenceSIRepository competenceRepo) {
        this.linkRepo = linkRepo;
        this.metierRepo = metierRepo;
        this.competenceRepo = competenceRepo;
    }

    public List<MetierCompetenceDTO> findByMetierId(Long metierId) {
        checkMetierExists(metierId);
        return linkRepo.findByMetierIdOrderByOrdreAsc(metierId)
                .stream().map(this::toDTO).toList();
    }

    public MetierCompetenceDTO addCompetence(Long metierId, MetierCompetenceDTO dto) {
        Metier metier = metierRepo.findById(metierId)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + metierId));

        CompetenceSI competence;
        if (dto.competenceId() != null) {
            competence = competenceRepo.findById(dto.competenceId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                            "Compétence introuvable : " + dto.competenceId()));
        } else if (dto.competenceNom() != null && !dto.competenceNom().isBlank()) {
            competence = competenceRepo.findByNomIgnoreCase(dto.competenceNom().trim())
                    .orElseGet(() -> {
                        CompetenceSI newComp = new CompetenceSI();
                        newComp.setNom(dto.competenceNom().trim());
                        newComp.setDescription(dto.competenceDescription());
                        return competenceRepo.save(newComp);
                    });
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "ID ou nom de compétence requis");
        }

        if (linkRepo.existsByMetierIdAndCompetenceId(metierId, competence.getId()))
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Ce lien métier-compétence existe déjà");

        MetierCompetenceSI link = new MetierCompetenceSI();
        link.setMetier(metier);
        link.setCompetence(competence);
        link.setNiveauRequis(dto.niveauRequis() != null ? dto.niveauRequis() : 1);
        link.setObligatoire(dto.obligatoire() != null ? dto.obligatoire() : false);
        link.setOrdre(dto.ordre());
        return toDTO(linkRepo.save(link));
    }

    public MetierCompetenceDTO updateCompetence(Long metierId, Long competenceId, MetierCompetenceDTO dto) {
        MetierCompetenceId pk = new MetierCompetenceId(metierId, competenceId);
        MetierCompetenceSI link = linkRepo.findById(pk)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "Lien métier-compétence introuvable pour métier=" + metierId + " compétence=" + competenceId));
        if (dto.niveauRequis() != null)
            link.setNiveauRequis(dto.niveauRequis());
        if (dto.obligatoire() != null)
            link.setObligatoire(dto.obligatoire());
        if (dto.ordre() != null)
            link.setOrdre(dto.ordre());
        return toDTO(linkRepo.save(link));
    }

    public void removeCompetence(Long metierId, Long competenceId) {
        Metier metier = metierRepo.findById(metierId)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + metierId));

        MetierCompetenceId pk = new MetierCompetenceId(metierId, competenceId);
        MetierCompetenceSI link = linkRepo.findById(pk)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "Lien métier-compétence introuvable pour métier=" + metierId + " compétence=" + competenceId));

        // Retrait de la collection pour la cohérence orphanRemoval
        metier.getMetierCompetences().remove(link);
        linkRepo.delete(link); // Suppression explicite
        metierRepo.save(metier);
    }

    private void checkMetierExists(Long metierId) {
        if (!metierRepo.existsById(metierId))
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + metierId);
    }

    private MetierCompetenceDTO toDTO(MetierCompetenceSI link) {
        CompetenceSI c = link.getCompetence();
        return new MetierCompetenceDTO(
                c.getId(), c.getNom(), c.getDescription(),
                link.getNiveauRequis(), link.getObligatoire(), link.getOrdre());
    }
}
