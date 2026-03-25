
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


-- ============================================================
-- REFRENTIEL METIERS SI (Source: Cigref 2022)
-- ============================================================

-- Nettoyage des tables pour éviter les doublons
DELETE FROM metier_competence_si;
DELETE FROM activite_si;
DELETE FROM metier_si;
DELETE FROM competence_si;
DELETE FROM famille_si;

-- Reset des IDs pour H2
ALTER TABLE famille_si ALTER COLUMN id RESTART WITH 1;
ALTER TABLE competence_si ALTER COLUMN id RESTART WITH 1;
ALTER TABLE metier_si ALTER COLUMN id RESTART WITH 1;
ALTER TABLE activite_si ALTER COLUMN id RESTART WITH 1;

-- Auto-generated from cigref2.sql for H2

INSERT INTO famille_si (nom, description, ordre) VALUES ('Pilotage, organisation et gestion des évolutions du système d’information', 'Cette famille regroupe les métiers qui touchent de manière globale à la mise en cohérence organisationnelle et fonctionnelle du ou des SI. La plupart de ces métiers travaillent avec les directions métiers dans le respect des orientations stratégiques et ambitions de l''entreprise.', 1);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Management de projet', 'Cette famille regroupe les métiers qui pilotent, suivent et coordonnent les projets de développement, déploiement, infrastructure ou méthode informatique, risques etc. Ces métiers organisent les travaux, la gestion des ressources et la communication.', 2);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Cycle de vie des applications', 'Cette famille regroupe les métiers liés à la conception, au développement et à la réalisation technique et applicative des projets. Ces métiers n''interviennent pas sur l''organisation des SI mais sur les briques mises en œuvre pour intégrer, concevoir et maintenir les solutions IT.', 3);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Mise à disposition et maintenance en condition opérationnelle des infrastructures', 'Cette famille regroupe les métiers liés à l''étude, la conception, le développement, l''intégration et l''exploitation des infrastructures. Elle comprend aussi les métiers liés au support IT interne à la DSI.', 4);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Support et assistance aux utilisateurs', 'Cette famille regroupe les métiers tournés vers l''utilisateur ou usager du SI en termes d''assistance et d''accompagnement.', 5);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Sécurité', 'Cette famille regroupe les métiers liés à la définition, à l’expertise, à l’audit, à la mise en place et au contrôle concernant la sécurité et la cybersécurité des systèmes d’information.', 6);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Management opérationnel', 'Cette famille regroupe les métiers à responsabilité hiérarchique en termes de ressources humaines, de budget, de décision ou de périmètre.', 7);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Données', 'Cette famille regroupe les métiers liés au cycle de gestion de la donnée.', 8);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Relations fournisseurs', 'Cette famille regroupe les métiers liés à la relation avec les fournisseurs en matière d’achats, de gestion des contrats ou de gestion des licences.', 9);
INSERT INTO competence_si (nom, description) VALUES ('Systèmes d’information et alignement stratégique métier', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Expérience utilisateur', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion des niveaux de service', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Mise en place d’un plan d’activité', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Planification des produits/services', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Conception de l''architecture', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Conception des applications', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Veille technologique', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion du développement durable', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Innovation', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Conception et développement d''applications', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Intégration des composants', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Tests', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Déploiement de la solution', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Production de la documentation', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Ingénierie des systèmes TIC', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Support utilisateur', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Support aux changements', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Fourniture de services', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion des problèmes', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion des systèmes', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Développement d''une stratégie de sécurité de l''information', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion de l''information et de la connaissance', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Identification des besoins', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Développement d''une stratégie pour la qualité des TIC', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Prestation de services de formation', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Achats', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Développement des ventes', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Marketing numérique', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Science des données et analyse', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion des contrats', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Développement du personnel', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Développement prévisionnel', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion des projets et du portefeuille de projets', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion des risques', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion de la relation client', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Amélioration des processus', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion de la qualité des TIC', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion des changements métier', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gestion de la sécurité de l''information', NULL);
INSERT INTO competence_si (nom, description) VALUES ('Gouvernance des systèmes d''information', NULL);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Consultant En Systèmes D’Information', 'Il anticipe et fait mûrir les nouveaux projets par une sensibilisation à l’apport des technologies et une analyse prospective des processus métiers. Il assiste la maîtrise d’ouvrage pour la définition des besoins et des solutions à mettre en œuvre, dans un souci de meilleure intégration dans le système d’information d’entreprise.', 'Il anticipe et fait mûrir les nouveaux projets par une sensibilisation à l’apport des technologies et une analyse prospective des processus métiers. Il assiste la maîtrise d’ouvrage pour la définition des besoins et des solutions à mettre e…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Consultant En Systèmes D’Information' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseille sur l''optimisation de l’utilisation des outils et des systèmes en place.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue des prescriptions et recommandations pour le développement et la mise en œuvre', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la définition des spécifications générales des projets.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie la cohérence de l’architecture applicative et fonctionnelle et de son évolution.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à l''évaluation et au choix d’un progiciel.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assiste  les  métiers  ou  la  maîtrise  d’ouvrage  pour  le  développement  de  l’informatique  de', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue  des  préconisations  sur  le  management  dans  le  cadre  de  l’accompagnement  d’un', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la conception du plan d’accompagnement.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Note  d''opportunité/fiche  d''émergence  (permet  de  connaître  s''il  est  opportun de  lancer  le', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Note de cadrage.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dossier de pré-étude.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Spécifications générales.', NULL, 12);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Urbaniste Des Systèmes D’Information', 'Il garantit l’évolution cohérente de l’ensemble du système d’information dans le respect des objectifs de l’entreprise, du domaine fonctionnel et des contraintes externes et internes (de risques, de coûts, de délais…) et en exploitant au mieux les possibilités de l’état de l’art en relation avec l’architecture technique.', 'Il garantit l’évolution cohérente de l’ensemble du système d’information dans le respect des objectifs de l’entreprise, du domaine fonctionnel et des contraintes externes et internes (de risques, de coûts, de délais…) et en exploitant au mi…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Urbaniste Des Systèmes D’Information' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère (construction, mise à jour et évolution) la cartographie du système d’information ou du', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit l''intégrité permanente de la cartographie du SI en regard du schéma directeur.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Spécifie et valide les standards et référentiels d''urbanisation du SI.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose  des  scénarios  d’évolution  et  de  simplification  du  système  d’information  en  tenant', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évalue  la  pertinence  et  la  cohérence  des  projets  par  rapport  à  l’architecture  cible  et  aux', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promeut  par  des  actions  de  conseil  et  de  communication  la  cartographie  du  système', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille en relation étroite et permanente avec, d''une par les directeurs métiers, d''autre par', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Plans et scénarios d''évolution du SI.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Études d''opportunité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure de l''agilité et de la réactivité du système d’information à un changement donné (délai', NULL, 10);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable Du Système D’Information « Métier »', 'Il pilote l’alignement du système d’information du métier sur les orientations stratégiques et sur les processus métiers. Il propose des scénarios d’évolution du système d’information cohérents avec les objectifs et les processus définis. Il garantit la cohérence globale et dynamique ainsi que la pertinence et la performance du SI du Métier.', 'Il pilote l’alignement du système d’information du métier sur les orientations stratégiques et sur les processus métiers. Il propose des scénarios d’évolution du système d’information cohérents avec les objectifs et les processus définis. I…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable Du Système D’Information « Métier »' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue  à  l’optimisation  des  processus  métiers,  des  données,  des  applications  et  des', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe au pilotage de la performance, notamment économique du SI.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promeut  par  des  actions  de  conseil  et  de  communication  la  cartographie  du  système', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Anticipe les changements et leurs impacts métiers sur le SI, et réciproquement.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable de la gestion du budget d''informatisation de son domaine.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Formalise,  consolide  et  fait  évoluer  la  cartographie  générale  du  système  d’information  en', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe  à  l''administration  du  système  d’information  en  termes  de  référentiels,  règles,', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évalue  la  cohérence  unitaire  et  globale  (portefeuille)  des  projets  par  rapport  au  système', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Consolide les écarts en termes de délais, de coûts ou de qualité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la qualité de la conduite de projet.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère la cartographie des compétences nécessaires à l’évolution du SI.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de demandes d''évolution ou de corrections.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Degré de satisfaction du client.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Niveau de disponibilité des systèmes.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Tenue des budgets.', NULL, 15);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 10);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Gestionnaire D’Applications', 'Il a pour objectif d’améliorer la performance, de contribuer au fonctionnement et de participer à la gestion et à l’évolution du système d’information du Métier. Il s''assure de la mise en cohérence du SI Métier avec les orientations, les modes de fonctionnement et les processus définis au niveau du Métier.', 'Il a pour objectif d’améliorer la performance, de contribuer au fonctionnement et de participer à la gestion et à l’évolution du système d’information du Métier. Il s''assure de la mise en cohérence du SI Métier avec les orientations, les mo…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Gestionnaire D’Applications' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Représente les métiers ou maîtres d’ouvrage lors de la vie courante des systèmes.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe  à', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue les actions et processus de gestion courante du système d’information en place dans', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe activement au développement de l’usage du système d’information.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue, en cohérence avec la stratégie du métier, à l’évolution des processus et du système', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne et anime le réseau des acteurs liés au fonctionnement du SI du métier.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit  le  maintien  de  la  qualité  de  fonctionnement  d’ensemble  et  de  la  performance  du', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respecte les règles de fonctionnement et d’utilisation du SI en conformité avec les normes et', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est  responsable  de  la  documentation  (note  de  cadrage,  cahier  des  charges,  guide  de', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable du contrôle et des règles de fonctionnement et d’utilisation des applications', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la maîtrise des coûts d’exploitation du système d’information.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des évolutions de ses systèmes applicatifs.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Documentation applicative.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de demandes d''évolution ou de correction.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Degré de satisfaction du client.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Niveau de disponibilité et de performance des systèmes.', NULL, 16);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chargé D’Affaires Internes', 'Il est l’animateur de la relation contractuelle avec la DSI et représente le client (direction, maîtrise d’ouvrage, utilisateur) auprès des différents services de la DSI et des prestataires externes. Il fédère et anime les relations entre les clients et la DSI. Il met en lumière les dysfonctionnements dans le cadre de ces relations et propose des améliorations aux acteurs du système d’information.', 'Il est l’animateur de la relation contractuelle avec la DSI et représente le client (direction, maîtrise d’ouvrage, utilisateur) auprès des différents services de la DSI et des prestataires externes. Il fédère et anime les relations entre l…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chargé D’Affaires Internes' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'À  l’écoute  des  métiers,  il  les  informe  et  conseille  sur  les  services  possibles,  les  formations', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la sensibilisation des utilisateurs aux problèmes de sécurité (sauvegarde, virus…).', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue la mesure des indicateurs / qualité de service de la DSI afin de suivre la satisfaction', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse les écarts par rapport aux engagements de services (dont coûts et performances) et', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Élabore et actualise les propositions de services, les devis (qualité, délai, coût), les conventions', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise et prépare des points de fonctionnement mensuels.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit des bilans et comptes-rendus sur les activités et prestations fournies aux métiers sur les', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prend en charge le problème « client » jusqu’à sa résolution.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Sollicite à bon escient les centres de compétences concernés.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nouveaux projets ou chantiers d''amélioration.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'SLA (Service Level Agreement) sur l''établissement du contrat de service avec le métier (le client)', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure de la réactivité par rapport à la demande du client.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, '« Chiffre d’affaires ».', NULL, 13);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement des ventes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des contrats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Architecte D’Entreprise', 'L’architecte d’entreprise a double dimension : SI et métier. Il garantit la cohérence et l’optimisation des réalisations SI et porte les projets de transformation ainsi que les études et exigences d’architecture du SI. Il assure la cohérence du choix des projets, en termes d’évaluation, de conception et d’implémentation. Il s’assure également que ce choix de projets s’intègre de manière cohérente, efficace et durable et en respectant les standards de l’entreprise (notamment sécurité et maîtrise des risques) dans l’architecture du SI. Il projette, définit et pilote l’évolution de l’architecture du SI dans son ensemble, pour répondre aux besoins des directions métiers, et ceci en cohérence avec la stratégie de l’entreprise. Il porte l’innovation auprès de l’ensemble des parties prenantes de l’entreprise au regard de l’architecture existante du SI..', 'L’architecte d’entreprise a double dimension : SI et métier. Il garantit la cohérence et l’optimisation des réalisations SI et porte les projets de transformation ainsi que les études et exigences d’architecture du SI. Il assure la cohérenc…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Architecte D’Entreprise' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à l’élaboration du plan stratégique SI.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue  aux  choix  de  nouvelles  solutions  répondant  aux  besoins  de  l’entreprise,  en', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue une veille technologique du marché et promeut des solutions innovantes adaptées à', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Construit  et  maintient  les  normes  et  les  principes  d’architecture  du  SI  et  pilote  la', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'En assurant un SI d’entreprise cohérent et performant, élabore des recommandations pour', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promeut les orientations liées à l’architecture du SI.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'De  manière  pédagogique,  faciliter  le  transfert  de  connaissance,  d’expérience  et  de  bonnes', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communique et partage les principes d’architecture, les standards SI et l’innovation SI avec les', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure  de  la  performance  globale  de  l’architecture  du  SI  (en  termes  d’agilité,  satisfaction', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre d’exceptions aux principes d’architectures et de standards.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de personnes formées au référentiel d’architecture.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de personnes certifiées sur certains éléments du référentiel d’architecture.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribution à l’évolution du Time to market.', NULL, 13);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable Green It', 'Il appréhende l’informatique sous l’angle des enjeux environnementaux, sociaux et économiques pour construire un système d’information (éco)responsable et aider l''entreprise à évoluer vers des modèles plus soutenables grâce au numérique. Il élabore, applique et fait évoluer la stratégie Développement Durable (RSE/CSR) de l’entreprise au niveau du système d’information, en relation avec le Directeur des Système d’Information (DSI/CIO), le Directeur du Développement Durable (DDD/SDO), et le comité exécutif de l’entreprise. Il pilote et anime la stratégie Green IT de l’entreprise.', 'Il appréhende l’informatique sous l’angle des enjeux environnementaux, sociaux et économiques pour construire un système d’information (éco)responsable et aider l''entreprise à évoluer vers des modèles plus soutenables grâce au numérique. Il…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable Green It' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Clarifie le périmètre du green IT au sein de son organisation et le connecte à sa politique RSE.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse l’impact du système d’information (SI) sur l’environnement et identifie les indicateurs', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit la stratégie green IT de l’entreprise en fonction des priorités.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Décline la stratégie en plan d’actions concrètes et la traduit éventuellement en charte green', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Spécifie, valide et met en œuvre les standards et référentiels green IT utilisés par l’entreprise', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote  la  réalisation  et  assure  la  cohérence  des  projets  green  IT  en  relation  avec  les  parties', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Anime et conseille un réseau de collaborateurs investis pour tendre vers un SI plus responsable', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose  des  innovations  techniques,  sociétales  et  environnementales  pour  améliorer  les', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère le suivi des projets à l’aide de tableaux de bord basés sur des indicateurs et des objectifs', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prend  part  à  certaines  phases  techniques  des  projets  lorsqu’elles  requièrent  une  expertise', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promeut,  par  des  actions  de  conseil,  de  sensibilisation  et  de  communication,  la  démarche', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Valorise les actions menées via les moyens les plus adaptés.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place une démarche d''intelligence économique spécifique au green IT dans le but de', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure une veille sur l’évolution des normes et de la réglementation et en assure la diffusion', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Recueille et partage les bonnes pratiques et se compare à l''état de l''art pour s''améliorer en', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transcrit  l''apport  de  l’informatique  sur  l’impact  environnemental  (réduction  des  GES,', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie, politique (plan d’actions) et charte Numérique Responsable.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Plan de communication green IT.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Tableau de bord green IT.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Référentiels des bonnes pratiques green IT.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Référentiel d’écoconception logicielle.', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Guide des achats responsables et écolabels.', NULL, 22);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Guide des écogestes.', NULL, 23);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Paragraphe Numérique Responsable dans le rapport RSE.', NULL, 24);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure l’impact économique, environnemental, et social des actions entreprises, globalement', NULL, 25);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi d’année en année, par utilisateur et par an, scope 2 et 3 (pour les étapes fabrication et', NULL, 26);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion du développement durable' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Directeur De Projets', 'Il assume la responsabilité fondamentale du ou des projets dans toutes ses dimensions (stratégiques, commerciales, financières, humaines, juridiques, organisationnelles, techniques…). Il pilote l’ensemble du ou des projets dans toute leur complexité (multiplicité des parties prenantes, intérêts souvent divergents…). Il est le garant de l’enjeu stratégique du projet pour le métier, l’entreprise ou des tiers.', 'Il assume la responsabilité fondamentale du ou des projets dans toutes ses dimensions (stratégiques, commerciales, financières, humaines, juridiques, organisationnelles, techniques…). Il pilote l’ensemble du ou des projets dans toute leur c…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Directeur De Projets' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la pertinence et l’opportunité du développement du ou des projets.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable de toutes les décisions importantes.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Valide la recette définitive du ou des projets.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mène toute action pour mener le ou les projets à bonne fin.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère et anime la communication auprès des équipes et des différentes instances.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare et pilote la conduite du changement.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduit, optimise et est responsable de l''ensemble des ressources du ou des projets (humains,', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable de la gestion financière du ou des projets ainsi que de toutes les exigences', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Plan de l''organisation du ou des projets qu''il manage.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Reporting Direction sur l''alignement des projets.', NULL, 10);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chef De Projet Maîtrise D''Ouvrage', 'Il définit, met en œuvre et conduit un projet dans le but d''obtenir un résultat optimal et conforme aux exigences métiers formulées et validées par ou pour le commanditaire en ce qui concerne la qualité, les performances, le coût, le délai et la sécurité.', 'Il définit, met en œuvre et conduit un projet dans le but d''obtenir un résultat optimal et conforme aux exigences métiers formulées et validées par ou pour le commanditaire en ce qui concerne la qualité, les performances, le coût, le délai …', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chef De Projet Maîtrise D''Ouvrage' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit  les  besoins  métier,  établit  les  spécifications  fonctionnelles  générales  et  rédige', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe  au  choix  d''une  solution  (progiciel,  développement.)  en  relation  avec  le  maître', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prévoit les moyens à mettre en œuvre (humains, techniques, financiers…).', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et supervise la réalisation des prototypes et des tests fonctionnels.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise, coordonne et anime l’équipe de maîtrise d’ouvrage du projet.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Arbitre les éventuels différends entre l’équipe et les autres intervenants.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Supervise le déroulement du projet.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne, synthétise, et assure la qualité des validations prononcées.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fait circuler et diffuse l’information côté métiers.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable de la totalité des événements survenant dans le projet.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit la cible utilisateurs.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit au plus tôt la méthode et les moyens pédagogiques de formation des utilisateurs.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en œuvre la formation et l’accompagnement des utilisateurs, en fonction de leurs besoins.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit le service de support à l’utilisateur.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les modalités de traitement des demandes d’évolution.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue  la  recette  des  réalisations  et  apprécie  leur  conformité  au  cahier  des  charges  de', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit le respect des délais et des coûts.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose au commanditaire, en cours de projet, d’éventuelles modifications d’objectifs (qualité,', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et gère le planning d’avancement du projet.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Arbitre les choix à faire en fonction du risque et du résultat.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place tous les indicateurs nécessaires au suivi et à la gestion du projet, notamment sur', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Cahier des charges du projet.', NULL, 22);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Spécifications générales.', NULL, 23);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Procès-verbal de recette.', NULL, 24);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Différentiel  notifié  dans  les  procès-verbaux  de  recettes  en  ce  qui  concerne  la  qualité,  les', NULL, 25);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 10);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chef De Projet Maîtrise D’Œuvre', 'Il définit, met en œuvre et conduit un projet SI depuis sa conception jusqu''à la réception dans le but d''obtenir un résultat optimal et conforme aux exigences formulées par le chef de projet MOA ou le client métier en ce qui concerne la qualité, les performances, le coût, le délai et la sécurité.', 'Il définit, met en œuvre et conduit un projet SI depuis sa conception jusqu''à la réception dans le but d''obtenir un résultat optimal et conforme aux exigences formulées par le chef de projet MOA ou le client métier en ce qui concerne la qua…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chef De Projet Maîtrise D’Œuvre' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit la conception technique et rédige les spécifications techniques détaillées.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe au choix de progiciels, en relation avec le maître d’ouvrage.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la réalisation en termes de développements spécifiques ou d''intégration.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les tests et participe aux recettes.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise, coordonne et anime l''ensemble de l’équipe de maîtrise d’œuvre du projet.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Arbitre les éventuels différends entre l’équipe et les autres intervenants.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Supervise le déroulement du projet.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne, synthétise, et assure la qualité des validations prononcées.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fait circuler et diffuse l’information côté maîtrise d’œuvre.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère la relation avec le ou les fournisseurs (depuis la signature du contrat à la validation finale', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Déploie la nouvelle application ou le nouveau service.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise la maintenance.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la formation des utilisateurs.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise du support utilisateur.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit le respect du cahier des charges.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit le respect des délais et des coûts.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose  au  métier  ou  maître  d''ouvrage,  en  cours  de  projet,  d’éventuelles  modifications', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Spécifications fonctionnelles détaillées du projet.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Procès-verbal de recette.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Différentiel  notifié  dans  les  procès-verbaux  de  recettes  en  ce  qui  concerne  la  qualité,  les', NULL, 20);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception et développement d''applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Achats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 10);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Coach Agile', 'Il promeut les méthodes agiles, est garant des pratiques agiles et les adapte à l’organisation. Il fait en sorte que les équipes agiles deviennent autonomes dans leur fonctionnement. Sur la méthode, il conseille aussi l’organisation pour trouver les pratiques les plus adaptées au contexte.', 'Il promeut les méthodes agiles, est garant des pratiques agiles et les adapte à l’organisation. Il fait en sorte que les équipes agiles deviennent autonomes dans leur fonctionnement. Sur la méthode, il conseille aussi l’organisation pour tr…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Coach Agile' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les pratiques et s’assure de leur déploiement.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est en support des équipes agiles avec des méthodes et des outils adaptés à la situation.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare les formations liées au périmètre agile, définit et met à jour le panel des formations', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Sensibilise  et  forme  l’ensemble  des  parties  prenantes  :  organise,  coordonne  et  anime', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est force de proposition auprès des membres de l’équipe projet dans sa phase de cadrage.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Afin de garantir l’atteinte des objectifs de valeur fixés par le métier, participe activement à la', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Session d’animation.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition des indicateurs de mesure et de performance de la méthode.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Apporte des retours d’expérience.', NULL, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Scrum Master', 'Leader-serviteur de l’équipe Scrum, il s’assure que la méthode Scrum est comprise et mise en œuvre et que les équipes agiles adhèrent à la théorie, aux pratiques et aux règles de Scrum. Il aide les parties externes à l’équipe à bien interagir avec la « Team » DevSecOps. Il aide toutes les parties prenantes à adapter ses interactions avec l’équipe Scrum pour maximiser la valeur créée par son équipe. Il assure l’amélioration continue des équipes Scrum dans leur façon de travailler (créativité, qualité coopération) en faisant preuve d''empathie, de coopération, de transparence, de courage et d’humilité.', 'Leader-serviteur de l’équipe Scrum, il s’assure que la méthode Scrum est comprise et mise en œuvre et que les équipes agiles adhèrent à la théorie, aux pratiques et aux règles de Scrum. Il aide les parties externes à l’équipe à bien interag…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Scrum Master' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coache et forme en continu les intervenants des équipes sur les pratiques, les principes et les', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide au suivi et à la réalisation des activités en mode agile (stories / enabler…).', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide à comprendre la planification de produit dans un contexte empirique.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assiste et conseille le PO dans la qualification des besoins. Il s’assure également que le PO a', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la coordination des équipes avec le PO et les parties prenantes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Anime et/ou participe aux cérémonies Scrum.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maximise la valeur créée par l’équipe de développement.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit, met en place et suit des indicateurs de performance (vélocité, prévisibilité, délivrance', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Collabore  avec  d’autres  Scrum  Masters  pour  améliorer  l’efficacité  de  l’utilisation  de  Scrum', NULL, 10);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Product Owner', 'Le Product Owner est en charge de construire la vision métier du produit SI à réaliser et de la transmettre aux équipes de développement agile. Il s''assure que la direction métier prise est la bonne, les priorités respectées suivant un critère de valeur métier, et que la qualité des livrables de chaque cycle agile est en adéquation avec les attentes du métier. Il favorise la communication et la collaboration dans un souci de maximisation de la valeur ajoutée du produit pour les utilisateurs. Il est responsable du Product Backlog (ou carnet du produit).', 'Le Product Owner est en charge de construire la vision métier du produit SI à réaliser et de la transmettre aux équipes de développement agile. Il s''assure que la direction métier prise est la bonne, les priorités respectées suivant un crit…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Product Owner' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Collabore avec les métiers pour élaborer la vision du produit.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Partage cette vision avec les équipes de développement agile.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mène une réflexion stratégique préparatoire des versions à venir.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Priorise toutes les « user stories » au sein du Product Backlog.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintient le Product Backlog et cherche en permanence à maximiser la valeur métier pour les', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Partage  sa vision  avec  les équipes  agiles en  privilégiant  les  interactions  directes  au support', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Découpe  chaque  fonctionnalité  en  «  user  story  »  pouvant  être  implémentée  en  une  seule', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit  les  critères  d’acceptation  indispensables  à  sa bonne  compréhension  par  les équipes', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Répond aux demandes de clarification émises par les équipes de développement sur les « user', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue aux réunions agiles avec les équipes de développement et le Scrum Master.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réalise ou organise le déroulement des tests utilisateurs/Métier.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Récolte les feedbacks des utilisateurs pour les équipes de développement.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réalise une analyse des usages pour proposer aux métiers des évolutions du produit.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communique sur l’avancement de la réalisation du produit auprès du management IT et des', NULL, 14);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement prévisionnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chargé De Pilotage Si (Pmo)', 'Il assure le suivi du pilotage opérationnel et du reporting de l’activité d’un domaine (stratégique, portefeuille projets, programmes, activités opérationnelles…). Il pilote les plannings prévisionnels d’affectation des ressources, le suivi des réalisations et le budget du projet. Il alerte les responsables de projet en cas d’anomalie par rapport aux prévisions. Il intervient soit directement dans les projets, soit pour le compte d’une direction pour un suivi transversal du portefeuille de projets.', 'Il assure le suivi du pilotage opérationnel et du reporting de l’activité d’un domaine (stratégique, portefeuille projets, programmes, activités opérationnelles…). Il pilote les plannings prévisionnels d’affectation des ressources, le suivi…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chargé De Pilotage Si (Pmo)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à l’élaboration du portefeuille de projets, en prenant en compte les contraintes et', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie l’avancement du projet/programme selon les exigences définies (qualité, coût, délai…)', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie l’application de la méthodologie et des bonnes pratiques.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue l’analyse des risques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évalue  la  capacité  actuelle  et  prévisionnelle  des  ressources  et  des  tâches,  en  propose', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose des ajustements et des replanifications si nécessaire.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit et actualise le budget.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit les moyens alloués au regard des prévisions (consommés, reste à faire, planning).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Produit  le  reporting  nécessaire  au  pilotage  des  directions  concernées  et  à  l’élaboration  des', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Un schéma directeur de l’activité.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planning opérationnel.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification des charges et ressources.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse de risque de l’activité et des projets/programmes.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Compte-rendu des instances décisionnaires.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure du projet : Planifié vs réalisé.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect des coûts et du budget.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité de l’animation avec les parties prenantes (indice de satisfaction).', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect de la tenue des comités et des comptes-rendus associés à ces comités.', NULL, 18);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable Des Systèmes Applicatifs', 'Il assure et coordonne les activités d''évolution et de maintenance corrective et applicative du système dont il est responsable. Il en assure aussi le support de niveau 2 et le conseil dans le respect du contrat de services dans toutes ses composantes (Qualité, sécurité…). Il est aussi le garant du maintien des connaissances fonctionnelles et techniques nécessaires à la pérennité de l’application.', 'Il assure et coordonne les activités d''évolution et de maintenance corrective et applicative du système dont il est responsable. Il en assure aussi le support de niveau 2 et le conseil dans le respect du contrat de services dans toutes ses …', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable Des Systèmes Applicatifs' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assiste et conseille sur l’utilisation du système applicatif dont il a la charge.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie et assure la qualité et la performance du fonctionnement des applications dont il est', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne la maintenance corrective, préventive et évolutive.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Applique les normes, méthodes et outils.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'S''assure de la cartographie applicative utilisée dans le cadre du référentiel d''urbanisation.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure  la  pérennité  des  connaissances  sur  les  solutions  apportées  dans  le  cadre  de  la', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est l’interlocuteur privilégié de la DSI avec les utilisateurs pour son application.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est  l’interlocuteur  privilégié  avec  la  production  informatique  pour  l''application  dont  il  est', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de configuration du logiciel applicatif à jour.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Temps de résolution des incidents.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Disponibilité de ses applications.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Délai de réalisation des évolutions.', NULL, 12);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Concepteur / Développeur', 'À la demande du Métier, il analyse, paramètre et code les composants logiciels applicatifs dans le respect des évolutions souhaitées, des normes et des procédures.', 'À la demande du Métier, il analyse, paramètre et code les composants logiciels applicatifs dans le respect des évolutions souhaitées, des normes et des procédures.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Concepteur / Développeur' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la définition des spécifications générales.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réalise l''analyse technique et l’étude détaillée.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Adapte et paramètre les progiciels applicatifs (ERP).', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réalise le prototypage.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Élabore les jeux de tests pour les tests unitaires d’intégration.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue les tests unitaires.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réalise les modules (objets et composants logiciels).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assemble les composants.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rédige les documentations.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'A en charge la maintenance corrective.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'A en charge la maintenance évolutive.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administre  les  composants  logiciels  réutilisables  et  met  à  jour  la  Nomenclature  de  ces', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Code documenté suivant les règles et référentiels de l''entreprise.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de corrections en phase de recette.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Performance des composants développés (via des benchmarks).', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect du délai dans la réalisation des modifications.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de régressions.', NULL, 17);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Expérience utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception et développement d''applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Ingénierie des systèmes TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 10);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Testeur', 'Il doit s’assurer que les produits livrés seront conformes aux besoins traduits en spécifications. Cela concerne les systèmes existants, les évolutions, les corrections d’incidents, ou bien les nouveaux produits.', 'Il doit s’assurer que les produits livrés seront conformes aux besoins traduits en spécifications. Cela concerne les systèmes existants, les évolutions, les corrections d’incidents, ou bien les nouveaux produits.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Testeur' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planifie  les  différentes  tâches  de  tests  en  tenant  compte  des  contraintes  de  ressources', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie la réception des livrables nécessaires à l’élaboration du plan de tests.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rédige les plans de qualification fonctionnels avec les acteurs concernés (utilisateurs clés, chef', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rédige les plans de tests d’installation, d’exploitation et d’intégration en fonction du dossier', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare et met à jour les configurations de tests en respectant les processus d’installation.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en œuvre les outils de suivi de tests.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne la réalisation des tests et le suivi des anomalies.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rapporte auprès du chef de projet.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rédige la fiche de qualification.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise les procédures de mise en service, bilans, archivage.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met à jour les masters (configurations types) de tests.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'PV de recette.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect du planning.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect de la charge.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d''incidents de production.', NULL, 15);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Intégrateur D’Applications', 'Au sein de l''équipe projet, il contribue au choix des différents composants SI (progiciels, bases de données, développements spécifiques.). Il en assure l’assemblage dans le respect du plan d’urbanisme des systèmes d’information de l’entreprise et de l’architecture retenue pour le projet. Il assure la cohérence des flux inter-applications, de l''intégrité des données et de la sécurité de l''ensemble.', 'Au sein de l''équipe projet, il contribue au choix des différents composants SI (progiciels, bases de données, développements spécifiques.). Il en assure l’assemblage dans le respect du plan d’urbanisme des systèmes d’information de l’entrep…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Intégrateur D’Applications' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit, sous la responsabilité du chef de projet maîtrise d’œuvre, l’architecture fonctionnelle', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Utilise les objets existants de la cartographie des réutilisables.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assemble et intègre les différents composants.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Peut effectuer les tests et recettes dans une phase de pré-exploitation.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et réalise des interfaces.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe, avec la maîtrise d’ouvrage, à l’élaboration de didacticiels.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Documente le système livré.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Un système applicatif opérable et documenté.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux de réussite des tests de non régression et de charge.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d''incidents de production.', NULL, 10);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Planification des produits/services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Ingénierie des systèmes TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 10);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Paramétreur De Progiciels', 'À la demande du Métier, il analyse et conseille celui-ci sur la meilleure utilisation possible du ou des progiciels. Il assiste et apporte sa maîtrise sur le module progiciel dont il a l’expertise et les processus de modélisation associés. Il prototype et paramètre les nouveaux composants progiciels pour répondre aux évolutions souhaitées dans le respect des normes et procédures. ACTIVITÉS ET TÂCHES Analyse : • Prototype en collaboration avec l’expert fonctionnel et l’administrateur de données • • Effectue l''analyse fonctionnelle des besoins et détermine les interfaces avec les produits Justifie les écarts entre le besoin exprimé et le standard du progiciel environnants dans le système d’information de l’entreprise. Développement : • Adapte et paramètre les éléments du progiciel • Modélise les processus selon la méthodologie propre au progiciel choisi • Participe à la réalisation des interfaces • Rédige la documentation • Participe à la réalisation des supports de formation des utilisateurs Qualification et tests : • Élabore les jeux de tests pour les tests unitaires et d’intégration. • Teste les développements internes et les solutions fournies par les éditeurs. • Identifie et traite les dysfonctionnements constatés. Maintenance : • Effectue la maintenance corrective et évolutive à l’aide des outils et des ressources de l’éditeur. • Trace les évolutions du produit et des interventions dans une base de connaissances. LIVRABLES • Progiciel opérant. NOMENCLATURE DES PROFILS MÉTIERS DU SI – VERSION 2022 3. CYCLE DE VIE DES APPLICATIONS 3.5. PARAMÉTREUR DE PROGICIELS P A G E | 114 INDICATEURS DE PERFORMANCE • Degré de satisfaction des utilisateurs. • Respect du délai. PARCOURS PROFESSIONNEL Bac + 2 ou Bac + 3 ou utilisateurs métiers qui évoluent vers la DSI, ou avec une première expérience en développement ou dans un projet de même nature. TENDANCES ET FACTEURS D’ÉVOLUTION Prise en compte des standards liés aux architectures orientées service et cloud. SYNTHÈSE DES COMPÉTENCES ET NOTIONS TRANSVERSALES (ISSUES DE LA NORME NF EN 16234-1-FR) A.6. Conception des applications B.1. Conception et développement d''applications B.3. Tests B.5. Production de la documentation D.11. Identification des besoins 1 3 2 2 4 A.10. Expérience utilisateur B.2. Intégration des composants B.4. Déploiement de la solution B.6. Ingénierie des systèmes TIC E.3. Gestion des risques 2 2 2 3 2 T1 Accessibilité T2 Éthique T3 Questions juridiques liées aux TIC T4 Respect de la vie privée T5 Sécurité T6 Développement durable T7 Utilisabilité        NOMENCLATURE DES PROFILS MÉTIERS DU SI – VERSION 2022 3. CYCLE DE VIE DES APPLICATIONS 3.5. PARAMÉTREUR DE PROGICIELS P A G E | 115', 'À la demande du Métier, il analyse et conseille celui-ci sur la meilleure utilisation possible du ou des progiciels. Il assiste et apporte sa maîtrise sur le module progiciel dont il a l’expertise et les processus de modélisation associés. …', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Paramétreur De Progiciels' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prototype en collaboration avec l’expert fonctionnel et l’administrateur de données', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue  l''analyse  fonctionnelle  des  besoins  et  détermine  les  interfaces  avec  les  produits', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Adapte et paramètre les éléments du progiciel', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Modélise les processus selon la méthodologie propre au progiciel choisi', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la réalisation des interfaces', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rédige la documentation', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la réalisation des supports de formation des utilisateurs', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Élabore les jeux de tests pour les tests unitaires et d’intégration.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Teste les développements internes et les solutions fournies par les éditeurs.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue la maintenance corrective et évolutive à l’aide des outils et des ressources de l’éditeur.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Trace les évolutions du produit et des interventions dans une base de connaissances.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Progiciel opérant.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Degré de satisfaction des utilisateurs.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect du délai.', NULL, 14);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Expérience utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception et développement d''applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Ingénierie des systèmes TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 10);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien D’Exploitation', 'Le technicien d’exploitation assure la gestion courante de l’exploitation (hors réseau) dans le respect des plannings et de la qualité attendue. Il surveille le fonctionnement des équipements informatiques physiques et logiques du centre de production, dans le cadre des normes, méthodes d’exploitation et de sécurité.', 'Le technicien d’exploitation assure la gestion courante de l’exploitation (hors réseau) dans le respect des plannings et de la qualité attendue. Il surveille le fonctionnement des équipements informatiques physiques et logiques du centre de…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien D’Exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exécute les travaux informatiques et restitue les résultats de la production dans le respect des', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Supervise les impressions.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit le fonctionnement des ressources du site.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit l’exploitation des systèmes et outils de production.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit l''exploitation des applicatifs.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle la gestion de la qualité des résultats.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les incidents d’exploitation (diagnostic, intervention, alerte).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue la maintenance applicative de dépannage de 1er niveau.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit les interventions.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la sécurité physique du site informatique.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les supports magnétiques (disques, robots, automates).', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les ressources matérielles nécessaires.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rapports de suivi d''exploitation.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect des contrats de service (SLA).', NULL, 14);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des systèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien Poste De Travail', 'Dans le cadre de projets de déploiement, il assure l’installation et la garantie de fonctionnement des équipements informatiques et/ou téléphoniques (matériels et logiciels) liés au poste de travail. À la demande des utilisateurs, il assure la maintenance (à distance ou sur site) de ces équipements et traite les incidents.', 'Dans le cadre de projets de déploiement, il assure l’installation et la garantie de fonctionnement des équipements informatiques et/ou téléphoniques (matériels et logiciels) liés au poste de travail. À la demande des utilisateurs, il assure…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien Poste De Travail' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Télédistribue les applications suivant un plan de déploiement.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue les tests et recettes utilisateurs des équipements informatiques et/ou téléphoniques.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Traite les incidents à distance sur micros, réseaux, messagerie ou téléphonie.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère l’exploitation sur incident.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Diagnostique et traite les incidents.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère le parc informatique connecté au réseau.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit l’évolution de l’équipement.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administre la messagerie sur la partie cliente du poste de travail (connexion, exploitation).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les données de télédistribution (cibles, profils, dépendances…) et de télémaintenance.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle la conformité des équipements avec les référentiels.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide à la prise en main des équipements et logiciels installés.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Un poste de travail opérationnel.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fiche de clôture d''incident.', NULL, 14);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien Réseaux-Télécoms', 'Il est garant du bon fonctionnement et de la disponibilité des réseaux ou des télécoms dont il a la responsabilité. Il assure la prévention des dysfonctionnements des réseaux ou des télécoms et contribue au bon fonctionnement du système d’information.', 'Il est garant du bon fonctionnement et de la disponibilité des réseaux ou des télécoms dont il a la responsabilité. Il assure la prévention des dysfonctionnements des réseaux ou des télécoms et contribue au bon fonctionnement du système d’i…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien Réseaux-Télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respecte les procédures d’installation, de connexion… des matériels et des logiciels.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue les tests des équipements réseaux.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère l’exploitation sur incident.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Traite les incidents sur les réseaux informatiques ou téléphoniques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit les ressources (hubs, imprimantes réseaux, serveurs, postes de travail connectés…).', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place les outils de sécurité, de sauvegarde et de métrologie.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle le respect de la sécurité d’accès aux locaux techniques et signale les anomalies.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère et maintient les infrastructures techniques, (routeurs, hubs, concentrateurs, câblage…)', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit l’évolution de l’équipement.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploite et administre le réseau sur son périmètre.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle la conformité des équipements avec les référentiels.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fiche de clôture d''incident.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect des SLAs.', NULL, 13);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Administrateur D’Outils / De Systèmes / De Réseaux -Télécoms', 'Il installe, met en production, administre et exploite les moyens informatiques d’un ou plusieurs sites informatiques. Il participe au bon fonctionnement des systèmes d’information en garantissant le maintien à niveau infrastructures de des différents outils et/ou communication (locale, étendue, voix, image, architecture centralisée, client-serveur, web, mobile), dans un objectif de qualité, de productivité et de sécurité. logiciels systèmes et/ou infrastructures des', 'Il installe, met en production, administre et exploite les moyens informatiques d’un ou plusieurs sites informatiques. Il participe au bon fonctionnement des systèmes d’information en garantissant le maintien à niveau infrastructures de des…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Administrateur D’Outils / De Systèmes / De Réseaux -Télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable du fonctionnement optimal des outils, systèmes ou réseaux dont il a la charge.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en œuvre les outils garantissant la cohérence des données.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Possède  une  vision  globale  et  actualisée  des  systèmes  d’information  ainsi  qu''une  bonne', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue un inventaire permanent et gère les différentes composantes des différents réseaux.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit et analyse les performances, met en place des mesures susceptibles d’améliorer la qualité', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Élabore  les  règles  d’utilisation  de  l’outil,  en  conformité  avec  les  normes  et  standards  de', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise et optimise les ressources de son domaine.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Valide  l’installation  et  l’intégration  des  nouveaux  outils  (systèmes,  ou  réseaux  et  télécoms)', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les droits d’accès aux serveurs et aux applications en fonction des profils.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Traite  les  incidents  ou  anomalies  à  partir  des  demandes  internes  :  diagnostic  de  l’incident,', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe aux actions de maintenance correctrice en veillant à leur qualité.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose des améliorations pour optimiser les ressources existantes et leur organisation.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue  le  transfert  de  compétences  et  l''assistance  technique  des  procédures  aux  équipes', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les accès aux ressources du SI (en général).', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les évolutions et la maintenance des matériels, des logiciels et du système.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les performances (seuils d’alerte et tuning des ressources et produits du domaine).', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue  des  études  de  préconisation  et  d''implantation  des  matériels,  outils  et  logiciels', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue une veille technologique sur les différents aspects de l’infrastructure système et de', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Cartographie technique et documentée des outils, systèmes informatiques et télécoms.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d''incidents techniques sur les outils administrés.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Capacité de réaction à une anomalie.', NULL, 21);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Administrateur De Bases De Données', 'Il gère et administre les systèmes de gestion de données de l’entreprise, en assure la cohérence, la qualité et la sécurité. Il participe à la définition et à la mise en œuvre des bases de données et des progiciels retenus par l’entreprise.', 'Il gère et administre les systèmes de gestion de données de l’entreprise, en assure la cohérence, la qualité et la sécurité. Il participe à la définition et à la mise en œuvre des bases de données et des progiciels retenus par l’entreprise.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Administrateur De Bases De Données' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue le choix d''implémentation des bases de données.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Crée les bases en liaison avec l’administrateur système et les chefs de projets concernés.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met  en  œuvre  les  logiciels  de  gestion  de  bases  de  données.  Effectue  l''adaptation,', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en exploitation et en gestion les serveurs de  données (administration, automatisation,', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Crée,  à  la  demande  des  domaines  ou  de  l’exploitation,  les  outils  spécifiques  d’aide  à', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure  l’intégrité  des  bases  de  données  existantes  en  garantissant  la  sécurité  physique', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en œuvre les outils de surveillance.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Règle les paramètres des bases de données pour une utilisation optimale.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assiste les utilisateurs (formation, requêtes techniques…).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue un support technique de second niveau pour l’ensemble des bases de données.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Possède un rôle de correspondant technique entre les chefs de projets et le support technique', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure une veille technologique sur les SGBD et les progiciels retenus par l’entreprise.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit  et  contrôle  les  évolutions  de  version  des  bases  existantes  et  progiciels  retenus  par', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Teste, valide, pour les aspects techniques, tous les logiciels et progiciels.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les normes et standards d’utilisation et d’exploitation des SGBD.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Bases de données avec des temps d''accès raisonnables.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Documentation sur la structure de la base et les procédures d''exploitation et de production.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d''incidents de production.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Temps de réponse aux requêtes.', NULL, 19);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception et développement d''applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Intégrateur D’Exploitation', 'À la demande du maître d’ouvrage et sous la conduite du responsable d’exploitation du SI, il intègre dans l’environnement de production la solution logicielle ou matérielle livrée par l’intégrateur d’applications et en assure le déploiement.', 'À la demande du maître d’ouvrage et sous la conduite du responsable d’exploitation du SI, il intègre dans l’environnement de production la solution logicielle ou matérielle livrée par l’intégrateur d’applications et en assure le déploiement…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Intégrateur D’Exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en œuvre la recette, l’industrialisation et la mise en production, en liaison avec la maîtrise', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les changements concernant les applications en production.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue  le  suivi  de  la  qualité  de  la  production (performances,  incidents)  conformément au', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle l’exploitabilité de la solution sur les serveurs.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Valide la faisabilité des déploiements et intégration systèmes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met éventuellement en place des outils de télémaintenance.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne les projets d’un domaine d’activité en tant que spécialiste de la production.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planifie et suit l’activité d’intégration du domaine concerné en relation avec les études.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise et met en œuvre le plan d’assurance qualité du système d’information.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Applications en service.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Documentation des chaînes d''exploitation et des reprises sur incident.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d''incidents en production.', NULL, 12);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 7);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Pilote D’Exploitation', 'Il assure en permanence la surveillance de l’ensemble des ressources informatiques et leur gestion opérationnelle. Il veille au niveau et aux engagements de service ainsi qu''à la qualité des traitements conformément au plan d’assurance qualité et de sécurité.', 'Il assure en permanence la surveillance de l’ensemble des ressources informatiques et leur gestion opérationnelle. Il veille au niveau et aux engagements de service ainsi qu''à la qualité des traitements conformément au plan d’assurance qual…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Pilote D’Exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Diagnostique les incidents en cas de problème constaté sur le réseau, sur les serveurs ou en', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue le démarrage, l''arrêt et la surveillance permanente des ressources en référence au', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alerte et intervient sur les incidents.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Relance des travaux après résolution.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alimente la base des incidents.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintient la documentation de pilotage.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure  la  disponibilité  des  ressources  physiques  (disques,  robots,  automates…)  et  des', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rapports de suivi d''exploitation.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect des contrats de service (SLA).', NULL, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des systèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 4);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Expert Systèmes D’Exploitation / Réseaux-Télécoms', 'Il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il peut intervenir directement sur tout ou partie d’un projet qui relève de son domaine d’expertise. L’expert système d’exploitation / réseau télécoms effectue une veille technologique, il participe aux études de l’architecture technique générale et de son évolution ainsi qu’à la qualification des plates- formes informatiques.', 'Il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il peut intervenir directement sur tout ou partie d’un projet qui relève de son domaine d’expertise. L’expert système d’exploitation / réseau télécoms effe…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Expert Systèmes D’Exploitation / Réseaux-Télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduit les études pour la définition des systèmes en fonction des besoins.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assiste et conseille dans la mise en œuvre des solutions techniques.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Diagnostique les causes de dysfonctionnement et propose des corrections et des solutions de', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Forme à l’utilisation des nouveaux systèmes.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue la veille technologique.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose des solutions pour améliorer les performances des systèmes.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est l’interface reconnue des experts des autres domaines.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les règles de bonne gestion des systèmes d’exploitation / réseau télécoms.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualifie les systèmes d''un point de vue technique et fonctionnel.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie l’application des normes (sécurité informatique, qualité…).', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Certifie les composants et les applications développées.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe aux colloques, forums, groupes de travail.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Enseignement, émet des publications.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Notes d''information et de préconisation sur les systèmes ou réseaux dont il a la charge.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de préconisations retenues.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de demandes d''intervention sur les projets.', NULL, 16);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Architecte Technique', 'Il définit l’architecture technique de tout ou partie du système d’information. Il garantit la cohérence et la pérennité de l’ensemble des moyens informatiques, en exploitant au mieux les possibilités de l’art, dans le cadre du plan d’urbanisme de l’entreprise.', 'Il définit l’architecture technique de tout ou partie du système d’information. Il garantit la cohérence et la pérennité de l’ensemble des moyens informatiques, en exploitant au mieux les possibilités de l’art, dans le cadre du plan d’urban…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Architecte Technique' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit l’architecture technique du ou des systèmes d’information.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie  et  analyse  les  impacts  techniques  des  nouvelles  solutions  et  leur  cohérence  avec', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et gère le référentiel du système informatique sur les plans : outils, procédures, normes,', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et gère les standards techniques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pour  tout  nouveau  projet  ou  toute  nouvelle  technologie,  participe  à  l’étude  d’impact  sur', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Préconise des choix techniques en vue d’assurer la cohérence de cette évolution.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseille l''urbaniste sur l’utilisation et les implémentations possibles des outils informatiques', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise les choix de veille technologique.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille en équipe avec l''Urbaniste des SI.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promeut l’architecture technique auprès des informaticiens.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition d''architecture technique opérationnelle.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Référentiel d''architecture (cartographie technique du ou des SI).', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Notes d''information et de préconisation.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure de  l''agilité  et  de  la réactivité  de  l''infrastructure technique  à un changement donné', NULL, 14);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Ingénierie des systèmes TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie de sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Support et assistance aux utilisateurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Assistant Fonctionnel', 'Référent Métier, il apporte à l’utilisateur final une aide en matière d’utilisation de logiciels, en période de déploiement ou en régime de croisière, et contribue à résoudre toute difficulté que celui-ci rencontre. Il signale aux acteurs projet les demandes d''évolutions et les dysfonctionnements. À la jonction de la DSI (maître d’œuvre) et du client (direction, maîtrise d’ouvrage, utilisateurs), il intervient directement auprès des utilisateurs. Plutôt spécialisé sur un métier ou un processus, il aide et conseille l’utilisateur final à bien utiliser ses outils logiciels. Il contribue à la conduite du changement.', 'Référent Métier, il apporte à l’utilisateur final une aide en matière d’utilisation de logiciels, en période de déploiement ou en régime de croisière, et contribue à résoudre toute difficulté que celui-ci rencontre. Il signale aux acteurs p…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Assistant Fonctionnel' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide à la définition des formations et participe à leur réalisation.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne les utilisateurs.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Capitalise le partage des expériences.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseille les utilisateurs.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Détecte les utilisateurs en difficulté.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Recense et répercute les améliorations fonctionnelles souhaitées.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle et suit les dossiers avant transmission au Métier.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille au respect de la qualité et de la cohérence des réponses apportées aux utilisateurs.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réalise une analyse qualitative et quantitative des actions de son domaine de responsabilité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propositions d''évolutions des logiciels.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Proposition de formations.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d''incidents traités dans les délais imparti.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Niveau de satisfaction des utilisateurs dans son activité d’assistance.', NULL, 13);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Support et assistance aux utilisateurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien Support Utilisateurs', 'Il assure la réception des incidents (ruptures du service habituellement rendu) ou difficultés déclarés par les utilisateurs. Il les fait prendre en charge par les ressources capables d’y apporter une solution. Il contribue, au premier niveau, à la résolution des incidents nuisant à la qualité et à la continuité de service. À la différence de l’assistant fonctionnel, il traite tout type d’incidents et n’est pas toujours présent auprès des utilisateurs.', 'Il assure la réception des incidents (ruptures du service habituellement rendu) ou difficultés déclarés par les utilisateurs. Il les fait prendre en charge par les ressources capables d’y apporter une solution. Il contribue, au premier nive…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien Support Utilisateurs' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prend en compte les appels des utilisateurs.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Enregistre des incidents ou anomalies de fonctionnement signalées.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pré-diagnostique et qualifie.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Traite  le  1er  niveau  des  incidents  ou  anomalies  :  diagnostic,  identification,  information,', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transfère si nécessaire les appels des utilisateurs aux entités compétentes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alerte sa hiérarchie sur tout incident qui est « hors norme ».', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue le suivi du traitement des appels des utilisateurs.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploite la base d’incidents : relances, consolidation, analyse de tendance.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Émet des demandes d’actions préventives de fond.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Documentation des actions correctives dans la base d''incidents.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d''incidents de 1er niveau résolus dans les délais impartis.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de préconisations d’actions préventives retenues.', NULL, 12);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Support aux changements' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des systèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 7);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Support et assistance aux utilisateurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Expert Méthode Et Outils / Qualité', 'Garant de son domaine d’expertise, il peut intervenir directement sur tout ou partie d’un projet. En tant que référent dans son domaine, il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte sur les risques. Il effectue un travail de veille technologique sur son domaine et propose des évolutions qu’il juge nécessaires. Il est l''interlocuteur reconnu des experts externes (fournisseurs, partenaires.).', 'Garant de son domaine d’expertise, il peut intervenir directement sur tout ou partie d’un projet. En tant que référent dans son domaine, il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte sur les risques. Il…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Expert Méthode Et Outils / Qualité' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assiste et conseille dans le choix et l’utilisation des méthodes.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Forme aux nouvelles technologies et systèmes.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe aux études et développement & conduite d’études ponctuelles.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et gère des normes, méthodes, outils et référentiels.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place les normes, méthodes et outils et en vérifie l''application.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Certifie des composants et applications développées.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue de la veille et de l’évaluation prospective technologique.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe aux colloques, forums, groupes de travail.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Enseigne, publie.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dossiers d''expertise.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Référentiels sur le domaine d''expertise.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de demandes d''intervention sur les projets.', NULL, 12);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie de sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Sécurité' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Expert En Cybersécurité', 'L’Expert sécurité des SI définit et met en œuvre les dispositifs techniques de sécurité sur tout ou partie des projets dont il a la charge, conformément à la politique de sécurité des SI et de l’information, et aux réglementation s. En tant que référent dans son domaine, il assure un rôle de veille (technologique notamment), de conseil, d’assistance, d’information, de formation et d’alerte sur les risques SI.', 'L’Expert sécurité des SI définit et met en œuvre les dispositifs techniques de sécurité sur tout ou partie des projets dont il a la charge, conformément à la politique de sécurité des SI et de l’information, et aux réglementation s. En tant…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Expert En Cybersécurité' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la rédaction des politiques sécurité SI.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe à la rédaction et au suivi des standards de sécurité SI.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et tient à jour la cartographie des menaces.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure l’analyse des relevés d’incidents et alertes.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne,  conseille  et  informe  les  projets  dans  le  choix,  l’utilisation  et  l’évolution  des', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Forme les utilisateurs, intervenants techniques et autres relais opérationnels, aux nouvelles', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe aux études et développement & conduite d’études ponctuelles.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit, met en place et vérifie l’application des normes, méthodes, outils et référentiels de', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose les actions correctrices pour pallier aux dysfonctionnements de sécurité SI.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Certifie les applications et composants développés au regard de la réglementation (RGPD par', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure une veille technologique autour de la sécurité et de la cybersécurité.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe aux colloques, forums, groupes de réflexion pour comprendre comment optimiser les', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est l''interlocuteur reconnu des experts externes (fournisseurs, partenaires.).', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dossiers d’expertise.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Cartographie des menaces.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Robustesse : taux d’indisponibilité des systèmes.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Tendance d’évolution des attaques par niveau de gravité.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de failles détectées.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pourcentage d’attaques déjouées et délai entre l’attaque et la réaction.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure de l’impact provoqué par une attaque : taux d’indisponibilité des systèmes.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'gestion de crise cyber.', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'pentests (tests d’intrusion),', NULL, 22);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'vulnérabilités & codes malveillants,', NULL, 23);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'analyse en détection d’intrusions / en traitement d’incidents,', NULL, 24);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'direction de SOC.', NULL, 25);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, '….', NULL, 26);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Innovation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Sécurité' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Auditeur Ssi', 'L’auditeur en SSI a pour mission d’effectuer des inspections de sécurité et des audits sur les SI afin d’en connaître l’état de vulnérabilité et de déterminer les mesures à prendre pour en renforcer la sécurité. Un auditeur SSI peut effectuer des audits de différents niveaux, selon son périmètre d’activité (tests d’intrusion, audit de code, revue de configuration, etc.). Il identifie les vulnérabilités et propose des actions de remédiation. Il assure le contrôle de la conformité technique, opérationnelle, réglementaire, légale.', 'L’auditeur en SSI a pour mission d’effectuer des inspections de sécurité et des audits sur les SI afin d’en connaître l’état de vulnérabilité et de déterminer les mesures à prendre pour en renforcer la sécurité. Un auditeur SSI peut effectu…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Auditeur Ssi' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administrer la réalisation d’inspections locales (interviews, audits, tests d''intrusion, analyses', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Produire des tableaux de bord du niveau de sécurité et de conformité.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rédiger  des  rapports  incorporant  une  analyse  des  vulnérabilités  rencontrées  et  des', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rédiger des fiches techniques sur des domaines SSI techniques ou plus généraux.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Élaborer des outils utilisés pour les audits.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle la bonne application des procédures.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie la sécurité organisationnelle, le PRA/PCA, DLP (Data Loss Prevention), la conformité par', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Procède aux audits des configurations et audits de code.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assurer  une  veille  active  et  ciblée  dans  les  domaines  des  menaces,  nouvelles  technologies,', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rapports d’audits.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Préconisations en regard des résultats de l’audit concerné.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d’application des préconisations.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des non conformités (évolution, clôture des incidents…).', NULL, 13);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie de sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Sécurité' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable Sécurité Des Systèmes D’Information (Rssi)', 'Sa mission première est de s’assurer et garantir la bonne application de la politique de sécurité du SI. Le RSSI assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il préconise toute décision d’intervention sur les systèmes d’information, dans leur globalité, de son périmètre pour préserver l’intégrité et la continuité du SI.', 'Sa mission première est de s’assurer et garantir la bonne application de la politique de sécurité du SI. Le RSSI assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il préconise toute décision d’intervention su…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable Sécurité Des Systèmes D’Information (Rssi)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Sensibilise et forme les directions opérationnelles et métiers.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la promotion de la charte de sécurité informatique auprès de tous les utilisateurs.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Peut proposer un Plan d’Assurance Sécurité (PAS) pour décrire le dispositif de sécurité d’une', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évalue les risques, les menaces et les conséquences.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étudie les moyens assurant la sécurité et leur bonne utilisation.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit le plan de prévention.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prend', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prend les mesures conservatoires immédiates en cas d’incident.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare  et  met  en  œuvre  un  plan  de  continuité  informatique,  dans  le  cadre  du  Plan  de', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare et met en œuvre un plan de reprise informatique, dans le cadre du Plan de Reprise', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fait effectuer les analyses nécessaires à la compréhension d’un problème.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fait mettre en œuvre les mesures nécessaires à la résolution d’un problème.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Résultats des audits de sécurité internes.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Résultats des audits imposés par la législation.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Reporting et tableaux de bord de la sécurité SI.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Volumes de contrôles de sécurité.', NULL, 17);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie de sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Directeur Des Systèmes D’Information (Dsi)', 'Garant de l’alignement du SI sur la stratégie de l’entreprise, il est responsable de la conception, de la mise en œuvre et du maintien en conditions opérationnelles du système d’information, de la sécurité et de sa qualité. Dans ce cadre, il porte le marketing du SI et de la DSI, dans son entreprise et à l''extérieur. Il fixe et valide les grandes évolutions de l’informatique de l’entreprise. Il anticipe les évolutions nécessaires en fonction de la stratégie de l’entreprise et en maîtrise les coûts. Il détermine les investissements en fonction des sauts technologiques souhaités. Il s’assure de l’efficacité et de la maîtrise des risques liés au système d’information', 'Garant de l’alignement du SI sur la stratégie de l’entreprise, il est responsable de la conception, de la mise en œuvre et du maintien en conditions opérationnelles du système d’information, de la sécurité et de sa qualité. Dans ce cadre, i…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Directeur Des Systèmes D’Information (Dsi)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit des orientations stratégiques I&T de l’entreprise.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseille et définit la politique du SI de l’entreprise.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit l’ensemble des activités de la DSI.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Arbitre les moyens de la DSI (études, ressources, budgets, investissements…).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise,  anime  et  suit  les  concertations  et  échanges  entre  la  direction  générale  et  les', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la qualité de la relation clients-fournisseurs.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et garantit le respect des contrats de service.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Négocie, maîtrise et suit les contrats de sous-traitance et leur mise en œuvre.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse le marché, évalue les offres de sous-traitance et est force de proposition vis-à-vis de', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse les performances contrôle la qualité de la sous-traitance.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et supervise la gestion générale et l’organisation de la DSI.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère  et  arbitre  les  projets  pluridisciplinaires  impliquant  des  acteurs  géographiquement', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en œuvre des actions d’accompagnement du changement pour les informaticiens.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les relations avec les partenaires I&T.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit les relations avec les organismes extérieurs partenaires.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et met en œuvre la politique de gestion des risques informatiques.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la fiabilité, la confidentialité et l’intégrité des systèmes d’information.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'ROI des projets.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Efficacité au moindre coût du système d''information.', NULL, 19);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion du développement durable' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Innovation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable D’Entité', 'Il dirige, anime, coordonne, et gère une entité informatique pour atteindre les objectifs fixés dans le cadre de la stratégie définie pour son entité. Il est force de proposition des grandes évolutions du SI dans le cadre de la stratégie déterminée par le DSI. Il participe à la définition d’une politique de « faire ou faire faire » et la met en œuvre. Il est le garant de prestations informatiques produites en qualité et sécurité pour le coût optimum.', 'Il dirige, anime, coordonne, et gère une entité informatique pour atteindre les objectifs fixés dans le cadre de la stratégie définie pour son entité. Il est force de proposition des grandes évolutions du SI dans le cadre de la stratégie dé…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable D’Entité' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote  la  gestion  financière  (récurrente  et  projet)  en  veillant  au  respect  des  procédures', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote la mise en place et veille au respect des procédures et méthodes d’assurance de qualité', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communique auprès des directions métier et maîtrises d’ouvrages clientes de l’entité.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communique  au  sein  de  son  entité  (communication  d’entreprise,  communication  sur', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ensemble de prestations respectant les critères de délai et de qualité, et satisfaction clients', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Adéquation des compétences de l''entité avec le service attendu.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect des délais et des budgets.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Progression des compétences de l''entité.', NULL, 16);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable Télécoms', 'Le responsable télécoms et réseaux est chargé de définir et mettre en application dans le cadre du schéma directeur informatique la stratégie Réseaux et Télécoms de l’entreprise. Son champ d’action recouvre les services de données et de voix. Il porte et met en œuvre la politique Sécurité de l''entreprise dans son domaine.', 'Le responsable télécoms et réseaux est chargé de définir et mettre en application dans le cadre du schéma directeur informatique la stratégie Réseaux et Télécoms de l’entreprise. Son champ d’action recouvre les services de données et de voi…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable Télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote  la  gestion  financière  (récurrente  et  projet)  en  veillant  au  respect  des  procédures', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les besoins et les choix de l’architecture télécoms et réseaux.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Valide  les  choix  et  leur  compatibilité  avec  l’architecture  informatique  et  les  standards', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable de l’exploitation et de l’administration des réseaux et services à valeur ajoutée.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit un tableau de bord sur la qualité du service réseau.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fournit support et assistance dans l’utilisation des services de communication voix et données.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Se charge de l’application des polices de sécurité et exploitation des journaux de sécurité.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseille et assiste les équipes projets du département IT ou des divisions opérationnelles.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Oriente et organise la veille technologique.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit les nouvelles offres et nouveaux entrants.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suit la réglementation tarifaire.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit le cahier des charges (périmètre, services…).', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réalise le dépouillement des appels d’offres.', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fait le choix et le suivi des équipements, services, opérateurs et intervenants extérieurs.', NULL, 22);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Se charge des achats, négociation et contractualisation réalisés avec le service des achats, le', NULL, 23);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Se charge de la définition des besoins.', NULL, 24);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fixe et garantit le niveau de service des réseaux voix et données.', NULL, 25);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la coordination générale et la cohérence des projets Télécom et Réseaux.', NULL, 26);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Se charge de l’optimisation et de la maîtrise des coûts télécoms.', NULL, 27);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle la qualité de service des opérateurs.', NULL, 28);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit des tableaux de bord.', NULL, 29);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Valide et contrôle le budget Telecom et Réseaux.', NULL, 30);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Une architecture réseau et télécoms opérationnelle et performante.', NULL, 31);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux de satisfaction des utilisateurs, notamment en situation de mobilité ou de télétravail.', NULL, 32);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre d’incidents remontés.', NULL, 33);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Économiques : concurrence et délai de mise en œuvre des solutions.', NULL, 34);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Techniques (dont la sécurité) et technologiques (5G, Wifi 6…).', NULL, 35);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'D''évolutions des métiers dans un environnement technologique en forte évolution.', NULL, 36);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable D’Exploitation', 'Il dirige l’ensemble des opérations et des moyens de production de l’activité de son entité ; il est responsable du niveau de qualité de service et de sécurité prévus conformément aux attentes des utilisateurs. Il anime et coordonne l’activité des différents secteurs d’un centre d’exploitation, de façon à garantir un fonctionnement optimum des unités de production (planification, organisation, délais, normes…).', 'Il dirige l’ensemble des opérations et des moyens de production de l’activité de son entité ; il est responsable du niveau de qualité de service et de sécurité prévus conformément aux attentes des utilisateurs. Il anime et coordonne l’activ…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable D’Exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote  la  gestion  financière  (récurrente  et  projet)  en  veillant  au  respect  des  procédures', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Supervise l’ensemble de la production : pilotage, ingénierie système et exploitation. Ainsi que', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle la fiabilité du système, la sécurité des données ; le cas échéant, définit des plans de', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Applique les plans de secours et de sauvegarde.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne  la  réalisation  des  traitements  informatiques  dans  les  meilleures  conditions  de', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organisation  de  l’information  en  cas  de  situation  perturbée,  diffusion  de  l’information', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assurer le maintien au niveau technique adéquat des moyens de production.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Anticiper  les  évolutions  technologiques  et  leurs  impacts  sur  le  dimensionnement  de', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure le suivi des contrats de prestation.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Un système informatique de production opérationnel et performant.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux de satisfaction des utilisateurs (conformité fonctionnelle).', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre d’incidents remontés.', NULL, 20);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable D’Études', 'Il dirige des activités d’étude et de développement qui contribuent à l’évolution et la maintenance du SI. Il travaille essentiellement en regard des processus métiers de l’entreprise.', 'Il dirige des activités d’étude et de développement qui contribuent à l’évolution et la maintenance du SI. Il travaille essentiellement en regard des processus métiers de l’entreprise.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable D’Études' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote  la  gestion  financière  (récurrente  et  projet)  en  veillant  au  respect  des  procédures', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduit (pour éviter de confondre avec l’étape d’intégration) les études et réalisations de tous', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les contrats de service (SLA) associés aux processus métiers qui engagent la DSI auprès', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe aux décisions concernant la stratégie SI, les évolutions des architectures applicatives', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote la coordination organisationnelle et opérationnelle avec ses partenaires.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Entretient une parfaite maîtrise des relations avec les fournisseurs, en particulier les éditeurs', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Solutions applicatives avec leur maintenance associée.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Respect des SLA définis au départ.', NULL, 17);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des projets et du portefeuille de projets' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chief Digital Officer (Cdo)', 'Principalement il engage et pilote la transformation numérique de l’entreprise, avec le support de la Fonction SI, et en embarquant tous les métiers. Il impulse la réflexion des dirigeants sur l’impact du numérique sur le modèle d’affaires et sur la stratégie de l’entreprise. La fonction de CDO peut être portée par le DSI, qui aura alors la double responsabilité d’orchestrer globalement la transformation de l’entreprise et d’assurer l’intégration du numérique de manière cohérente et maîtrisée. ACTIVITÉS ET TÂCHES Stratégie : • Identifie les opportunités de création de valeur par l’utilisation des technologies numériques, tant pour l’optimisation des modèles d''affaire existants que pour l’identification de nouveaux. • Promeut le développement du multi-canal (primauté de l’expérience client, personnalisation, services à valeur ajoutée, …). • Garantit la pleine exploitation des données à disposition, en liaison avec le Chief Data Officer. • Organise le développement de partenariats avec l’écosystème. • Améliore la chaîne de production par les innovations numériques et les nouvelles formes d’organisation du travail. • Définit les priorités numériques de l’entreprise, conformément à la stratégie numérique de l’entreprise. • Évalue la performance des investissements digitaux. Accompagnement du changement : • Diffuse la culture numérique dans les métiers et les fonctions support. • Impulse la culture « données » dans l’entreprise, organise la transversalité entre les métiers dans toute l’entreprise. • Contribue à faire évoluer, avec la DRH, l’organisation du travail, les processus de recrutement, la gestion des carrières, les méthodes d’évaluation des contributions à la performance de l’entreprise. • Contribue à mettre en place des dispositifs de formation et de mise à niveau de l’ensemble des collaborateurs sur le numérique. LIVRABLES • La stratégie de transformation digitale de son organisation. NOMENCLATURE DES PROFILS MÉTIERS DU SI – VERSION 2022 7. MANAGEMENT OPÉRATIONNEL 7.6. CHIEF DIGITAL OFFICER (CDO) P A G E | 219 • Grille de maturité digitale de l’organisation. • Roadmap digitale. • Ensemble des plans d’investissement digitaux consolidés avec ROI. INDICATEURS DE PERFORMANCE • Mesure de la progression dans la maturité digitale. • Le nombre de projets digitaux avec leur ROI. • Visibilité digitale de l’organisation de l’entreprise (exemple la place de l’entreprise dans le e- CAC 40). • Contribution digitale au business (comme les offres business sont valorisées). PARCOURS PROFESSIONNEL Profil expérimenté niveau DG avec une bonne vision de la stratégie. Peut venir d’autre métiers ou marketing mais avec une forte appétence au numérique. TENDANCES ET FACTEURS D’ÉVOLUTION Le poste de CDO n’a pas nécessairement vocation à être pérenne dans l’entreprise : sa mission peut être transitoire mais indispensable pour permettre à l’entreprise d’opérer sa transformation numérique. Évolutions vers des postes de DSI ou de DG (marketing, direction métiers...) Cela dépend d’où il vient et du contexte de l’organisation. SYNTHÈSE DES COMPÉTENCES ET NOTIONS TRANSVERSALES (ISSUES DE LA NORME NF EN 16234-1-FR) A.1. Systèmes d''information et alignement stratégique métier A.7. Veille technologique A.9. Innovation D.6. Marketing numérique 5 5 5 4 A.3. Mise en place d''un plan d''activités 5 A.8. Gestion du développement durable A.10. Expérience utilisateur E.9. Gouvernance des systèmes d''information 4 4 5 NOMENCLATURE DES PROFILS MÉTIERS DU SI – VERSION 2022 7. MANAGEMENT OPÉRATIONNEL 7.6. CHIEF DIGITAL OFFICER (CDO) P A G E | 220 T1 Accessibilité T2 Éthique T3 Questions juridiques liées aux TIC T4 Respect de la vie privée T5 Sécurité T6 Développement durable T7 Utilisabilité              ', 'Principalement il engage et pilote la transformation numérique de l’entreprise, avec le support de la Fonction SI, et en embarquant tous les métiers. Il impulse la réflexion des dirigeants sur l’impact du numérique sur le modèle d’affaires …', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chief Digital Officer (Cdo)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promeut le développement du multi-canal (primauté de l’expérience client, personnalisation,', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit la pleine exploitation des données à disposition, en liaison avec le Chief Data Officer.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise le développement de partenariats avec l’écosystème.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Améliore  la  chaîne  de  production  par  les  innovations  numériques  et  les  nouvelles  formes', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les priorités  numériques  de  l’entreprise,  conformément à la stratégie  numérique  de', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évalue la performance des investissements digitaux.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Diffuse la culture numérique dans les métiers et les fonctions support.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à faire évoluer, avec la DRH, l’organisation du travail, les processus de recrutement,', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à mettre en place des dispositifs de formation et de mise à niveau de l’ensemble des', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Grille de maturité digitale de l’organisation.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Roadmap digitale.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ensemble des plans d’investissement digitaux consolidés avec ROI.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure de la progression dans la maturité digitale.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Visibilité digitale de l’organisation de l’entreprise (exemple la place de l’entreprise dans le e-', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribution digitale au business (comme les offres business sont valorisées).', NULL, 15);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion du développement durable' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Innovation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Expérience utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Marketing numérique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable Marketing De La Dsi', 'Le responsable du marketing de la DSI construit une relation avec les clients de la DSI, les utilisateurs des services et a une connaissance précise de leurs besoins. Il markette l’offre de la DSI et ainsi définit, valorise, rationalise et commercialise/publie l’offre de services SI. Il garantit la satisfaction des clients et utilisateurs en rendant visible et faisant la promotion de la qualité de service auprès des clients et utilisateurs. Il met en place une stratégie de communication structurée qui permettra de répondre aux besoins d’information des utilisateurs, et ce, tout au long du cycle de vie d’un service (évolutions de fonctionnalités, dysfonctionnements…).', 'Le responsable du marketing de la DSI construit une relation avec les clients de la DSI, les utilisateurs des services et a une connaissance précise de leurs besoins. Il markette l’offre de la DSI et ainsi définit, valorise, rationalise et …', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable Marketing De La Dsi' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est responsable de la relation avec les clients et les utilisateurs de la DSI.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la gestion de la demande hors catalogue et des réclamations à la DSI.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mesure régulièrement et améliore la satisfaction des clients et des utilisateurs du SI (enquêtes', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développe la connaissance clients et utilisateurs (bases de connaissances clients et utilisateurs,', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise et anime des « clubs utilisateurs » et des événements autour des projets/services de', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fait connaitre l’offre de service et le catalogue de service de la DSI auprès des utilisateurs.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne  les  projets  SI  dans  la  conduite  du  changement  et  dans  leur  communication', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Markette l’offre de service de la DSI (définitions des fiches de service, packages, …).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Publie l’offre (catalogue de service).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promotion  et  communication  sur  la  qualité  du  ou  des  supports  bureautiques  et  applicatifs', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue au développement de projets SLAs, à la définition et au suivi des engagements de', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développe la Customer Experience', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose de nouveaux services, en intégrant dès la conception une approche marketing (user', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Plan marketing et communication.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Outillage de la mesure de la satisfaction client (enquêtes…).', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Catalogue de services.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre d’événements clients et utilisateurs organisés.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux d’adhésion aux nouveaux services.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Des  fonctions  de  responsable  de  projet  de  fonction  d’innovation  ou  de  développement  de', NULL, 19);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement des ventes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Marketing numérique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Data Scientiste', 'Positionné auprès des Métiers ou de la DSI, il exploite, analyse et évalue la richesse de données, structurées ou non, pour établir des scénarii permettant de comprendre et anticiper de futurs leviers métiers ou opérationnels pour l’entreprise.', 'Positionné auprès des Métiers ou de la DSI, il exploite, analyse et évalue la richesse de données, structurées ou non, pour établir des scénarii permettant de comprendre et anticiper de futurs leviers métiers ou opérationnels pour l’entrepr…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Data Scientiste' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'S‘appuie sur ses compétences scientifiques et techniques avancées, contextualisées par des', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille sur des périmètres métiers ciblés (cas d’usage) pour explorer et exploiter des flux de', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Obtient  des  données  adéquates,  trouve  les  sources  de  données  pertinentes,  fait  des', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conçoit des modèles statistiques et/ou d’apprentissage automatisé.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Compare  et  évalue  différents  modèles  ou  méthodes  de  calcul  et  anticipe  les  avantages  et', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la veille en recherche & innovation pour introduire de nouvelles approches d’analyse', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Scénarios prédictifs.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Précision et valeur ajoutée des prédictions.', NULL, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Science des données et analyse' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement prévisionnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Data Analyste', 'Positionné auprès des Métiers ou de la DSI ou dans un pôle data transverse, il met en œuvre des outils informatiques, des techniques et des méthodes statistiques pour permettre d’organiser, synthétiser et traduire efficacement des données Métiers. Il produit et est responsable des indicateurs de performance qui permettent les prises de décision. Activités et tâches.', 'Positionné auprès des Métiers ou de la DSI ou dans un pôle data transverse, il met en œuvre des outils informatiques, des techniques et des méthodes statistiques pour permettre d’organiser, synthétiser et traduire efficacement des données M…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Data Analyste' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'À partir des exigences Métiers, il identifie les données les plus intéressantes.', NULL, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception et développement d''applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Science des données et analyse' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement prévisionnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chief Data Officer', 'Le Chief Data Officer est un directeur responsable des Données de l’entreprise. Son rattachement dépend de l’organisation et de la gouvernance de l’entreprise. Il a pour mission transverse et générale de définir et de faire appliquer la stratégie de l’entreprise au regard de la valorisation de son patrimoine informationnel. Il est responsable de l’optimisation de l’utilisation des données en termes de qualité et de cohérence. Il travaille en synergie avec les RSSI pour la sécurité des données, le DPO pour les problématiques liées aux données personnelles, et avec les managers des équipes de données (Data). Il travaille également étroitement avec l’ensemble des acteurs de l’organisation pour créer profit et valeur : cette fonction peut donc s’exercer sur différents domaines, tels que la stratégie, le juridique, le marketing, l’innovation, les SI, l’efficacité opérationnelle et la gestion du patrimoine informationnel.', 'Le Chief Data Officer est un directeur responsable des Données de l’entreprise. Son rattachement dépend de l’organisation et de la gouvernance de l’entreprise. Il a pour mission transverse et générale de définir et de faire appliquer la str…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chief Data Officer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Une politique de gouvernance des données.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Des rapports d’audit sur l’application de la politique des données.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Une organisation de la communauté « données ».', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de projets/programmes lancés autour de la donnée (capacité à évangéliser).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conclusions du rapport d’audit sur l’application de la politique des données.', NULL, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Innovation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement prévisionnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 0, 8);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Data Engineer', 'Le Data Engineer développe, construit et maintient des infrastructures de données d’un point de vue système et sécurité. Il s’assure de la collecte, du stockage et de l’exploitation des flux de données répondant aux enjeux de l’entreprise. Il est garant de l’accès qualitatif des sources de données qui viennent alimenter le Data Lake afin d’en faciliter l’exploitation par les équipes de Data Science. Il définit également la structure des métadonnées.', 'Le Data Engineer développe, construit et maintient des infrastructures de données d’un point de vue système et sécurité. Il s’assure de la collecte, du stockage et de l’exploitation des flux de données répondant aux enjeux de l’entreprise. …', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Data Engineer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Cartographie et documente les sources de données.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la maintenance des différentes applications données (Data) déployées en production', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conçoit les solutions permettant le traitement de volumes importants de flux de données et', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Structure les bases de données (sémantique, format, etc.).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la gestion des référentiels de données.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Capte  et  stocke,  en  toute  sécurité,  les  données  (structurées  ou  non)  produites  dans  les', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure  la  supervision  et  l’intégration  des  données  de  diverses  nature  qui  proviennent  de', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nettoie la donnée (élimination des doublons…) et la valide pour une utilisation aval.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Anime  la  communauté  technique  qui  met  en  œuvre  les  dispositifs  prévus  ou  nécessaires  à', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Reste en alerte sur les technologies liées  au traitement de la manipulation de la donnée et', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose des évolutions pour les infrastructures et solutions de données en place.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dossier  d’architecture  (ou  cadre  technique)  des  solutions  (plateformes)  de  traitement  des', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Un data lake adapté aux besoins actuels et futurs de l’entreprise.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Une cartographie des données.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Volume et richesse du Data Lake.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Rapidité de la mise à disposition de la donnée.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité de la donnée.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux de rejet (plus il est faible meilleur c’est).', NULL, 18);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Ingénierie des systèmes TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Science des données et analyse' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 9);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 10);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Délégué À La Protection Des Données (Dpo)', 'Le DPO est la personne chargée de la protection des données au sein d’une organisation. Il est désigné dans les conditions prévues par la réglementation en vigueur, est indépendant et ne reçoit pas d’instructions de son employeur. Le DPO est un point de contact de l’entreprise à l’égard de l’Autorité de Contrôle (la CNIL). Dans la réalisation de ses missions, il prend en considération les risques afférents à la nature, la portée, les finalités et le contexte des traitements réalisés dans son entreprise, sur le périmètre pour lequel il a été désigné. Sa fonction peut s’exercer sur différents domaines, tels que la stratégie, le juridique, le marketing, l’innovation, les SI, l’efficacité opérationnelle et la gestion du patrimoine informationnel. Il travaille à minima en synergie avec le Chief Data Officer et le DSI.', 'Le DPO est la personne chargée de la protection des données au sein d’une organisation. Il est désigné dans les conditions prévues par la réglementation en vigueur, est indépendant et ne reçoit pas d’instructions de son employeur. Le DPO es…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Délégué À La Protection Des Données (Dpo)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille  à  la  mise  en  œuvre  des  mesures  appropriées  pour  permettre  de  démontrer  que  les', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille à la bonne application du principe de protection des données dès la conception et par', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote la production et la mise en œuvre de politiques, de lignes directrices, de procédures et', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'S’assure que le registre des traitements des données à caractère personnel soit tenu et à jour.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'De manière générale a en charge le suivi de l’évolution réglementaire quant à la protection des', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Procède aux analyses d’impacts et de risques sur les données.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Apporter les conseils nécessaires en ce qui concerne les analyses d’impact sur la protection des', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Vérifie l’exécution des AIPD (Analyse d’Impact sur la Protection des Données ou PIA - Private', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'S’assure du bon traitement de l’exercice de leurs droits par les personnes concernées par les', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseille et forme les acteurs SI au respect de la réglementation en vigueur.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseille les métiers sur les processus et les procédures à mettre en place, à tous les stades de', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Plan d’audit.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Directives sur la politique d’application de la réglementation .', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Préconisations et recommandations en matière de gestion des données personnelles suite à', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de recours.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux de réalisation des audits.', NULL, 16);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie de sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Manager De Contrats', 'À la croisée des domaines juridique, financier et opérationnel, il optimise le programme d’achats de la DSI : • En garantissant la compétitivité et l’équité des contrats signés. • En assurant le suivi opérationnel de la relation fournisseurs (éditeurs, prestataires). • Ainsi que l’efficience de la politique de sous-traitance informatique. Il définit et met en œuvre la stratégie de performance des contrats au regard de leur cycle de vie ; il met en place et assure le suivi des indicateurs de l’activité contractuelle. Son périmètre d’action comprend (hors licences gérées par le SAM) les prestations informatiques techniques ou intellectuelles (éditeurs, constructeurs, distributeurs, conseil.), la sous-traitance applicative ou technique, la Tierce Maintenance Applicative (TMA) et l’infogérance de moyens.', 'À la croisée des domaines juridique, financier et opérationnel, il optimise le programme d’achats de la DSI : • En garantissant la compétitivité et l’équité des contrats signés. • En assurant le suivi opérationnel de la relation fournisseur…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Manager De Contrats' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue  à  la  mise  en  place  des  processus  de  sourcing  et  d’achat  des  prestations', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évaluer  les  opportunités  (économiques,  organisationnelles,  politiques.)  pour  améliorer  la', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe au cycle de vie (établissement, avenants, (re)négociations, terminaison.) des contrats', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe  à  la  formalisation  des  contrats  et  assiste  les  prescripteurs  dans  l’élaboration  des', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue et participe aux négociations et à la conduite des appels d''offres avec les partenaires', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise et anime les Comités contractuels avec les fournisseurs majeurs.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les obligations contractuelles, financières et liées au risque.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'S’assure du bon déroulement des contrats et du respect du cadre de référence (PAQ, PRA, Plan', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote  les  prescriptions  techniques  en  lien  avec  les  partenaires  internes,  pendant  la  phase', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alimente et consolide les tableaux de bord.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alerte la direction en cas de dérives et propose des axes de progrès.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'En  lien  avec  toutes  les  parties  prenantes,  il  analyse  les  besoins  émanant  des  projets  et  les', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure une veille technologique sur les outils en relation avec son activité de performance et', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre d’avenants signés.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de dossiers contentieux.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Nombre de gestion de crise gérées.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintien de la trajectoire financière.', NULL, 17);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion du développement durable' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Achats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des contrats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Acheteur It', 'Il garantit la compétitivité et l’équité des contrats signés avec les éditeurs, constructeurs et prestataires de services informatiques. Il veille au respect du processus achats et à l’équilibre des relations clients-fournisseurs. À ce titre, il négocie les prix, les termes et conditions et les contrats des biens et services IT acquis ou souscrits par l’entreprise. Il pilote et anime les relations économiques et commerciales avec les fournisseurs, accompagne et conseille ses clients internes. Il assure une veille marché, réglementaire et technologique dans l’intérêt de l’entreprise et des clients internes.', 'Il garantit la compétitivité et l’équité des contrats signés avec les éditeurs, constructeurs et prestataires de services informatiques. Il veille au respect du processus achats et à l’équilibre des relations clients-fournisseurs. À ce titr…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Acheteur It' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse et étudie les contrats entrant dans son périmètre et analyse les risques fournisseurs.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Négocie les contrats en relation avec les experts techniques de la DSI / Direction du Digital et', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communique  et  suit  les  déploiements  des  accords  auprès  des  clients  internes  et  des', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare  et  construit,  en  lien  avec  les  équipes  opérationnelles,  des  consultations  (RFI,  RFP,', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Procède au sourcing et à l’identification des prestataires.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare et anime les consultations et les soutenances.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Construit des grilles d’analyse et évalue les offres techniques, fonctionnelles et commerciales.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote les négociations (gré à gré ou dans le cadre des consultations).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe au processus de décision et de choix des fournisseurs et à la contractualisation.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des relations fournisseurs : analyse des reportings, revue des contrats et des dépenses,', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse des dépenses pour sa catégorie : collecte et analyse des dépenses par fournisseur et', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi régulier des performances achats : production des indicateurs clefs.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe ou pilote les analyses de risques marché et fournisseurs.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure une veille marché, technologique et réglementaire.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Effectue des benchmark.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Documents de consultations (RFI, RFP, RFQ).', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyses et documents de synthèses : étude de risque, analyse de marché, audit fournisseur,', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Montant sous gestion : en-cours, dépenses gérées par catégorie, par fournisseur.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Économies  générées  :  coûts  évités,  réduction/optimisation  des  budgets,  réductions  des', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Panel fournisseurs : évolutions du nombre de fournisseurs.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Simplification : réduction du nombre de contrats, factures, transactions.', NULL, 21);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des contrats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Software Asset Manager (Sam)', 'Il s’assure de la conformité de l’installation logicielle de l’organisation, afin de réduire les risques liés aux audits éditeurs. Il optimise les usages et les coûts des licences, des maintenances et des services cloud. Il apporte également une expertise et un support à la DSI, à la direction achats et à la direction juridique dans leurs relations techniques et commerciales avec les éditeurs de logiciels.', 'Il s’assure de la conformité de l’installation logicielle de l’organisation, afin de réduire les risques liés aux audits éditeurs. Il optimise les usages et les coûts des licences, des maintenances et des services cloud. Il apporte égalemen…', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Software Asset Manager (Sam)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prévoit et coordonne les inventaires logiciels au sein de l’organisation (recensement et analyse', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantit le maintien du référentiel des données de la gestion des licences.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère dès leur démarrage les audits éditeurs.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Collecte, vérifie et centralise les données d’inventaires.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse  la  conformité  :  vérifie  que  les  installations  et  les  usages  sont  conformes  aux  droits', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évalue les écarts et valorise les risques.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Propose des plans d’actions, en lien avec les équipes IT et achats pour réduire les risques et', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Optimise les achats de logiciels en évitant redondances et les manques par rapport aux besoins', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilote, en lien avec les fonctions IT et achats, la mise en œuvre des optimisations.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Évalue les économies associées à ces optimisations et les coûts éventuels de mises en œuvre', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne  les  chefs  de  projets  et  les  acheteurs  pour  chiffrer  et  optimiser  les  coûts', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participe (conseil et de facilitateur) aux négociations éditeurs et à la gestion des fournisseurs', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place les processus SAM et les interfaces avec les processus IT, achats existants.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pour les organisations matures : choisit, déploie et assure le maintien d’une solution logicielle', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Feuille de route de la stratégie d’optimisation SAM.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Note de synthèse, dossier de synthèse expliquant les contrats, les règles éditeurs.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Risques de non-conformité identifiés.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Économies générées (cash, cost avoidance).', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux de couverture (%) des licences sous contrôle SAM.', NULL, 19);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement des ventes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des contrats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Vendor Manager', 'Il s’inscrit dans une dynamique de transformation des organisations qui, de plus en plus, « achètent » au lieu de « faire », et a pour mission de maîtriser au mieux la relation avec les fournisseurs IT (en particulier les infogérants) dont le poids est croissant dans les organisations. Au confluent de la fonction Achats, du contrôle de gestion / finance et des entités technologiques de la DSI (aussi bien orientées « service delivery » que « expertise »), cette fonction vise trois objectifs majeurs : • Développer la « relation » avec les fournisseurs en définissant la gouvernance, en assurant la communication mutuelle sur chacune des organisations et en intervenant comme médiateur / facilitateur entre les intervenants. • Rendre opérationnelle la relation contractuelle issue des achats en intervenant comme « référent » sur les clauses opérationnelles : l’évolution du catalogue de prestations, le support aux demandes non standards et à leur négociation avec les fournisseurs, la communication sur les tarifs / indicateurs contractuels, …. • Piloter la relation « administrative et financière » avec les fournisseurs, en préparant les comités de pilotage des prestations, en suivant les tableaux de bord techniques et financiers ainsi que le respect des engagements de services, négociant les éventuelles pénalités, en complément des achats et avant l’intervention du juridique.', 'Il s’inscrit dans une dynamique de transformation des organisations qui, de plus en plus, « achètent » au lieu de « faire », et a pour mission de maîtriser au mieux la relation avec les fournisseurs IT (en particulier les infogérants) dont …', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Vendor Manager' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et met en œuvre des outils et méthodologies de suivi et benchmark de la performance', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et met en œuvre des outils et méthodologies de suivi des contrats et de gestion des', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse les usages et anticipe les besoins des métiers pour adapter au mieux les achats futurs', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est proactif dans le suivi des usages, alerte SI besoin les utilisateurs sur les usages inadaptés et', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communique vers les équipes IT et les métiers.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est « orienté client ».', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Sait gérer les éventuels conflits avec les fournisseurs.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Notes sur l’évolution des fournisseurs et des marchés, issus d’une veille continue.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Dossier de suivi fournisseurs (vision globale sur les fournisseurs, sa stratégie, son business, avec', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Revue de fournisseur.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Balance scorecard.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ranking du fournisseur.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Enquête de satisfaction fournisseur.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Taux de couverture des fournisseurs stratégiques.', NULL, 14);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des contrats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
-- Formations initiales pour la table formation
-- Généré le 2026-03-21 à partir de pages de catalogue actives / récentes
-- Compatibilité : H2 / SQL standard simple
-- Hypothèse : les tables formation, competence_si et formation_competence existent déjà.

