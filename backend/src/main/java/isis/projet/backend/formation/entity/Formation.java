package isis.projet.backend.formation.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Formation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String url;
    private String domain;
    private String organisme;
    private String duree;
    private Boolean certifiant;

    public Formation() {}

    public Formation(String name, String description, String url, String domain, String organisme, String duree, Boolean certifiant) {
        this.name = name;
        this.description = description;
        this.url = url;
        this.domain = domain;
        this.organisme = organisme;
        this.duree = duree;
        this.certifiant = certifiant;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
    public String getDomain() { return domain; }
    public void setDomain(String domain) { this.domain = domain; }
    public String getOrganisme() { return organisme; }
    public void setOrganisme(String organisme) { this.organisme = organisme; }
    public String getDuree() { return duree; }
    public void setDuree(String duree) { this.duree = duree; }
    public Boolean getCertifiant() { return certifiant; }
    public void setCertifiant(Boolean certifiant) { this.certifiant = certifiant; }
}
