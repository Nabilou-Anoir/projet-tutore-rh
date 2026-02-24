package isis.projet.backend.formation.repository;

import isis.projet.backend.formation.entity.Formation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FormationRepository extends JpaRepository<Formation, Long> {
	// You can add custom query methods here if needed
}
