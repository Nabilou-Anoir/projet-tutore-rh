-- Initialisation des tables
INSERT INTO Country(id, code, name) VALUES
    (1, 'FR', 'France'),
    (2, 'UK', 'United Kingdom'),
    (3, 'US', 'United States of America');
ALTER TABLE Country ALTER COLUMN id RESTART WITH 4;

-- ===================== DOMAINES DE COMPETENCES =====================
INSERT INTO domaine_competence(id, nom, description, icone) VALUES
    (1, 'Développement', 'Compétences en développement logiciel, web et mobile', '💻'),
    (2, 'Architecture logicielle', 'Conception d''architectures applicatives et système', '🏗️'),
    (3, 'Data / Analyse de données', 'Collecte, traitement et exploitation des données', '📊'),
    (4, 'UX/UI Design', 'Conception d''interfaces utilisateur et expérience utilisateur', '🎨'),
    (5, 'RGPD / conformité réglementaire', 'Protection des données et conformité réglementaire en santé', '🔒'),
    (6, 'Cybersécurité', 'Sécurité des systèmes d''information de santé', '🛡️'),
    (7, 'Infrastructure', 'Gestion et déploiement d''infrastructures IT', '🖥️'),
    (8, 'Management Projet, déploiement logiciels', 'Pilotage de projets et déploiement de solutions', '📋');
ALTER TABLE domaine_competence ALTER COLUMN id RESTART WITH 9;

-- ===================== COMPETENCES =====================
INSERT INTO competence(id, nom, description, niveau_attendu, domaine_id) VALUES
    (1, 'DevOps CI/CD', 'Mise en place de pipelines d''intégration et déploiement continu', 'Intermédiaire', 1),
    (2, 'Développement web full-stack', 'Maîtrise front-end et back-end pour applications web', 'Avancé', 1),
    (3, 'Microservices et API REST', 'Conception d''architectures distribuées en microservices', 'Avancé', 2),
    (4, 'Architecture cloud', 'Conception pour le cloud (AWS, Azure, GCP)', 'Intermédiaire', 2),
    (5, 'DataOps & ETL', 'Pipelines de données, extraction, transformation, chargement', 'Intermédiaire', 3),
    (6, 'Visualisation de données', 'Création de tableaux de bord et dataviz', 'Débutant', 3),
    (7, 'Design thinking santé', 'Approche centrée patient pour la conception d''interfaces', 'Intermédiaire', 4),
    (8, 'Accessibilité numérique', 'Normes WCAG et conception inclusive', 'Débutant', 4),
    (9, 'RGPD appliqué à la santé', 'Application du RGPD aux données de santé', 'Avancé', 5),
    (10, 'Audit de conformité', 'Conduite d''audits réglementaires en SI santé', 'Intermédiaire', 5),
    (11, 'Pentest applicatif', 'Tests d''intrusion sur applications web en santé', 'Avancé', 6),
    (12, 'SOC et surveillance', 'Centre opérationnel de sécurité et détection d''incidents', 'Intermédiaire', 6),
    (13, 'Administration cloud', 'Gestion d''infrastructures cloud pour établissements de santé', 'Intermédiaire', 7),
    (14, 'Bases de données critiques', 'Administration de bases de données à haute disponibilité', 'Avancé', 7),
    (15, 'Conduite de projet e-santé', 'Pilotage de projets numériques en environnement hospitalier', 'Intermédiaire', 8),
    (16, 'Déploiement logiciel hospitalier', 'Déploiement et migration de solutions en milieu hospitalier', 'Avancé', 8);
ALTER TABLE competence ALTER COLUMN id RESTART WITH 17;

