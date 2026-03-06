package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.FamilleDTO;
import isis.projet.backend.metiers.entity.Famille;
import isis.projet.backend.metiers.repository.FamilleRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;

@Service
@Transactional
public class FamilleService {

    private final FamilleRepository repo;

    public FamilleService(FamilleRepository repo) {
        this.repo = repo;
    }

    public List<FamilleDTO> findAll() {
        return repo.findAllByOrderByOrdreAsc().stream()
                .map(this::toDTO)
                .toList();
    }

    public FamilleDTO findById(Long id) {
        return repo.findById(id)
                .map(this::toDTO)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Famille introuvable : " + id));
    }

    public FamilleDTO create(FamilleDTO dto) {
        Famille f = new Famille();
        f.setNom(dto.nom());
        f.setDescription(dto.description());
        f.setOrdre(dto.ordre());
        f.setIcone(dto.icone());
        return toDTO(repo.save(f));
    }

    public FamilleDTO update(Long id, FamilleDTO dto) {
        Famille f = repo.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Famille introuvable : " + id));
        if (dto.nom() != null)
            f.setNom(dto.nom());
        if (dto.description() != null)
            f.setDescription(dto.description());
        if (dto.ordre() != null)
            f.setOrdre(dto.ordre());
        if (dto.icone() != null)
            f.setIcone(dto.icone());
        return toDTO(repo.save(f));
    }

    public void delete(Long id) {
        if (!repo.existsById(id))
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Famille introuvable : " + id);
        repo.deleteById(id);
    }

    public FamilleDTO toDTO(Famille f) {
        return new FamilleDTO(f.getId(), f.getNom(), f.getDescription(), f.getOrdre(), f.getIcone());
    }
}
