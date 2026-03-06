package isis.projet.backend.metiers.entity;

import java.io.Serializable;
import java.util.Objects;

public class MetierCompetenceId implements Serializable {

    private Long metier;
    private Long competence;

    public MetierCompetenceId() {
    }

    public MetierCompetenceId(Long metier, Long competence) {
        this.metier = metier;
        this.competence = competence;
    }

    public Long getMetier() {
        return metier;
    }

    public void setMetier(Long metier) {
        this.metier = metier;
    }

    public Long getCompetence() {
        return competence;
    }

    public void setCompetence(Long competence) {
        this.competence = competence;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof MetierCompetenceId))
            return false;
        MetierCompetenceId that = (MetierCompetenceId) o;
        return Objects.equals(metier, that.metier) && Objects.equals(competence, that.competence);
    }

    @Override
    public int hashCode() {
        return Objects.hash(metier, competence);
    }
}
