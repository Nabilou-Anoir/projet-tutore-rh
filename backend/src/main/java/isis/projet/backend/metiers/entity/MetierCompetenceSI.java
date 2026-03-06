package isis.projet.backend.metiers.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "metier_competence_si", uniqueConstraints = @UniqueConstraint(columnNames = { "metier_id",
        "competence_id" }))
@IdClass(MetierCompetenceId.class)
public class MetierCompetenceSI {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "metier_id", nullable = false)
    @JsonIgnore
    private Metier metier;

    @Id
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "competence_id", nullable = false)
    private CompetenceSI competence;

    /** 1=Notions, 2=Intermédiaire, 3=Avancé, 4=Expert */
    @Column(name = "niveau_requis", nullable = false)
    private Integer niveauRequis = 1;

    @Column(nullable = false)
    private Boolean obligatoire = false;

    private Integer ordre;

    public MetierCompetenceSI() {
    }

    public Metier getMetier() {
        return metier;
    }

    public void setMetier(Metier metier) {
        this.metier = metier;
    }

    public CompetenceSI getCompetence() {
        return competence;
    }

    public void setCompetence(CompetenceSI competence) {
        this.competence = competence;
    }

    public Integer getNiveauRequis() {
        return niveauRequis;
    }

    public void setNiveauRequis(Integer niveauRequis) {
        this.niveauRequis = niveauRequis;
    }

    public Boolean getObligatoire() {
        return obligatoire;
    }

    public void setObligatoire(Boolean obligatoire) {
        this.obligatoire = obligatoire;
    }

    public Integer getOrdre() {
        return ordre;
    }

    public void setOrdre(Integer ordre) {
        this.ordre = ordre;
    }
}
