package isis.projet.backend.referentiel.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import isis.projet.backend.formation.entity.Formation;
import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

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

    @ManyToMany
    @JoinTable(name = "competence_formation", joinColumns = @JoinColumn(name = "competence_id"), inverseJoinColumns = @JoinColumn(name = "formation_id"))
    private Set<Formation> formations = new HashSet<>();

    public Competence() {
    }

    public Competence(String nom, String description, String niveauAttendu) {
        this.nom = nom;
        this.description = description;
        this.niveauAttendu = niveauAttendu;
    }

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

    public Set<Formation> getFormations() {
        return formations;
    }

    public void setFormations(Set<Formation> formations) {
        this.formations = formations;
    }
}