-- =========================
-- 1. INSERTS FORMATION
-- =========================

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information',
'Formation continue du Cnam orientée architecture d''entreprise et urbanisation du SI. Couvre notamment l''architecture d''entreprise, les méthodologies SI, l''urbanisation, le contrôle d''accès et la gestion des identités. Source catalogue active en 2026.',
'https://www.cnam.fr/formation/electronique-informatique-telecommunication/informatique-systemes-dinformation-et-numerique/certificat-de-competence-architecte-dentreprise-et-urbaniste-des-systemes-dinformation-1',
'Cnam'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Mastère Spécialisé Architecte Digital d''Entreprise',
'Mastère Spécialisé de Télécom Paris orienté transformation numérique, architecture SI et architecture d''entreprise. Formation reconnue Conférence des Grandes Écoles, catalogue actif 2026.',
'https://www.telecom-paris.fr/fr/masteres-specialises/formation-architecte-digital-entreprise',
'Télécom Paris'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Architecture en cybersécurité',
'Formation certifiante Télécom Paris Executive Education centrée sur la conception d''architectures de sécurité, la gestion des risques, l''audit de sécurité, la sécurité cloud et les aspects réglementaires. Catalogue actif 2026.',
'https://executive-education.telecom-paris.fr/fr/architecture-cybersecurite',
'Télécom Paris Executive Education'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes',
'Certificat du Cnam orienté sécurité des données, des réseaux et des systèmes. Pertinent pour les compétences SSI, gestion des risques, sécurité des infrastructures et conformité. Page catalogue active en 2026.',
'https://www.cnam.fr/formation/electronique-informatique-telecommunication/informatique-systemes-dinformation-et-numerique/gestionnaire-de-la-securite-des-donnees-des-systemes-et-des-reseaux-3',
'Cnam'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Certificat de compétence Analyste Cloud',
'Certificat du Cnam orienté cloud computing, systèmes répartis, architecture cloud, intégration d''applications et sécurité du cloud. Référencé dans le catalogue informatique du Cnam en 2026.',
'https://informatique.cnam.fr/fr/spip.php?rubrique62=',
'Cnam'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Microsoft Azure - Administration',
'Formation ENI Service préparant à l''examen AZ-104 Microsoft Azure Administrator. Couvre administration Azure, gouvernance, identités, réseau, stockage, machines virtuelles et supervision. Page catalogue active en 2025/2026.',
'https://www.eni-service.fr/formation/formation-microsoft-azure-administration-maz-104t00/',
'ENI Service'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Certificat de spécialisation Intelligence artificielle',
'Certificat du Cnam orienté IA, IA avancée et exploitation de données multimédia. Adapté aux compétences science des données, innovation, modélisation et analyse prédictive. Catalogue informatique actif en 2026.',
'https://www.cnam.fr/formation/electronique-informatique-telecommunication/informatique-systemes-dinformation-et-numerique/certificat-de-specialisation-intelligence-artificielle-3',
'Cnam'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Formation Data Engineer',
'Formation Data Engineer de DataScientest / Liora couvrant Python, pipelines de données, orchestration, Spark, Airflow et AWS. Adaptée aux infrastructures data et au traitement industriel de la donnée. Catalogue actif en 2026.',
'https://datascientest.com/formation-data-engineer',
'DataScientest'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Développeur Full-Stack - Java et Angular',
'Parcours OpenClassrooms couvrant analyse des besoins, architecture technique, développement Java / Angular, tests, maintenance, CI/CD et déploiement. Catalogue actif en 2026.',
'https://openclassrooms.com/fr/paths/2460-developpeur-full-stack-java-et-angular',
'OpenClassrooms'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'ITIL 4 Foundation',
'Formation de référence en gestion des services IT couvrant incidents, demandes, amélioration continue, valeur de service et support. Page catalogue active en 2026.',
'https://www.eni-service.fr/formation/formation-itil-4-foundation/',
'ENI Service'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Mastère Spécialisé Manager des Systèmes d''Information',
'Mastère Spécialisé Télécom Paris / ESSEC orienté stratégie SI, gouvernance, management, pilotage et transformation numérique. Catalogue actif en 2026.',
'https://www.telecom-paris.fr/fr/masteres-specialises/formation-manager-systemes-information',
'Télécom Paris / ESSEC'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Gestion de projet informatique',
'Formation du Cnam couvrant expression des besoins, cahier des charges, planification, gouvernance MOA/MOE, pilotage de projet et gestion des risques. Page catalogue active en 2026.',
'https://www.cnam.fr/formation/gestion-de-projet-informatique',
'Cnam'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'COBIT 2019 Foundation',
'Formation ORSYS orientée gouvernance des systèmes d''information, alignement stratégique, pilotage, contrôle et création de valeur. Page catalogue active en 2026.',
'https://www.orsys.fr/formation/formation-cobit-2019-certification-cobit2019-foundation',
'ORSYS'
);

