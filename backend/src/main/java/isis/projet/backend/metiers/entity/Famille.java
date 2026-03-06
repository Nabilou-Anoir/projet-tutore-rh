package isis.projet.backend.metiers.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "famille_si")
public class Famille {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, length = 150)
    private String nom;

    @Column(length = 5000)
    private String description;

    private Integer ordre;

    @Column(length = 20)
    private String icone;

    @OneToMany(mappedBy = "famille", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Metier> metiers = new ArrayList<>();

    public Famille() {
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

    public Integer getOrdre() {
        return ordre;
    }

    public void setOrdre(Integer ordre) {
        this.ordre = ordre;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }

    public List<Metier> getMetiers() {
        return metiers;
    }

    public void setMetiers(List<Metier> metiers) {
        this.metiers = metiers;
    }
}
