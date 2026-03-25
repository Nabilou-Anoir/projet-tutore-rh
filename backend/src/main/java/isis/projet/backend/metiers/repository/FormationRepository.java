package isis.projet.backend.metiers.repository;

import isis.projet.backend.metiers.entity.Formation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface FormationRepository extends JpaRepository<Formation, Long> {

    @Query("SELECT f FROM Formation f JOIN f.competences c WHERE c.id = :competenceId")
    List<Formation> findByCompetenceId(@Param("competenceId") Long competenceId);
}