INSERT INTO formation (nom, description, url, organisme) VALUES (
'Délégué à la protection des données - DPO',
'Formation AFNOR Compétences pour la fonction DPO, couvrant RGPD, gouvernance des données personnelles, conformité, analyses d''impact et gestion des risques. Page catalogue active en 2026.',
'https://competences.afnor.org/formations/delegue-a-la-protection-des-donnees---dpo',
'AFNOR Compétences'
);
-- Formations Cigref / SI de santé
-- Généré automatiquement pour couvrir l'ensemble des compétences de la table competence_si
-- Compatible H2 (insertions idempotentes via WHERE NOT EXISTS)

-- Certificat de compétence Architecte d'entreprise et urbaniste des systèmes d'information / Cnam
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information',
  'Catalogue actif. Formation continue orientée architecture d’entreprise, urbanisation du SI, méthodologies SI et études d’architecture. Compétences cibles : alignement stratégique, architecture, gouvernance, recueil des besoins, veille.',
  'https://www.cnam.fr/formation/electronique-informatique-telecommunication/informatique-systemes-dinformation-et-numerique/certificat-de-competence-architecte-dentreprise-et-urbaniste-des-systemes-dinformation-1',
  'Cnam'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information');

-- Mastère Spécialisé Architecte Digital d’Entreprise / Télécom Paris
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Mastère Spécialisé Architecte Digital d’Entreprise',
  'Catalogue actif 2026-2027. Mastère spécialisé accrédité CGE, temps partiel. Couvre transformation digitale, architecture SI, innovation, urbanisation, architecture fonctionnelle et technique.',
  'https://www.telecom-paris.fr/fr/masteres-specialises/formation-architecte-digital-entreprise',
  'Télécom Paris'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Mastère Spécialisé Architecte Digital d’Entreprise');

