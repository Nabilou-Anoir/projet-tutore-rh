package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.FormationDTO;
import isis.projet.backend.metiers.entity.CompetenceSI;
import isis.projet.backend.metiers.entity.Formation;
import isis.projet.backend.metiers.repository.CompetenceSIRepository;
import isis.projet.backend.metiers.repository.FormationRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional
public class FormationService {

    private final FormationRepository formationRepo;
    private final CompetenceSIRepository competenceRepo;

    public FormationService(FormationRepository formationRepo, CompetenceSIRepository competenceRepo) {
        this.formationRepo = formationRepo;
        this.competenceRepo = competenceRepo;
    }

    public List<FormationDTO> findAll() {
        return formationRepo.findAll().stream().map(this::toDTO).toList();
    }

    public List<FormationDTO> findByCompetenceId(Long competenceId) {
        return formationRepo.findByCompetenceId(competenceId).stream().map(this::toDTO).toList();
    }

    public FormationDTO findById(Long id) {
        Formation formation = formationRepo.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Formation introuvable"));
        return toDTO(formation);
    }

    public FormationDTO create(FormationDTO dto) {
        Formation formation = new Formation();
        updateEntityFromDTO(formation, dto);
        return toDTO(formationRepo.save(formation));
    }

    public FormationDTO update(Long id, FormationDTO dto) {
        Formation formation = formationRepo.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Formation introuvable"));
        updateEntityFromDTO(formation, dto);
        return toDTO(formationRepo.save(formation));
    }

    public void delete(Long id) {
        if (!formationRepo.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Formation introuvable");
        }
        formationRepo.deleteById(id);
    }

    private void updateEntityFromDTO(Formation formation, FormationDTO dto) {
        formation.setNom(dto.nom());
        formation.setDescription(dto.description());
        formation.setUrl(dto.url());
        formation.setOrganisme(dto.organisme());

        if (dto.competenceIds() != null) {
            Set<CompetenceSI> competences = new HashSet<>(competenceRepo.findAllById(dto.competenceIds()));
            formation.setCompetences(competences);
        } else {
            formation.getCompetences().clear();
        }
    }

    private FormationDTO toDTO(Formation formation) {
        Set<Long> competenceIds = formation.getCompetences().stream()
                .map(CompetenceSI::getId)
                .collect(Collectors.toSet());
        return new FormationDTO(
                formation.getId(),
                formation.getNom(),
                formation.getDescription(),
                formation.getUrl(),
                formation.getOrganisme(),
                competenceIds
        );
    }
}
