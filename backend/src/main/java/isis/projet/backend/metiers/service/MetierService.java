package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.MetierDTO;
import isis.projet.backend.metiers.entity.Famille;
import isis.projet.backend.metiers.entity.Metier;
import isis.projet.backend.metiers.repository.FamilleRepository;
import isis.projet.backend.metiers.repository.MetierRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class MetierService {

    private final MetierRepository metierRepo;
    private final FamilleRepository familleRepo;

    public MetierService(MetierRepository metierRepo, FamilleRepository familleRepo) {
        this.metierRepo = metierRepo;
        this.familleRepo = familleRepo;
    }

    /**
     * Retourne une page de métiers optionnellement filtrés par famille et/ou texte
     */
    public Map<String, Object> findFiltered(Long familleId, String search, int page, int size) {
        Page<Metier> p = metierRepo.findFiltered(
                familleId,
                (search != null && !search.isBlank()) ? search : null,
                PageRequest.of(page, size, Sort.by("titre")));
        return Map.of(
                "content", p.getContent().stream().map(this::toDTO).toList(),
                "totalElements", p.getTotalElements(),
                "totalPages", p.getTotalPages(),
                "page", p.getNumber(),
                "size", p.getSize());
    }

    public List<MetierDTO> findByFamilleId(Long familleId) {
        return metierRepo.findByFamilleId(familleId).stream()
                .map(this::toDTO)
                .toList();
    }

    public List<MetierDTO> findByCompetenceId(Long competenceId) {
        return metierRepo.findByCompetenceId(competenceId).stream()
                .map(this::toDTO)
                .toList();
    }

    public MetierDTO findById(Long id) {
        return metierRepo.findById(id)
                .map(this::toDTO)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + id));
    }

    public MetierDTO create(MetierDTO dto) {
        Famille famille = familleRepo.findById(dto.familleId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST,
                        "Famille introuvable : " + dto.familleId()));
        Metier m = new Metier();
        m.setFamille(famille);
        m.setTitre(dto.titre());
        m.setDescription(dto.description());
        m.setMissionCourte(dto.missionCourte());
        m.setActif(dto.actif() != null ? dto.actif() : true);
        return toDTO(metierRepo.save(m));
    }

    public MetierDTO update(Long id, MetierDTO dto) {
        Metier m = metierRepo.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + id));
        if (dto.familleId() != null) {
            Famille famille = familleRepo.findById(dto.familleId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST,
                            "Famille introuvable : " + dto.familleId()));
            m.setFamille(famille);
        }
        if (dto.titre() != null)
            m.setTitre(dto.titre());
        if (dto.description() != null)
            m.setDescription(dto.description());
        if (dto.missionCourte() != null)
            m.setMissionCourte(dto.missionCourte());
        if (dto.actif() != null)
            m.setActif(dto.actif());
        return toDTO(metierRepo.save(m));
    }

    public void delete(Long id) {
        if (!metierRepo.existsById(id))
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + id);
        metierRepo.deleteById(id);
    }

    public MetierDTO toDTO(Metier m) {
        String familleNom = m.getFamille() != null ? m.getFamille().getNom() : null;
        return new MetierDTO(
                m.getId(),
                m.getFamilleId(),
                familleNom,
                m.getTitre(),
                m.getDescription(),
                m.getMissionCourte(),
                m.getActif());
    }
}
