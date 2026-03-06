package isis.projet.backend.metiers.repository;

import isis.projet.backend.metiers.entity.Metier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@RepositoryRestResource(exported = false)
public interface MetierRepository extends JpaRepository<Metier, Long> {

        List<Metier> findByFamilleId(Long familleId);

        @Query("SELECT m FROM Metier m JOIN m.metierCompetences mc WHERE mc.competence.id = :competenceId")
        List<Metier> findByCompetenceId(@Param("competenceId") Long competenceId);

        @Query("SELECT m FROM Metier m WHERE (:familleId IS NULL OR m.famille.id = :familleId) " +
                        "AND (:search IS NULL OR LOWER(m.titre) LIKE LOWER(CONCAT('%', :search, '%')) " +
                        "OR LOWER(m.description) LIKE LOWER(CONCAT('%', :search, '%')))")
        Page<Metier> findFiltered(@Param("familleId") Long familleId,
                        @Param("search") String search,
                        Pageable pageable);
}