-- ===================== FORMATIONS =====================
INSERT INTO formation(id, name, description, url, domain, organisme, duree, certifiant) VALUES
    (1, 'Agilité et éco-conception', 'Formation aux méthodes agiles et éco-conception logicielle', 'https://example.com/formation/developpement-agile', 'Développement', 'Institut Numérique', '3 jours', true),
    (2, 'DevOps et automatisation', 'Maîtriser les outils DevOps : Docker, Jenkins, Kubernetes', 'https://example.com/formation/devops', 'Développement', 'Cloud Académie', '5 jours', true),
    (3, 'Architectures modulaires', 'Concevoir des architectures logicielles modulaires et évolutives', 'https://example.com/formation/architecture-modulaire', 'Architecture logicielle', 'TechForma', '2 jours', false),
    (4, 'Patterns applicatifs santé', 'Patterns de conception pour les applications de santé', 'https://example.com/formation/architecture-sante', 'Architecture logicielle', 'HealthTech Campus', '3 jours', true),
    (5, 'DataOps pour la santé', 'Mise en place de pipelines de données en contexte hospitalier', 'https://example.com/formation/dataops', 'Data / Analyse de données', 'DataLab Santé', '4 jours', true),
    (6, 'Visualisation de données avancée', 'Créer des tableaux de bord percutants', 'https://example.com/formation/dataviz', 'Data / Analyse de données', 'Analytics School', '2 jours', false),
    (7, 'UX pour parcours patients', 'Concevoir des parcours utilisateurs centrés sur le patient', 'https://example.com/formation/ux-patient', 'UX/UI Design', 'DesignCare', '3 jours', false),
    (8, 'Accessibilité numérique', 'Normes WCAG et mise en conformité des interfaces', 'https://example.com/formation/accessibilite', 'UX/UI Design', 'Inclusive Lab', '2 jours', true),
    (9, 'Fondamentaux RGPD pour la santé', 'Les bases de la protection des données de santé', 'https://example.com/formation/rgpd', 'RGPD / conformité réglementaire', 'Compliance Plus', '2 jours', true),
    (10, 'Gestion des risques réglementaires', 'Identifier et gérer les risques liés à la réglementation', 'https://example.com/formation/risques-reglementaires', 'RGPD / conformité réglementaire', 'HealthSecure', '3 jours', false),
    (11, 'SOC & surveillance', 'Mettre en place un SOC pour les SI de santé', 'https://example.com/formation/soc', 'Cybersécurité', 'Cyberdefense', '5 jours', true),
    (12, 'Pentest appli santé', 'Tests d''intrusion sur les applications de santé', 'https://example.com/formation/pentest', 'Cybersécurité', 'Security Campus', '4 jours', true),
    (13, 'Cloud pour SI hospitaliers', 'Migration et gestion cloud pour les hôpitaux', 'https://example.com/formation/cloud-sante', 'Infrastructure', 'InfraHealth', '5 jours', true),
    (14, 'Bases de données critiques', 'Administration PostgreSQL et haute disponibilité', 'https://example.com/formation/bdd', 'Infrastructure', 'DataCore', '3 jours', false),
    (15, 'Conduite de projet e-santé', 'Piloter un projet numérique en établissement de santé', 'https://example.com/formation/projet-esante', 'Management Projet, déploiement logiciels', 'ProjCampus', '3 jours', true),
    (16, 'Déploiement logiciel hospitalier', 'Déployer et migrer des logiciels en milieu hospitalier', 'https://example.com/formation/deploiement', 'Management Projet, déploiement logiciels', 'MedTech Institute', '4 jours', false);
ALTER TABLE formation ALTER COLUMN id RESTART WITH 17;

-- ===================== ASSOCIATIONS COMPETENCE <-> FORMATION =====================
INSERT INTO competence_formation(competence_id, formation_id) VALUES
    (1, 2),   -- DevOps CI/CD -> DevOps et automatisation
    (2, 1),   -- Dev full-stack -> Agilité et éco-conception
    (2, 2),   -- Dev full-stack -> DevOps et automatisation
    (3, 3),   -- Microservices -> Architectures modulaires
    (3, 4),   -- Microservices -> Patterns santé
    (4, 3),   -- Architecture cloud -> Architectures modulaires
    (4, 13),  -- Architecture cloud -> Cloud SI hospitaliers
    (5, 5),   -- DataOps -> DataOps santé
    (6, 6),   -- Dataviz -> Visualisation avancée
    (7, 7),   -- Design thinking -> UX patients
    (8, 8),   -- Accessibilité -> Accessibilité numérique
    (9, 9),   -- RGPD santé -> Fondamentaux RGPD
    (10, 10), -- Audit conformité -> Risques réglementaires
    (11, 12), -- Pentest -> Pentest appli santé
    (12, 11), -- SOC -> SOC & surveillance
    (13, 13), -- Admin cloud -> Cloud SI hospitaliers
    (14, 14), -- BDD critiques -> BDD critiques
    (15, 15), -- Conduite projet -> Conduite projet e-santé
    (16, 16); -- Déploiement -> Déploiement logiciel hospitalier
