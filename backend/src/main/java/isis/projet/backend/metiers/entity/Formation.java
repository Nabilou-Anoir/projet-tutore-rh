package isis.projet.backend.metiers.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "formation")
public class Formation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, length = 150)
    private String nom;

    @Column(length = 5000)
    private String description;

    @Column(length = 1000)
    private String url;

    @Column(length = 150)
    private String organisme;

    @ManyToMany
    @JoinTable(
        name = "formation_competence",
        joinColumns = @JoinColumn(name = "formation_id"),
        inverseJoinColumns = @JoinColumn(name = "competence_id")
    )
    private Set<CompetenceSI> competences = new HashSet<>();

    public Formation() {
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getOrganisme() {
        return organisme;
    }

    public void setOrganisme(String organisme) {
        this.organisme = organisme;
    }

    public Set<CompetenceSI> getCompetences() {
        return competences;
    }

    public void setCompetences(Set<CompetenceSI> competences) {
        this.competences = competences;
    }
}
