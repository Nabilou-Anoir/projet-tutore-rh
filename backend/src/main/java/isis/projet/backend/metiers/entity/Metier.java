package isis.projet.backend.metiers.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "metier_si")
public class Metier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "famille_id", nullable = false)
    @JsonIgnore
    private Famille famille;

    @Column(name = "famille_id", insertable = false, updatable = false)
    private Long familleId;

    @NotBlank
    @Column(nullable = false, length = 150)
    private String titre;

    @Column(length = 5000)
    private String description;

    @Column(name = "mission_courte", length = 5000)
    private String missionCourte;

    @Column(nullable = false)
    private Boolean actif = true;

    @OneToMany(mappedBy = "metier", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Activite> activites = new ArrayList<>();

    @OneToMany(mappedBy = "metier", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MetierCompetenceSI> metierCompetences = new ArrayList<>();

    public Metier() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Famille getFamille() {
        return famille;
    }

    public void setFamille(Famille famille) {
        this.famille = famille;
    }

    public Long getFamilleId() {
        return familleId;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMissionCourte() {
        return missionCourte;
    }

    public void setMissionCourte(String missionCourte) {
        this.missionCourte = missionCourte;
    }

    public Boolean getActif() {
        return actif;
    }

    public void setActif(Boolean actif) {
        this.actif = actif;
    }

    public List<Activite> getActivites() {
        return activites;
    }

    public void setActivites(List<Activite> activites) {
        this.activites = activites;
    }

    public List<MetierCompetenceSI> getMetierCompetences() {
        return metierCompetences;
    }

    public void setMetierCompetences(List<MetierCompetenceSI> metierCompetences) {
        this.metierCompetences = metierCompetences;
    }
}
