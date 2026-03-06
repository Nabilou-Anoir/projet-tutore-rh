package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.ActiviteDTO;
import isis.projet.backend.metiers.entity.Activite;
import isis.projet.backend.metiers.entity.Metier;
import isis.projet.backend.metiers.repository.ActiviteRepository;
import isis.projet.backend.metiers.repository.MetierRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;

@Service
@Transactional
public class ActiviteService {

    private final ActiviteRepository activiteRepo;
    private final MetierRepository metierRepo;

    public ActiviteService(ActiviteRepository activiteRepo, MetierRepository metierRepo) {
        this.activiteRepo = activiteRepo;
        this.metierRepo = metierRepo;
    }

    public List<ActiviteDTO> findByMetierId(Long metierId) {
        checkMetierExists(metierId);
        return activiteRepo.findByMetierIdOrderByOrdreAsc(metierId)
                .stream().map(this::toDTO).toList();
    }

    public ActiviteDTO create(Long metierId, ActiviteDTO dto) {
        Metier metier = metierRepo.findById(metierId)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + metierId));
        Activite a = new Activite();
        a.setMetier(metier);
        a.setLibelle(dto.libelle());
        a.setDescription(dto.description());
        a.setOrdre(dto.ordre());
        return toDTO(activiteRepo.save(a));
    }

    public ActiviteDTO update(Long metierId, Long activiteId, ActiviteDTO dto) {
        checkMetierExists(metierId);
        Activite a = activiteRepo.findById(activiteId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "Activité introuvable : " + activiteId));
        if (!metierId.equals(a.getMetierId()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    "Cette activité n'appartient pas au métier " + metierId);
        if (dto.libelle() != null)
            a.setLibelle(dto.libelle());
        if (dto.description() != null)
            a.setDescription(dto.description());
        if (dto.ordre() != null)
            a.setOrdre(dto.ordre());
        return toDTO(activiteRepo.save(a));
    }

    public void delete(Long metierId, Long activiteId) {
        Metier metier = metierRepo.findById(metierId)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + metierId));

        boolean removed = metier.getActivites().removeIf(a -> a.getId().equals(activiteId));
        if (!removed) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Activité introuvable : " + activiteId);
        }
        // L'activité sera supprimée par orphanRemoval=true lors de la fin de la
        // transaction
        metierRepo.save(metier);
    }

    private void checkMetierExists(Long metierId) {
        if (!metierRepo.existsById(metierId))
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Métier introuvable : " + metierId);
    }

    private ActiviteDTO toDTO(Activite a) {
        return new ActiviteDTO(a.getId(), a.getMetierId(), a.getLibelle(), a.getDescription(), a.getOrdre());
    }
}