-- Architecture en cybersécurité / Télécom Paris Executive Education
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Architecture en cybersécurité',
  'Formation certifiante active au catalogue. Axée architecture de sécurité, IAM, analyse de risque, audit, cloud security et DevSecOps.',
  'https://executive-education.telecom-paris.fr/fr/formations-certifiantes',
  'Télécom Paris Executive Education'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Architecture en cybersécurité');

-- Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes / Cnam
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes',
  'Catalogue actif, mis à jour en 2026. Certificat orienté sécurité des données, systèmes et réseaux, avec une approche SSI opérationnelle.',
  'https://www.cnam.fr/formation/electronique-informatique-telecommunication/informatique-systemes-dinformation-et-numerique/gestionnaire-de-la-securite-des-donnees-des-systemes-et-des-reseaux-3',
  'Cnam'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes');

-- Certificat de compétence Analyste Cloud / Cnam
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Certificat de compétence Analyste Cloud',
  'Catalogue actif. Certificat couvrant systèmes répartis, architectures cloud, intégration d’applications, exploitation et sécurité.',
  'https://www.cnam.fr/formation/logiciels-outils-applications-services/service-web/certificat-de-competence-analyste-cloud-5',
  'Cnam'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Certificat de compétence Analyste Cloud');

-- Microsoft Azure – Administration (AZ-104) / ENI Service
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Microsoft Azure – Administration (AZ-104)',
  'Cours officiel Microsoft préparant à la certification Azure Administrator Associate. Administration Azure, réseau, stockage, sécurité, supervision et exploitation.',
  'https://www.eni-service.fr/formation/formation-microsoft-azure-administration-2/',
  'ENI Service'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Microsoft Azure – Administration (AZ-104)');

