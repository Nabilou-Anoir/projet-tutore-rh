package isis.projet.backend.metiers.repository;

import isis.projet.backend.metiers.entity.Famille;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@RepositoryRestResource(exported = false)
public interface FamilleRepository extends JpaRepository<Famille, Long> {
    List<Famille> findAllByOrderByOrdreAsc();
}
