package isis.projet.backend.referentiel.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

@Entity
public class Competence {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nom;

    private String description;

    private String niveauAttendu; // Débutant, Intermédiaire, Avancé, Expert

    @ManyToOne
    @JoinColumn(name = "domaine_id")
    @JsonBackReference
    private DomaineCompetence domaine;

    @Column(name = "domaine_id", insertable = false, updatable = false)
    private Long domaineId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNiveauAttendu() {
        return niveauAttendu;
    }

    public void setNiveauAttendu(String niveauAttendu) {
        this.niveauAttendu = niveauAttendu;
    }

    public DomaineCompetence getDomaine() {
        return domaine;
    }

    public void setDomaine(DomaineCompetence domaine) {
        this.domaine = domaine;
    }

    public Long getDomaineId() {
        return domaineId;
    }
}