-- Certificat de spécialisation Intelligence artificielle / Cnam
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Certificat de spécialisation Intelligence artificielle',
  'Catalogue actif. Certificat orienté IA, IA avancée et exploitation de données multimédia pour projets d’analyse et de modélisation.',
  'https://www.cnam.fr/formation/electronique-informatique-telecommunication/informatique-systemes-dinformation-et-numerique/certificat-de-specialisation-intelligence-artificielle-3',
  'Cnam'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Certificat de spécialisation Intelligence artificielle');

-- Formation Data Engineer / DataScientest / Liora
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Formation Data Engineer',
  'Catalogue actif. Formation data engineering couvrant Python, Airflow, Spark, AWS, pipelines, orchestration et industrialisation des flux.',
  'https://liora.io/formation/data-ia/data-engineer',
  'DataScientest / Liora'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Formation Data Engineer');

-- Développeur Full-Stack - Java et Angular / OpenClassrooms
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Développeur Full-Stack - Java et Angular',
  'Parcours actif en ligne. Analyse des besoins, architecture technique, développement Java/Spring Boot et Angular, tests, CI/CD, Docker et déploiement.',
  'https://openclassrooms.com/fr/paths/2460-developpeur-full-stack-java-et-angular',
  'OpenClassrooms'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Développeur Full-Stack - Java et Angular');

