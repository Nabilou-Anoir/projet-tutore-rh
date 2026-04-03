package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.FamilleOverviewDTO;
import isis.projet.backend.metiers.entity.Famille;
import isis.projet.backend.metiers.repository.FamilleRepository;
import isis.projet.backend.metiers.repository.MetierCompetenceSIRepository;
import isis.projet.backend.metiers.repository.MetierRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
public class ReferentielOverviewService {

    private final FamilleRepository familleRepository;
    private final MetierRepository metierRepository;
    private final MetierCompetenceSIRepository metierCompetenceRepository;

    public ReferentielOverviewService(FamilleRepository familleRepository,
                                      MetierRepository metierRepository,
                                      MetierCompetenceSIRepository metierCompetenceRepository) {
        this.familleRepository = familleRepository;
        this.metierRepository = metierRepository;
        this.metierCompetenceRepository = metierCompetenceRepository;
    }

    public List<FamilleOverviewDTO> buildOverview() {
        return familleRepository.findAllByOrderByOrdreAsc().stream()
                .map(this::toOverview)
                .toList();
    }

    private FamilleOverviewDTO toOverview(Famille famille) {
        Long familleId = famille.getId();
        long totalMetiers = metierRepository.countByFamilleId(familleId);
        long metiersActifs = metierRepository.countByFamilleIdAndActifTrue(familleId);
        long competencesDistinctes = metierCompetenceRepository.countDistinctCompetencesByFamille(familleId);
        Double moyenne = metierCompetenceRepository.averageNiveauByFamille(familleId);
        double niveauMoyen = moyenne == null ? 0d
                : BigDecimal.valueOf(moyenne)
                .setScale(2, RoundingMode.HALF_UP)
                .doubleValue();

        return new FamilleOverviewDTO(
                familleId,
                famille.getNom(),
                famille.getIcone(),
                famille.getOrdre(),
                totalMetiers,
                metiersActifs,
                competencesDistinctes,
                niveauMoyen);
    }
}
