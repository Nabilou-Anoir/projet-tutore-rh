package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.CompetenceSIDTO;
import isis.projet.backend.metiers.entity.CompetenceSI;
import isis.projet.backend.metiers.repository.CompetenceSIRepository;
import isis.projet.backend.metiers.repository.MetierCompetenceSIRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.Map;

@Service
@Transactional
public class CompetenceSIService {

    private final CompetenceSIRepository repo;
    private final MetierCompetenceSIRepository linkRepo;

    public CompetenceSIService(CompetenceSIRepository repo, MetierCompetenceSIRepository linkRepo) {
        this.repo = repo;
        this.linkRepo = linkRepo;
    }

    public Map<String, Object> findFiltered(String search, int page, int size) {
        Page<CompetenceSI> p = repo.findFiltered(
                (search != null && !search.isBlank()) ? search : null,
                PageRequest.of(page, size, Sort.by("nom")));
        return Map.of(
                "content", p.getContent().stream().map(this::toDTO).toList(),
                "totalElements", p.getTotalElements(),
                "totalPages", p.getTotalPages(),
                "page", p.getNumber(),
                "size", p.getSize());
    }

    public CompetenceSIDTO findById(Long id) {
        return repo.findById(id)
                .map(this::toDTO)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Compétence introuvable : " + id));
    }

    public CompetenceSIDTO create(CompetenceSIDTO dto) {
        CompetenceSI c = new CompetenceSI();
        c.setNom(dto.nom());
        c.setDescription(dto.description());
        return toDTO(repo.save(c));
    }

    public CompetenceSIDTO update(Long id, CompetenceSIDTO dto) {
        CompetenceSI c = repo.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Compétence introuvable : " + id));
        if (dto.nom() != null)
            c.setNom(dto.nom());
        if (dto.description() != null)
            c.setDescription(dto.description());
        return toDTO(repo.save(c));
    }

    public void delete(Long id) {
        if (!repo.existsById(id))
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Compétence introuvable : " + id);

        if (linkRepo.existsByCompetenceId(id)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,
                    "Cette compétence est utilisée par un ou plusieurs métiers et ne peut pas être supprimée.");
        }

        repo.deleteById(id);
    }

    public CompetenceSIDTO toDTO(CompetenceSI c) {
        return new CompetenceSIDTO(c.getId(), c.getNom(), c.getDescription());
    }
}