-- ITIL® 4 Foundation / ENI Service
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'ITIL® 4 Foundation',
  'Formation active au catalogue. Référentiel ITSM pour incidents, problèmes, demandes, services, amélioration continue et valeur des services.',
  'https://www.eni-service.fr/formation/formation-itil-4-foundation/',
  'ENI Service'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'ITIL® 4 Foundation');

-- Mastère Spécialisé Manager des Systèmes d’Information / Télécom Paris / ESSEC
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Mastère Spécialisé Manager des Systèmes d’Information',
  'Catalogue actif 2026-2027. Mastère spécialisé orienté stratégie, management, pilotage de portefeuille, finance, organisation, qualité et transformation numérique.',
  'https://www.telecom-paris.fr/fr/masteres-specialises/formation-manager-systemes-information',
  'Télécom Paris / ESSEC'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Mastère Spécialisé Manager des Systèmes d’Information');

-- Gestion de projet informatique / Cnam
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Gestion de projet informatique',
  'Catalogue actif. Cours sur expression du besoin, cahier des charges, rôles MOA/MOE, planification, estimation, risques, budget et pilotage.',
  'https://www.cnam.fr/formation/gestion-de-projet-informatique',
  'Cnam'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Gestion de projet informatique');

-- COBIT® 2019 Foundation, certification ISACA / ORSYS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'COBIT® 2019 Foundation, certification ISACA',
  'Formation active au catalogue 2026. Référentiel de gouvernance IT orienté alignement stratégique, création de valeur, maîtrise des risques et performance.',
  'https://www.orsys.fr/formation/formation-cobit-2019-certification-cobit2019-foundation',
  'ORSYS'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'COBIT® 2019 Foundation, certification ISACA');

