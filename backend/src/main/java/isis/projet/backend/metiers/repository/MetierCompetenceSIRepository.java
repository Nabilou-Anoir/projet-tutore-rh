package isis.projet.backend.metiers.repository;

import isis.projet.backend.metiers.entity.MetierCompetenceId;
import isis.projet.backend.metiers.entity.MetierCompetenceSI;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@RepositoryRestResource(exported = false)
public interface MetierCompetenceSIRepository extends JpaRepository<MetierCompetenceSI, MetierCompetenceId> {

    List<MetierCompetenceSI> findByMetierIdOrderByOrdreAsc(Long metierId);

    boolean existsByMetierIdAndCompetenceId(Long metierId, Long competenceId);

    boolean existsByCompetenceId(Long competenceId);
}
