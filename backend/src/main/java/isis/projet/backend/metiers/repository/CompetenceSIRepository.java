package isis.projet.backend.metiers.repository;

import isis.projet.backend.metiers.entity.CompetenceSI;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

@Repository
@RepositoryRestResource(exported = false)
public interface CompetenceSIRepository extends JpaRepository<CompetenceSI, Long> {

    @Query("SELECT c FROM CompetenceSI c WHERE :search IS NULL OR " +
            "LOWER(c.nom) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            "LOWER(c.description) LIKE LOWER(CONCAT('%', :search, '%'))")
    Page<CompetenceSI> findFiltered(@Param("search") String search, Pageable pageable);

    java.util.Optional<CompetenceSI> findByNomIgnoreCase(String nom);
}