-- Délégué à la protection des données - DPO / AFNOR Compétences
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Délégué à la protection des données - DPO',
  'Cycle métier DPO actif au catalogue. Conformité RGPD, analyse d’impact, gestion des risques, droits des personnes, politique et gouvernance de la donnée.',
  'https://competences.afnor.org/formations/delegue-a-la-protection-des-donnees---dpo',
  'AFNOR Compétences'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Délégué à la protection des données - DPO');

-- UX-PM, niveau 1 : adoption de l'UX, certification / ORSYS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'UX-PM, niveau 1 : adoption de l''UX, certification',
  'Catalogue actif. Formation certifiante d’introduction à l’UX, centrée expérience utilisateur, démarche centrée utilisateur, outils UX et compréhension des besoins.',
  'https://www.orsys.fr/formation-ux-pm-certification-user-experience-niveau1.html',
  'ORSYS'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'UX-PM, niveau 1 : adoption de l''UX, certification');

-- Sobriété numérique et éco-conception / AFNOR Compétences
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Sobriété numérique et éco-conception',
  'Catalogue actif. Formation dédiée à la sobriété numérique, à l’écoconception et à l’évaluation des impacts environnementaux des projets numériques.',
  'https://competences.afnor.org/formations/sobriete-numerique-et-eco-conception',
  'AFNOR Compétences'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Sobriété numérique et éco-conception');

