package isis.projet.backend.referentiel.repository;

import isis.projet.backend.referentiel.entity.Competence;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CompetenceRepository extends JpaRepository<Competence, Long> {
    List<Competence> findByDomaineId(Long domaineId);
}