-- Parcours certifiant Acheteur / ORSYS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Parcours certifiant Acheteur',
  'Catalogue actif. Parcours certifiant couvrant sourcing, RFI/RFP/RFQ, segmentation fournisseurs, négociation, KPI achats et pilotage du panel fournisseurs.',
  'https://www.orsys.fr/formation-cycle-certifiant-acheteur.html',
  'ORSYS'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Parcours certifiant Acheteur');

-- Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats / ORSYS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats',
  'Catalogue actif. Formation centrée gestion contractuelle, analyse des clauses, risques, gouvernance de l’exécution contractuelle et pilotage des engagements.',
  'https://www.orsys.fr/formation/formation-contract-management-mettre-en-oeuvre',
  'ORSYS'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats');

-- Concevoir et piloter son plan marketing digital / ORSYS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Concevoir et piloter son plan marketing digital',
  'Catalogue actif. Formation de marketing digital couvrant plan marketing, visibilité, communication digitale, indicateurs et valorisation des offres.',
  'https://www.orsys.fr/formation/formation-concevoir-piloter-son-plan-marketing-digital.html',
  'ORSYS'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Concevoir et piloter son plan marketing digital');

-- Plans de continuité des activités critiques de l'entreprise / ORSYS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Plans de continuité des activités critiques de l''entreprise',
  'Catalogue actif. Formation sur PCA/PRA, BIA, stratégie de continuité, analyse des risques, gouvernance et gestion de crise.',
  'https://www.orsys.fr/formation-plan-secours-continuite.html',
  'ORSYS'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Plans de continuité des activités critiques de l''entreprise');

-- Formation de formateurs / ORSYS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Formation de formateurs',
  'Catalogue actif. Formation destinée aux professionnels amenés à former, avec construction d’objectifs pédagogiques, animation, supports et évaluation.',
  'https://www.orsys.fr/formation-formation-formateurs.html',
  'ORSYS'
WHERE NOT EXISTS (SELECT 1 FROM formation WHERE nom = 'Formation de formateurs');

-- Liaison compétences / Certificat de compétence Architecte d'entreprise et urbaniste des systèmes d'information
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Systèmes d’information et alignement stratégique métier'
WHERE f.nom = 'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception de l''architecture'
WHERE f.nom = 'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Veille technologique'
WHERE f.nom = 'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gouvernance des systèmes d''information'
WHERE f.nom = 'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de l''information et de la connaissance'
WHERE f.nom = 'Certificat de compétence Architecte d''entreprise et urbaniste des systèmes d''information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Mastère Spécialisé Architecte Digital d’Entreprise
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Systèmes d’information et alignement stratégique métier'
WHERE f.nom = 'Mastère Spécialisé Architecte Digital d’Entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception de l''architecture'
WHERE f.nom = 'Mastère Spécialisé Architecte Digital d’Entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Innovation'
WHERE f.nom = 'Mastère Spécialisé Architecte Digital d’Entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Veille technologique'
WHERE f.nom = 'Mastère Spécialisé Architecte Digital d’Entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'Mastère Spécialisé Architecte Digital d’Entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gouvernance des systèmes d''information'
WHERE f.nom = 'Mastère Spécialisé Architecte Digital d’Entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des changements métier'
WHERE f.nom = 'Mastère Spécialisé Architecte Digital d’Entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Architecture en cybersécurité
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement d''une stratégie de sécurité de l''information'
WHERE f.nom = 'Architecture en cybersécurité'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la sécurité de l''information'
WHERE f.nom = 'Architecture en cybersécurité'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Architecture en cybersécurité'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception de l''architecture'
WHERE f.nom = 'Architecture en cybersécurité'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Veille technologique'
WHERE f.nom = 'Architecture en cybersécurité'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Amélioration des processus'
WHERE f.nom = 'Architecture en cybersécurité'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement d''une stratégie pour la qualité des TIC'
WHERE f.nom = 'Architecture en cybersécurité'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement d''une stratégie de sécurité de l''information'
WHERE f.nom = 'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la sécurité de l''information'
WHERE f.nom = 'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Production de la documentation'
WHERE f.nom = 'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Veille technologique'
WHERE f.nom = 'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des problèmes'
WHERE f.nom = 'Certificat de compétence Gestionnaire de la sécurité des données, des réseaux et des systèmes'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Certificat de compétence Analyste Cloud
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Ingénierie des systèmes TIC'
WHERE f.nom = 'Certificat de compétence Analyste Cloud'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception de l''architecture'
WHERE f.nom = 'Certificat de compétence Analyste Cloud'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Déploiement de la solution'
WHERE f.nom = 'Certificat de compétence Analyste Cloud'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Intégration des composants'
WHERE f.nom = 'Certificat de compétence Analyste Cloud'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la sécurité de l''information'
WHERE f.nom = 'Certificat de compétence Analyste Cloud'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des systèmes'
WHERE f.nom = 'Certificat de compétence Analyste Cloud'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Fourniture de services'
WHERE f.nom = 'Certificat de compétence Analyste Cloud'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Microsoft Azure – Administration (AZ-104)
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des systèmes'
WHERE f.nom = 'Microsoft Azure – Administration (AZ-104)'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Ingénierie des systèmes TIC'
WHERE f.nom = 'Microsoft Azure – Administration (AZ-104)'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Déploiement de la solution'
WHERE f.nom = 'Microsoft Azure – Administration (AZ-104)'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Fourniture de services'
WHERE f.nom = 'Microsoft Azure – Administration (AZ-104)'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des problèmes'
WHERE f.nom = 'Microsoft Azure – Administration (AZ-104)'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la sécurité de l''information'
WHERE f.nom = 'Microsoft Azure – Administration (AZ-104)'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des niveaux de service'
WHERE f.nom = 'Microsoft Azure – Administration (AZ-104)'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Certificat de spécialisation Intelligence artificielle
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Science des données et analyse'
WHERE f.nom = 'Certificat de spécialisation Intelligence artificielle'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement prévisionnel'
WHERE f.nom = 'Certificat de spécialisation Intelligence artificielle'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Innovation'
WHERE f.nom = 'Certificat de spécialisation Intelligence artificielle'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Veille technologique'
WHERE f.nom = 'Certificat de spécialisation Intelligence artificielle'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de l''information et de la connaissance'
WHERE f.nom = 'Certificat de spécialisation Intelligence artificielle'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'Certificat de spécialisation Intelligence artificielle'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Formation Data Engineer
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Science des données et analyse'
WHERE f.nom = 'Formation Data Engineer'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de l''information et de la connaissance'
WHERE f.nom = 'Formation Data Engineer'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Ingénierie des systèmes TIC'
WHERE f.nom = 'Formation Data Engineer'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception de l''architecture'
WHERE f.nom = 'Formation Data Engineer'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Fourniture de services'
WHERE f.nom = 'Formation Data Engineer'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la qualité des TIC'
WHERE f.nom = 'Formation Data Engineer'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Formation Data Engineer'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Développeur Full-Stack - Java et Angular
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception des applications'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception et développement d''applications'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Intégration des composants'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Tests'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Déploiement de la solution'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Production de la documentation'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la qualité des TIC'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'Développeur Full-Stack - Java et Angular'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / ITIL® 4 Foundation
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des niveaux de service'
WHERE f.nom = 'ITIL® 4 Foundation'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Fourniture de services'
WHERE f.nom = 'ITIL® 4 Foundation'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des problèmes'
WHERE f.nom = 'ITIL® 4 Foundation'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Support utilisateur'
WHERE f.nom = 'ITIL® 4 Foundation'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Support aux changements'
WHERE f.nom = 'ITIL® 4 Foundation'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la relation client'
WHERE f.nom = 'ITIL® 4 Foundation'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Amélioration des processus'
WHERE f.nom = 'ITIL® 4 Foundation'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Mastère Spécialisé Manager des Systèmes d’Information
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gouvernance des systèmes d''information'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Systèmes d’information et alignement stratégique métier'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des projets et du portefeuille de projets'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la relation client'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des changements métier'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement du personnel'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement d''une stratégie pour la qualité des TIC'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Mise en place d’un plan d’activité'
WHERE f.nom = 'Mastère Spécialisé Manager des Systèmes d’Information'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Gestion de projet informatique
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des projets et du portefeuille de projets'
WHERE f.nom = 'Gestion de projet informatique'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'Gestion de projet informatique'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Planification des produits/services'
WHERE f.nom = 'Gestion de projet informatique'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Gestion de projet informatique'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la relation client'
WHERE f.nom = 'Gestion de projet informatique'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des changements métier'
WHERE f.nom = 'Gestion de projet informatique'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Mise en place d’un plan d’activité'
WHERE f.nom = 'Gestion de projet informatique'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / COBIT® 2019 Foundation, certification ISACA
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gouvernance des systèmes d''information'
WHERE f.nom = 'COBIT® 2019 Foundation, certification ISACA'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Systèmes d’information et alignement stratégique métier'
WHERE f.nom = 'COBIT® 2019 Foundation, certification ISACA'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement d''une stratégie pour la qualité des TIC'
WHERE f.nom = 'COBIT® 2019 Foundation, certification ISACA'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'COBIT® 2019 Foundation, certification ISACA'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la sécurité de l''information'
WHERE f.nom = 'COBIT® 2019 Foundation, certification ISACA'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la qualité des TIC'
WHERE f.nom = 'COBIT® 2019 Foundation, certification ISACA'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Délégué à la protection des données - DPO
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement d''une stratégie de sécurité de l''information'
WHERE f.nom = 'Délégué à la protection des données - DPO'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la sécurité de l''information'
WHERE f.nom = 'Délégué à la protection des données - DPO'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Délégué à la protection des données - DPO'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Production de la documentation'
WHERE f.nom = 'Délégué à la protection des données - DPO'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de l''information et de la connaissance'
WHERE f.nom = 'Délégué à la protection des données - DPO'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Prestation de services de formation'
WHERE f.nom = 'Délégué à la protection des données - DPO'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / UX-PM, niveau 1 : adoption de l'UX, certification
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Expérience utilisateur'
WHERE f.nom = 'UX-PM, niveau 1 : adoption de l''UX, certification'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'UX-PM, niveau 1 : adoption de l''UX, certification'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Conception des applications'
WHERE f.nom = 'UX-PM, niveau 1 : adoption de l''UX, certification'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la relation client'
WHERE f.nom = 'UX-PM, niveau 1 : adoption de l''UX, certification'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Innovation'
WHERE f.nom = 'UX-PM, niveau 1 : adoption de l''UX, certification'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Sobriété numérique et éco-conception
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion du développement durable'
WHERE f.nom = 'Sobriété numérique et éco-conception'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Amélioration des processus'
WHERE f.nom = 'Sobriété numérique et éco-conception'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement d''une stratégie pour la qualité des TIC'
WHERE f.nom = 'Sobriété numérique et éco-conception'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Innovation'
WHERE f.nom = 'Sobriété numérique et éco-conception'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la qualité des TIC'
WHERE f.nom = 'Sobriété numérique et éco-conception'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Parcours certifiant Acheteur
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Achats'
WHERE f.nom = 'Parcours certifiant Acheteur'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des contrats'
WHERE f.nom = 'Parcours certifiant Acheteur'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la relation client'
WHERE f.nom = 'Parcours certifiant Acheteur'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'Parcours certifiant Acheteur'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Parcours certifiant Acheteur'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement des ventes'
WHERE f.nom = 'Parcours certifiant Acheteur'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des contrats'
WHERE f.nom = 'Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la relation client'
WHERE f.nom = 'Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des niveaux de service'
WHERE f.nom = 'Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Production de la documentation'
WHERE f.nom = 'Contract management : mettre en œuvre une stratégie de gestion du risque de ses contrats'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Concevoir et piloter son plan marketing digital
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Marketing numérique'
WHERE f.nom = 'Concevoir et piloter son plan marketing digital'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement des ventes'
WHERE f.nom = 'Concevoir et piloter son plan marketing digital'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la relation client'
WHERE f.nom = 'Concevoir et piloter son plan marketing digital'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identification des besoins'
WHERE f.nom = 'Concevoir et piloter son plan marketing digital'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Innovation'
WHERE f.nom = 'Concevoir et piloter son plan marketing digital'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Mise en place d’un plan d’activité'
WHERE f.nom = 'Concevoir et piloter son plan marketing digital'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Plans de continuité des activités critiques de l'entreprise
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Mise en place d’un plan d’activité'
WHERE f.nom = 'Plans de continuité des activités critiques de l''entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'Plans de continuité des activités critiques de l''entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gouvernance des systèmes d''information'
WHERE f.nom = 'Plans de continuité des activités critiques de l''entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de la sécurité de l''information'
WHERE f.nom = 'Plans de continuité des activités critiques de l''entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des niveaux de service'
WHERE f.nom = 'Plans de continuité des activités critiques de l''entreprise'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Formation de formateurs
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Prestation de services de formation'
WHERE f.nom = 'Formation de formateurs'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Développement du personnel'
WHERE f.nom = 'Formation de formateurs'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Production de la documentation'
WHERE f.nom = 'Formation de formateurs'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de l''information et de la connaissance'
WHERE f.nom = 'Formation de formateurs'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Support aux changements'
WHERE f.nom = 'Formation de formateurs'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );
