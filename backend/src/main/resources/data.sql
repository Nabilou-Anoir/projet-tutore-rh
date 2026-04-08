
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
    (1, 'Automatisation CI/CD', 'Mise en place et industrialisation des pipelines d’intégration et de déploiement continus pour les applications.', 'Intermédiaire', 1),
    (2, 'Développement d''applications web', 'Conception et développement d’applications web front-end et back-end adaptées aux besoins métiers.', 'Avancé', 1),
    (3, 'Conception d''architectures applicatives', 'Conception d’architectures logicielles robustes, modulaires et interopérables pour les applications.', 'Avancé', 2),
    (4, 'Conception d''architectures cloud', 'Conception d’architectures techniques s’appuyant sur des services cloud de manière sécurisée et évolutive.', 'Intermédiaire', 2),
    (5, 'Intégration et transformation de données', 'Mise en œuvre de flux d’extraction, de transformation et de chargement de données pour alimenter les usages métiers.', 'Intermédiaire', 3),
    (6, 'Visualisation et restitution de données', 'Conception de tableaux de bord, indicateurs et représentations visuelles pour faciliter l’analyse et la décision.', 'Notions', 3),
    (7, 'Conception centrée utilisateur en santé', 'Application des principes de conception centrée utilisateur aux outils et services numériques du secteur de la santé.', 'Intermédiaire', 4),
    (8, 'Accessibilité numérique', 'Prise en compte des exigences d’accessibilité numérique et de conception inclusive dans les services numériques.', 'Notions', 4),
    (9, 'Protection des données de santé et RGPD', 'Maîtrise des principes de protection des données personnelles et de leur application au contexte de la santé.', 'Avancé', 5),
    (10, 'Conduite d''audits de conformité', 'Préparation, réalisation et suivi d’audits de conformité réglementaire et organisationnelle liés aux systèmes d’information.', 'Intermédiaire', 5),
    (11, 'Sécurité applicative', 'Prise en compte des exigences de sécurité dans la conception, le développement et l’évolution des applications.', 'Avancé', 6),
    (12, 'Supervision de la sécurité du SI', 'Surveillance des événements de sécurité, détection d’incidents et suivi opérationnel de la sécurité du système d’information.', 'Intermédiaire', 6),
    (13, 'Administration d''infrastructures cloud', 'Administration, configuration et maintien en condition opérationnelle d’environnements d’infrastructure cloud.', 'Intermédiaire', 7),
    (14, 'Administration de bases de données', 'Administration, sécurisation, supervision et maintien de bases de données nécessaires aux applications critiques.', 'Avancé', 7),
    (15, 'Pilotage de projets numériques en santé', 'Organisation, coordination et suivi de projets numériques dans le contexte des établissements et services de santé.', 'Intermédiaire', 8),
    (16, 'Déploiement de solutions logicielles en établissement de santé', 'Préparation, installation, paramétrage et accompagnement du déploiement de solutions logicielles en contexte hospitalier ou médico-social.', 'Avancé', 8),
    (17, 'Interopérabilité des systèmes de santé', 'Capacité à concevoir, organiser et sécuriser les échanges d’informations entre applications et systèmes du domaine sanitaire et médico-social.', 'Avancé', 3),
    (18, 'Standards d’échange de données de santé', 'Connaissance et mise en œuvre des principaux standards et cadres d’interopérabilité du secteur de la santé, tels que HL7, FHIR, DICOM ou les référentiels nationaux.', 'Intermédiaire', 3),
    (19, 'Gestion des flux inter-applicatifs', 'Capacité à concevoir, superviser et fiabiliser les flux de données entre applications, interfaces et services du système d’information.', 'Avancé', 3),
    (20, 'Gouvernance des données', 'Capacité à définir les règles de gestion, de qualité, de sécurité, de responsabilité et de valorisation des données dans l’organisation.', 'Avancé', 3),
    (21, 'Qualité des données', 'Capacité à mesurer, contrôler et améliorer la fiabilité, la complétude, la cohérence et l’exploitabilité des données.', 'Intermédiaire', 3),
    (22, 'Gestion des référentiels de données', 'Capacité à structurer, maintenir et faire évoluer des référentiels de données partagés, cohérents et utilisables par plusieurs applications ou métiers.', 'Intermédiaire', 3),
    (23, 'Gestion de l’identité patient', 'Capacité à gérer les identités des usagers dans le système d’information en garantissant unicité, fiabilité, traçabilité et bonne circulation de l’information.', 'Avancé', 5),
    (24, 'Identitovigilance', 'Capacité à prévenir, détecter et corriger les erreurs d’identification des patients ou usagers dans les outils numériques de santé.', 'Intermédiaire', 5),
    (25, 'Référentiel national d’identité de santé (INS)', 'Maîtrise des principes d’usage et d’intégration de l’Identité Nationale de Santé dans les processus et systèmes numériques de santé.', 'Intermédiaire', 5),
    (26, 'Analyse d’impact sur la protection des données', 'Capacité à préparer, conduire et exploiter une analyse d’impact relative à la protection des données dans le cadre d’un projet ou d’un traitement sensible.', 'Intermédiaire', 5),
    (27, 'Gestion des habilitations et des accès', 'Capacité à définir, attribuer, contrôler et réviser les droits d’accès aux applications, données et services selon les rôles et responsabilités.', 'Avancé', 6),
    (28, 'Gestion des incidents de sécurité', 'Capacité à détecter, qualifier, traiter et suivre les incidents de sécurité du système d’information en lien avec les acteurs concernés.', 'Avancé', 6),
    (29, 'Plan de continuité et de reprise d’activité (PCA/PRA)', 'Capacité à concevoir, maintenir et mettre en œuvre des dispositifs assurant la continuité ou la reprise des services numériques en cas d’incident majeur.', 'Intermédiaire', 6),
    (30, 'Gestion des incidents', 'Capacité à prendre en charge, qualifier, suivre et résoudre les incidents techniques ou fonctionnels afin de rétablir le service dans les meilleurs délais.', 'Intermédiaire', 7),
    (31, 'Gestion des niveaux de service (SLA)', 'Capacité à définir, suivre et améliorer les engagements de service entre les équipes SI, les métiers et les prestataires.', 'Intermédiaire', 7),
    (32, 'Support utilisateur', 'Capacité à accompagner les utilisateurs dans l’usage des outils numériques, à répondre à leurs difficultés et à contribuer à l’amélioration de l’expérience de service.', 'Intermédiaire', 7),
    (33, 'Formation des utilisateurs', 'Capacité à concevoir, organiser et animer des actions de formation pour faciliter l’appropriation des outils numériques par les utilisateurs.', 'Intermédiaire', 8),
    (34, 'Conduite du changement', 'Capacité à préparer, accompagner et sécuriser l’adoption des transformations numériques par les équipes, les métiers et les utilisateurs.', 'Avancé', 8),
    (35, 'Communication projet', 'Capacité à organiser, adapter et diffuser une communication claire autour d’un projet SI auprès des différentes parties prenantes.', 'Intermédiaire', 8),
    (36, 'Qualité des systèmes d’information', 'Capacité à définir, suivre et améliorer les critères, indicateurs et pratiques permettant d’assurer la qualité des services et solutions numériques.', 'Intermédiaire', 8),
    (37, 'Pilotage de la performance SI', 'Capacité à suivre, analyser et piloter la performance du système d’information à l’aide d’indicateurs de qualité, d’usage, de coût, de disponibilité ou de satisfaction.', 'Intermédiaire', 8);
ALTER TABLE competence ALTER COLUMN id RESTART WITH 40;

-- ===================== COMPLEMENTS ANAP / SANTE NUMERIQUE =====================
INSERT INTO competence(id, nom, description, niveau_attendu, domaine_id) VALUES
    (38, 'Archivage des données informatiques', 'Capacité à définir, organiser et mettre en œuvre les règles d’archivage, de conservation, de traçabilité et de restitution des données et documents numériques.', 'Intermédiaire', 5),
    (39, 'Pilotage de l’exploitation des systèmes, réseaux et applications', 'Capacité à organiser, superviser et améliorer l’exploitation courante des systèmes, réseaux et applications en garantissant disponibilité, qualité de service et continuité.', 'Avancé', 7),
    (40, 'Préparation, installation et configuration des systèmes, réseaux et applications', 'Capacité à préparer, installer, paramétrer et mettre en service des composants techniques ou applicatifs dans le respect des exigences de sécurité, d’interopérabilité et de qualité.', 'Intermédiaire', 7),
    (41, 'Tests et analyse des performances', 'Capacité à préparer, exécuter et analyser des tests techniques, fonctionnels ou de performance afin de valider le bon fonctionnement et la robustesse des solutions.', 'Intermédiaire', 7),
    (42, 'Maintenance corrective, évolutive et préventive du SI', 'Capacité à assurer la maintenance des composants du système d’information afin de corriger les anomalies, faire évoluer les solutions et prévenir les défaillances.', 'Avancé', 7),
    (43, 'Qualification des demandes d’assistance utilisateur', 'Capacité à recueillir, qualifier, prioriser et orienter les demandes d’assistance ou incidents utilisateurs pour en assurer un traitement adapté.', 'Intermédiaire', 7),
    (44, 'Audit et contrôle de la sécurité du SI', 'Capacité à évaluer le niveau de sécurité du système d’information, à contrôler l’application des règles de sécurité et à formuler des actions correctives.', 'Avancé', 6),
    (45, 'Sauvegarde des données et dispositifs de secours', 'Capacité à définir, mettre en œuvre et contrôler les mécanismes de sauvegarde, de restauration et de secours nécessaires à la résilience du système d’information.', 'Intermédiaire', 6);

-- ============================================================
-- RÉFÉRENTIEL MÉTIERS SI (Source principale : Cigref 2022)
-- Régénéré avec :
-- 1) intitulés normalisés selon la nomenclature Cigref 2022
-- 2) activités tronquées complétées depuis le PDF source
-- 3) séparation activités / livrables / KPI
-- 4) conservation des associations métiers-compétences existantes
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


INSERT INTO famille_si (nom, description, ordre) VALUES ('Pilotage, organisation et gestion des évolutions du système d’information', 'Cette famille regroupe les métiers qui touchent de manière globale à la mise en cohérence organisationnelle et fonctionnelle du ou des SI. La plupart de ces métiers travaillent avec les directions métiers dans le respect des orientations stratégiques et ambitions de l''entreprise.', 1);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Management de projet', 'Cette famille regroupe les métiers qui pilotent, suivent et coordonnent les projets de développement, déploiement, infrastructure ou méthode informatique, risques etc. Ces métiers organisent les travaux, la gestion des ressources et la communication.', 2);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Cycle de vie des applications', 'Cette famille regroupe les métiers liés à la conception, au développement et à la réalisation technique et applicative des projets. Ces métiers n''interviennent pas sur l''organisation des SI mais sur les briques mises en œuvre pour intégrer, concevoir et maintenir les solutions IT.', 3);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Mise à disposition et maintenance en condition opérationnelle des infrastructures', 'Cette famille regroupe les métiers liés à l''étude, la conception, le développement, l''intégration et l''exploitation des infrastructures. Elle comprend aussi les métiers liés au support IT interne à la DSI.', 4);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Support et assistance aux utilisateurs', 'Cette famille regroupe les métiers tournés vers l''utilisateur ou usager du SI en termes d''assistance et d''accompagnement.', 5);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Sécurité', 'Cette famille regroupe les métiers liés à la définition, à l’expertise, à l’audit, à la mise en place et au contrôle concernant la sécurité et la cybersécurité des systèmes d’information.', 6);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Management opérationnel', 'Cette famille regroupe les métiers à responsabilité hiérarchique en termes de ressources humaines, de budget, de décision ou de périmètre.', 7);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Données', 'Cette famille regroupe les métiers liés au cycle de gestion de la donnée.', 8);
INSERT INTO famille_si (nom, description, ordre) VALUES ('Relations fournisseurs', 'Cette famille regroupe les métiers liés à la relation avec les fournisseurs en matière d’achats, de gestion des contrats ou de gestion des licences.', 9);
INSERT INTO competence_si (nom, description) VALUES ('Systèmes d’information et alignement stratégique métier', 'Capacité à aligner la stratégie du système d’information sur les objectifs métier, à anticiper les besoins de l’organisation et à orienter les choix structurants du SI.' );
INSERT INTO competence_si (nom, description) VALUES ('Expérience utilisateur', 'Capacité à concevoir des services et interfaces utiles, utilisables et accessibles, en prenant en compte les besoins, usages et attentes des utilisateurs.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion des niveaux de service', 'Capacité à définir, piloter et améliorer les niveaux de service attendus, en cohérence avec les besoins des utilisateurs et les engagements de qualité.' );
INSERT INTO competence_si (nom, description) VALUES ('Mise en place d’un plan d’activité', 'Capacité à construire un plan d’activité ou de transformation, à analyser les scénarios possibles et à organiser les moyens nécessaires à sa mise en œuvre.' );
INSERT INTO competence_si (nom, description) VALUES ('Planification des produits/services', 'Capacité à planifier l’évolution d’un produit ou d’un service numérique, à organiser les priorités et à coordonner les étapes de réalisation et de livraison.' );
INSERT INTO competence_si (nom, description) VALUES ('Conception de l''architecture', 'Capacité à définir une architecture cible cohérente, évolutive, sécurisée et interopérable pour les applications, données, infrastructures et services numériques.' );
INSERT INTO competence_si (nom, description) VALUES ('Conception des applications', 'Capacité à analyser les besoins et à concevoir les structures fonctionnelles et techniques d’une application en garantissant qualité, sécurité et maintenabilité.' );
INSERT INTO competence_si (nom, description) VALUES ('Veille technologique', 'Capacité à repérer, analyser et diffuser les évolutions technologiques, méthodologiques ou réglementaires utiles à l’organisation et à ses projets.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion du développement durable', 'Capacité à intégrer les enjeux environnementaux, sociaux et économiques dans les choix numériques, les usages, les achats et l’évolution du système d’information.' );
INSERT INTO competence_si (nom, description) VALUES ('Innovation', 'Capacité à identifier, proposer et expérimenter des solutions nouvelles créatrices de valeur pour l’organisation, ses métiers et ses utilisateurs.' );
INSERT INTO competence_si (nom, description) VALUES ('Conception et développement d''applications', 'Capacité à réaliser, faire évoluer et maintenir des applications en traduisant les besoins fonctionnels en composants logiciels fiables, performants et sécurisés.' );
INSERT INTO competence_si (nom, description) VALUES ('Intégration des composants', 'Capacité à assembler, paramétrer et faire fonctionner ensemble des composants logiciels, applicatifs ou techniques dans un environnement cohérent.' );
INSERT INTO competence_si (nom, description) VALUES ('Tests', 'Capacité à définir, organiser et exécuter les tests nécessaires pour vérifier la conformité, la qualité, la performance et la non-régression des solutions.' );
INSERT INTO competence_si (nom, description) VALUES ('Déploiement de la solution', 'Capacité à préparer, organiser et réaliser la mise en production d’une solution en sécurisant l’installation, la configuration, la reprise et la transition.' );
INSERT INTO competence_si (nom, description) VALUES ('Production de la documentation', 'Capacité à produire, structurer et maintenir une documentation claire, fiable et exploitable pour les équipes techniques, métiers et utilisateurs.' );
INSERT INTO competence_si (nom, description) VALUES ('Ingénierie des systèmes TIC', 'Capacité à concevoir, mettre en œuvre et faire évoluer des systèmes techniques complexes en garantissant cohérence, disponibilité, performance et sécurité.' );
INSERT INTO competence_si (nom, description) VALUES ('Support utilisateur', 'Capacité à assister les utilisateurs, à qualifier leurs demandes, à résoudre les incidents et à contribuer à l’amélioration continue du service rendu.' );
INSERT INTO competence_si (nom, description) VALUES ('Support aux changements', 'Capacité à préparer, encadrer et sécuriser les changements techniques ou fonctionnels afin de limiter les impacts sur les services et les utilisateurs.' );
INSERT INTO competence_si (nom, description) VALUES ('Fourniture de services', 'Capacité à exploiter et maintenir les services numériques dans la durée en garantissant disponibilité, continuité, sécurité et respect des engagements.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion des problèmes', 'Capacité à analyser les causes profondes des incidents, à mettre en œuvre des actions correctives durables et à prévenir leur réapparition.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion des systèmes', 'Capacité à administrer, superviser et maintenir les systèmes techniques afin d’assurer leur bon fonctionnement, leur sécurité et leur performance.' );
INSERT INTO competence_si (nom, description) VALUES ('Développement d''une stratégie de sécurité de l''information', 'Capacité à définir une stratégie de sécurité cohérente avec les enjeux métier, les risques, la réglementation et les exigences de protection des données.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion de l''information et de la connaissance', 'Capacité à organiser, partager, capitaliser et valoriser l’information et les connaissances utiles au pilotage, aux projets et aux activités du SI.' );
INSERT INTO competence_si (nom, description) VALUES ('Identification des besoins', 'Capacité à recueillir, analyser, clarifier et formaliser les besoins des parties prenantes afin de proposer des réponses adaptées et réalistes.' );
INSERT INTO competence_si (nom, description) VALUES ('Développement d''une stratégie pour la qualité des TIC', 'Capacité à définir, piloter et améliorer une politique qualité applicable aux services, projets, processus et solutions numériques.' );
INSERT INTO competence_si (nom, description) VALUES ('Prestation de services de formation', 'Capacité à concevoir, organiser et animer des actions de formation ou de montée en compétence adaptées aux publics visés.' );
INSERT INTO competence_si (nom, description) VALUES ('Achats', 'Capacité à préparer, conduire et suivre les achats numériques en tenant compte des besoins, des contraintes budgétaires, contractuelles et réglementaires.' );
INSERT INTO competence_si (nom, description) VALUES ('Développement des ventes', 'Capacité à promouvoir une offre de services, à en expliciter la valeur et à accompagner les parties prenantes dans son adoption.' );
INSERT INTO competence_si (nom, description) VALUES ('Marketing numérique', 'Capacité à définir et mettre en œuvre des actions de communication et de valorisation des services numériques auprès des publics cibles.' );
INSERT INTO competence_si (nom, description) VALUES ('Science des données et analyse', 'Capacité à collecter, préparer, analyser et interpréter des données afin de produire des indicateurs, des analyses et des éléments utiles à la décision.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion des contrats', 'Capacité à élaborer, suivre et piloter les contrats, engagements et relations avec les fournisseurs ou partenaires dans la durée.' );
INSERT INTO competence_si (nom, description) VALUES ('Développement du personnel', 'Capacité à identifier les besoins de montée en compétence, à accompagner les parcours et à favoriser le développement professionnel des collaborateurs.' );
INSERT INTO competence_si (nom, description) VALUES ('Développement prévisionnel', 'Capacité à anticiper les évolutions d’activité, de compétences, de ressources ou de capacités nécessaires au regard des besoins futurs.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion des projets et du portefeuille de projets', 'Capacité à planifier, piloter et coordonner des projets ou un portefeuille de projets en maîtrisant priorités, ressources, coûts, délais et risques.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion des risques', 'Capacité à identifier, évaluer, hiérarchiser et traiter les risques susceptibles d’affecter les projets, les services, les données ou la sécurité.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion de la relation client', 'Capacité à établir, maintenir et développer une relation de confiance avec les métiers, utilisateurs, partenaires ou clients internes et externes.' );
INSERT INTO competence_si (nom, description) VALUES ('Amélioration des processus', 'Capacité à analyser les processus existants, à détecter les points de progrès et à mettre en œuvre des améliorations mesurables et durables.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion de la qualité des TIC', 'Capacité à définir, suivre et améliorer les critères, indicateurs et pratiques permettant d’assurer la qualité des services et solutions numériques.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion des changements métier', 'Capacité à accompagner les transformations organisationnelles et fonctionnelles induites par les projets numériques et à en sécuriser l’appropriation.' );
INSERT INTO competence_si (nom, description) VALUES ('Gestion de la sécurité de l''information', 'Capacité à mettre en œuvre, contrôler et faire évoluer les mesures de sécurité nécessaires à la protection des systèmes, des accès et des données.' );
INSERT INTO competence_si (nom, description) VALUES ('Gouvernance des systèmes d''information', 'Capacité à définir les règles, responsabilités, décisions et mécanismes de pilotage permettant d’orienter durablement le système d’information.' );

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Consultant en systèmes d’information', 'Il anticipe et fait mûrir les nouveaux projets par une sensibilisation à l’apport des technologies et une analyse prospective des processus métiers. Il assiste la maîtrise d’ouvrage pour la définition des besoins et des solutions à mettre en œuvre, dans un souci de meilleure intégration dans le système d’information d’entreprise.', 'Il anticipe et fait mûrir les nouveaux projets par une sensibilisation à l’apport des technologies et une analyse prospective des processus métiers. Il assiste la maîtrise d’ouvrage pour la définition des besoins et des solutions à mettr...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Consultant en systèmes d’information' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil en système d’information — Conseille sur l''optimisation de l’utilisation des outils et des systèmes en place.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil en système d’information — Informe et sensibilise la direction générale (DG) et les directions métiers aux technologies et aux apports des technologies de l’information.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assistance aux métiers ou au maître d''ouvrage — Effectue des prescriptions et recommandations pour le développement et la mise en œuvre d’un projet ou d’une solution.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assistance aux métiers ou au maître d''ouvrage — Participe à la définition des spécifications générales des projets.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assistance aux métiers ou au maître d''ouvrage — Vérifie la cohérence de l’architecture applicative et fonctionnelle et de son évolution.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assistance aux métiers ou au maître d''ouvrage — Participe à l''évaluation et au choix d’un progiciel.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assistance aux métiers ou au maître d''ouvrage — Assiste les métiers ou la maîtrise d’ouvrage pour le développement de l’informatique de service.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assistance aux métiers ou au maître d''ouvrage — Effectue des préconisations sur le management dans le cadre de l’accompagnement d’un projet.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assistance aux métiers ou au maître d''ouvrage — Participe à la conception du plan d’accompagnement.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Note d''opportunité/fiche d''émergence (permet de connaître s''il est opportun de lancer le projet).', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Note de cadrage.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Dossier de pré-étude.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Spécifications générales.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Dans un temps raisonnable — Le nombre de sollicitations par les métiers.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Dans un temps raisonnable — Le nombre de réponses apportées par rapport aux questions posées par les métiers.', NULL, 2002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception des applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des changements métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
-- Parcours professionnel : Bac + 5 avec plus de 10 ans d’expériences expériences diversifiées type projets côté Métier ou dans l’IT, ou une expérience conseil junior dans le marché du numérique et le domaine Métier de l’entreprise. Une bonne connaissance des métiers de l''entreprise et des usages qu''elle fait du système d''information est donc nécessaire.
-- Tendances et facteurs d’évolution : Métier situé à la jonction de la maîtrise d’ouvrage et de la maîtrise d’œuvre, qui tend à accueillir des professionnels bénéficiant d’une double compétence (métier et informatique) et capables de répondre aux besoins d’évolution accélérée des systèmes d’information. Métier qui peut évoluer vers les métiers d''interface avec les directions métiers comme l''architecte d''entreprise et le responsable SI Métier.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Urbaniste des systèmes d’information', 'Il garantit l’évolution cohérente de l’ensemble du système d’information dans le respect des objectifs de l’entreprise, du domaine fonctionnel et des contraintes externes et internes (de risques, de coûts, de délais…) et en exploitant au mieux les possibilités de l’état de l’art en relation avec l’architecture technique.', 'Il garantit l’évolution cohérente de l’ensemble du système d’information dans le respect des objectifs de l’entreprise, du domaine fonctionnel et des contraintes externes et internes (de risques, de coûts, de délais…) et en exploitant au...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Urbaniste des systèmes d’information' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception du système d’information (SI) — Gère (construction, mise à jour et évolution) la cartographie du système d’information ou du sous ensemble du système d’information dont il a la charge.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception du système d’information (SI) — Garantit l''intégrité permanente de la cartographie du SI en regard du schéma directeur.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception du système d’information (SI) — Spécifie et valide les standards et référentiels d''urbanisation du SI.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception du système d’information (SI) — Propose des scénarios d’évolution et de simplification du système d’information en tenant compte des problématiques de décision de gestion, d''évolution de l’offre, d''évolution des besoins, des contraintes d''organisation, etc.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la cohérence du système d’information — Évalue la pertinence et la cohérence des projets par rapport à l’architecture cible et aux systèmes existants (par des études d’opportunité, de définition des besoins, de choix d’architecture du système fonctionnel etc.).', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Promeut par des actions de conseil et de communication la cartographie du système d’information auprès des directions métiers et de la DG.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Travaille en relation étroite et permanente avec, d''une par les directeurs métiers, d''autre par les responsables des domaines fonctionnels et techniques du SI.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : La cartographie du système d''information.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Plans et scénarios d''évolution du SI.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Études d''opportunité.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure de l''agilité et de la réactivité du système d’information à un changement donné (délai de prise en compte des évolutions fonctionnelles du SI suite aux demandes métiers).', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
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
-- Parcours professionnel : Bac + 5 ingénieur, d’origine « études » avec soit au minimum 10 ans dans les domaines de la conduite de projet et la mise en place réussie de systèmes dans plusieurs domaines fonctionnels, soit issu d''un cursus spécialisé en urbanisme.
-- Tendances et facteurs d’évolution : Ce métier suit la complexification et la rapidité d’évolution des systèmes aussi bien sur un plan technique que fonctionnel et organisationnel. Il requiert une capacité à pouvoir intégrer dans le système d’information des éléments exogènes (SaaS, Cloud, progiciels, plates-formes de convergence…) et de plus en plus interdépendants. Il nécessite aussi d''avoir une bonne compréhension des enjeux de la sécurité et une bonne maîtrise du risque de perte d’intégrité du système d’information (SI) dans un contexte d’accélération des évolutions (techniques, concurrentielles, organisationnelles…). C’est un métier qui doit de plus en plus savoir s’adapter en permanence aux évolutions réglementaires, juridiques et fonctionnelles qui sont de plus en plus fréquentes.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable du système d’information « métier »', 'Il pilote l’alignement du système d’information du métier sur les orientations stratégiques et sur les processus métiers. Il propose des scénarios d’évolution du système d’information cohérents avec les objectifs et les processus définis. Il garantit la cohérence globale et dynamique ainsi que la pertinence et la performance du SI du Métier.', 'Il pilote l’alignement du système d’information du métier sur les orientations stratégiques et sur les processus métiers. Il propose des scénarios d’évolution du système d’information cohérents avec les objectifs et les processus définis...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable du système d’information « métier »' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage stratégique — Contribue à l’optimisation des processus métiers, des données, des applications et des systèmes associés (détection d’opportunités…).', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage stratégique — Participe au pilotage de la performance, notamment économique du SI.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage stratégique — Promeut par des actions de conseil et de communication la cartographie du système d’information comme un outil d’aide à la décision et au pilotage de la performance.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage stratégique — Anticipe les changements et leurs impacts métiers sur le SI, et réciproquement.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage stratégique — Est responsable de la gestion du budget d''informatisation de son domaine.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration du SI — Formalise, consolide et fait évoluer la cartographie générale du système d’information en', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'o Les référentiels des informations de base et communes du métier — Les architectures fonctionnelles du SI (existant/cible).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'o Les référentiels des informations de base et communes du métier — Participe à l''administration du système d’information en termes de référentiels, règles, démarches, méthodologies, objets métier, et outils.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité et conduite de projet — Évalue la cohérence unitaire et globale (portefeuille) des projets par rapport au système d’information (existant/cible).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité et conduite de projet — Consolide les écarts en termes de délais, de coûts ou de qualité.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Capitalise l’ensemble des connaissances sur le système d’information du métier — Garantit la qualité de la conduite de projet.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Capitalise l’ensemble des connaissances sur le système d’information du métier — Gère la cartographie des compétences nécessaires à l’évolution du SI.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : L''ensemble des PV de recette planifiés.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Le suivi de portefeuille de projets.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de demandes d''évolution ou de corrections.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Degré de satisfaction du client.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Niveau de disponibilité des systèmes.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Tenue des budgets.', NULL, 2004);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement du personnel' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
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
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 10);
-- Parcours professionnel : Bac + 5 école d''ingénieur en informatique avec expérience de 10 ans minimum en management dans un ou plusieurs domaines de l’entreprise et ayant piloté des projets informatiques soit en tant que maîtrise d’ouvrage, soit en tant que maîtrise d’œuvre. Il possède une double compétence Métier et SI nécessaire à la maîtrise de son domaine.
-- Tendances et facteurs d’évolution : Ce métier suit la complexification et la rapidité d’évolution des systèmes aussi bien sur un plan technique que fonctionnel. Il nécessite la capacité à pouvoir intégrer dans le SI des éléments exogènes (SaaS, Cloud, progiciels, plates-formes de convergence…) et de plus en plus interdépendants. De plus en plus orienté vers la recherche de l’amélioration de la qualité des relations entre les métiers, la MOA (quand elle existe) et la MOE. Ce métier est également associé au développement des démarches d’urbanisation fonctionnelles dans le pilotage du SI.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Gestionnaire d’applications', 'Il a pour objectif d’améliorer la performance, de contribuer au fonctionnement et de participer à la gestion et à l’évolution du système d’information du Métier. Il s''assure de la mise en cohérence du SI Métier avec les orientations, les modes de fonctionnement et les processus définis au niveau du Métier.', 'Il a pour objectif d’améliorer la performance, de contribuer au fonctionnement et de participer à la gestion et à l’évolution du système d’information du Métier. Il s''assure de la mise en cohérence du SI Métier avec les orientations, les...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Gestionnaire d’applications' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception d’évolution du système d’information — Représente les métiers ou maîtres d’ouvrage lors de la vie courante des systèmes.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception d’évolution du système d’information — Participe à l’élaboration des règles de fonctionnement et d’utilisation du système d’information.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la construction et à l’utilisation du SI et de son évolution — En proposant des améliorations.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la construction et à l’utilisation du SI et de son évolution — En participant à la gestion des idées et des propositions.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la construction et à l’utilisation du SI et de son évolution — En participant aux projets d’adaptation et d’évolution du SI.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la construction et à l’utilisation du SI et de son évolution — En participant aux recettes opérationnelles.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en œuvre du système d’information — Effectue les actions et processus de gestion courante du système d’information en place dans toutes ses dimensions (assistance, gestion des incidents, qualité de service, contrats, satisfaction, formation…).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en œuvre du système d’information — Participe activement au développement de l’usage du système d’information.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en œuvre du système d’information — Contribue, en cohérence avec la stratégie du métier, à l’évolution des processus et du système d’information. Prête notamment attention, dès l’expression des besoins, à l’exploitabilité du futur système dans toutes ses dimensions (cahier de recette, acceptation, coûts, performance, ergonomie, cohérence fonctionnelle).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité du SI (performance, cohérence, coût, délais…) — Coordonne et anime le réseau des acteurs liés au fonctionnement du SI du métier.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité du SI (performance, cohérence, coût, délais…) — Garantit le maintien de la qualité de fonctionnement d’ensemble et de la performance du système d’information du métier par des actions appropriées (ou des applications dont il a la charge).', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité du SI (performance, cohérence, coût, délais…) — Respecte les règles de fonctionnement et d’utilisation du SI en conformité avec les normes et standards du métier et de l’entreprise, et en accord avec les contrats de service définis.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité du SI (performance, cohérence, coût, délais…) — Est responsable de la documentation (note de cadrage, cahier des charges, guide de procédure…) des applications dont il a la charge.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité du SI (performance, cohérence, coût, délais…) — Est responsable du contrôle et des règles de fonctionnement et d’utilisation des applications dont il a la charge.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité du SI (performance, cohérence, coût, délais…) — Participe à la maîtrise des coûts d’exploitation du système d’information.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Suivi des évolutions de ses systèmes applicatifs.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Indicateurs de performance de(s) l’application(s).', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Documentation applicative.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de demandes d''évolution ou de correction.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Degré de satisfaction du client.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Niveau de disponibilité et de performance des systèmes.', NULL, 2003);
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
-- Parcours professionnel : De Bac + 3 à Bac + 5 en fonction du périmètre avec une forte expérience en SI et une connaissance fonctionnelle et opérationnelle du Métier et du secteur d’activité.
-- Tendances et facteurs d’évolution : Métier polyvalent, cœur dans le SI, en interface avec la plupart des acteurs opérationnels, il devient le garant de la fluidité des flux de données entre les processus métiers. Assez stable jusqu''à présent, ce métier est concerné de plus en plus par les aspects contractuels notamment dans les démarches liées au SaaS dont il en porte les évolutions qui vont impacter le Métier.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chargé d’affaires internes', 'Il est l’animateur de la relation contractuelle avec la DSI et représente le client (direction, maîtrise d’ouvrage, utilisateur) auprès des différents services de la DSI et des prestataires externes. Il fédère et anime les relations entre les clients et la DSI. Il met en lumière les dysfonctionnements dans le cadre de ces relations et propose des améliorations aux acteurs du système d’information.', 'Il est l’animateur de la relation contractuelle avec la DSI et représente le client (direction, maîtrise d’ouvrage, utilisateur) auprès des différents services de la DSI et des prestataires externes. Il fédère et anime les relations entr...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chargé d’affaires internes' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Information des métiers « clients » — À l’écoute des métiers, il les informe et conseille sur les services possibles, les formations possibles et prend en compte leurs besoins.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Information des métiers « clients » — Participe à la sensibilisation des utilisateurs aux problèmes de sécurité (sauvegarde, virus…).', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse et contrôle de la qualité de service — Effectue la mesure des indicateurs / qualité de service de la DSI afin de suivre la satisfaction des utilisateurs vis à vis du SI.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse et contrôle de la qualité de service — Analyse les écarts par rapport aux engagements de services (dont coûts et performances) et effectue des demandes d’actions de progrès visant à améliorer la qualité des services.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contractualisation de la relation métiers DSI/client-fournisseur — Élabore et actualise les propositions de services, les devis (qualité, délai, coût), les conventions ou contrats de service (service fourni, facteurs qualité, organisation DSI, organisation et rôle client).', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contractualisation de la relation métiers DSI/client-fournisseur — Organise et prépare des points de fonctionnement mensuels.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contractualisation de la relation métiers DSI/client-fournisseur — Établit des bilans et comptes-rendus sur les activités et prestations fournies aux métiers sur les plans contractuels, économiques et techniques ainsi que sur les aspects d’image.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion du problème « client » — Prend en charge le problème « client » jusqu’à sa résolution.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion du problème « client » — Sollicite à bon escient les centres de compétences concernés.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Nouveaux projets ou chantiers d''amélioration.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : SLA (Service Level Agreement) sur l''établissement du contrat de service avec le métier (le client) et en rend compte (voir dénomination ITIL).', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure de la réactivité par rapport à la demande du client.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : « Chiffre d’affaires ».', NULL, 2002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des niveaux de service' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement des ventes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des contrats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 7);
-- Parcours professionnel : Bac + 3 avec au moins 10 ans d’expérience dans le domaine informatique ou Bac + 5 généraliste mais avec une expérience importante dans l''entreprise et une bonne connaissance de ses domaines fonctionnels.
-- Tendances et facteurs d’évolution : Évolution de carrière intéressante pour les informaticiens souhaitant sortir de la technique pure. Ce profil aussi permet d''évoluer vers des fonctions managériales ou commerciales et marketing. Le contenu de ce profil évolue en raison de : • La complexité technique croissante et la diversification de l’offre numérique. • La volonté des clients de maîtriser les coûts, les délais et la qualité des services et de comprendre les incidents et leur conséquence. • La nécessité de faire comprendre aux opérationnels informatiques les enjeux et impacts business d''un service dégradé.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Architecte d’entreprise', 'L’architecte d’entreprise a double dimension : SI et métier. Il garantit la cohérence et l’optimisation des réalisations SI et porte les projets de transformation ainsi que les études et exigences d’architecture du SI. Il assure la cohérence du choix des projets, en termes d’évaluation, de conception et d’implémentation. Il s’assure également que ce choix de projets s’intègre de manière cohérente, efficace et durable et en respectant les standards de l’entreprise (notamment sécurité et maîtrise des risques) dans l’architecture du SI. Il projette, définit et pilote l’évolution de l’architecture du SI dans son ensemble, pour répondre aux besoins des directions métiers, et ceci en cohérence avec la stratégie de l’entreprise. Il porte l’innovation auprès de l’ensemble des parties prenantes de l’entreprise au regard de l’architecture existante du SI..', 'L’architecte d’entreprise a double dimension : SI et métier. Il garantit la cohérence et l’optimisation des réalisations SI et porte les projets de transformation ainsi que les études et exigences d’architecture du SI. Il assure la cohér...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Architecte d’entreprise' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Contribue à l’élaboration du plan stratégique SI.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Contribue aux choix de nouvelles solutions répondant aux besoins de l’entreprise, en cohérence avec les recommandations et solutions en place, et plus globalement avec la stratégie SI.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Effectue une veille technologique du marché et promeut des solutions innovantes adaptées à l’entreprise.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception du SI — Construit et maintient les normes et les principes d’architecture du SI et pilote la documentation idoine et met à jour le référentiel de l’entreprise.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'À partir des stratégies et des besoins des directions Métiers — Analyse, les impacts des nouvelles solutions sur le SI.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'À partir des stratégies et des besoins des directions Métiers — Propose des évolutions pour les différents produits et services Métier.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'À partir des stratégies et des besoins des directions Métiers — Propose des évolutions de l’architecture du SI en tenant compte des différents modèles de services.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'À partir des stratégies et des besoins des directions Métiers — En assurant un SI d’entreprise cohérent et performant, élabore des recommandations pour pouvoir intégrer en toute sécurité de nouvelles solutions SI au sein de l’entreprise.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Amélioration continue — Promeut les orientations liées à l’architecture du SI.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Amélioration continue — De manière pédagogique, faciliter le transfert de connaissance, d’expérience et de bonnes pratiques au sein des équipes responsables de l’architecture du SI.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la connaissance — Communique et partage les principes d’architecture, les standards SI et l’innovation SI avec les communautés des architectes SI.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Le référentiel d’architecture d’entreprise (normes & standards, cartographie, processus, vocabulaire.).', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure de la performance globale de l’architecture du SI (en termes d’agilité, satisfaction utilisateur, innovation, maintenabilité, sécurité, qualité de service, coût…).', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre d’exceptions aux principes d’architectures et de standards.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de personnes formées au référentiel d’architecture.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de personnes certifiées sur certains éléments du référentiel d’architecture.', NULL, 2004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Contribution à l’évolution du Time to market.', NULL, 2005);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Systèmes d’information et alignement stratégique métier' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Amélioration des processus' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 8);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 9);
-- Parcours professionnel : Peut venir de toute fonction ou secteur mais avec une très bonne connaissance des Métiers de l’entreprise et au moins 10 ans d’expérience en architecture et urbanisation.
-- Tendances et facteurs d’évolution : Ce profil est plutôt rare et ses compétences en font un acteur important dans la transformation numérique de l’entreprise. C’est souvent un profil de seconde partie de carrière.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Pilotage, organisation et gestion des évolutions du système d’information' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable green IT', 'Il appréhende l’informatique sous l’angle des enjeux environnementaux, sociaux et économiques pour construire un système d’information (éco)responsable et aider l''entreprise à évoluer vers des modèles plus soutenables grâce au numérique. Il élabore, applique et fait évoluer la stratégie Développement Durable (RSE/CSR) de l’entreprise au niveau du système d’information, en relation avec le Directeur des Système d’Information (DSI/CIO), le Directeur du Développement Durable (DDD/SDO), et le comité exécutif de l’entreprise. Il pilote et anime la stratégie Green IT de l’entreprise.', 'Il appréhende l’informatique sous l’angle des enjeux environnementaux, sociaux et économiques pour construire un système d’information (éco)responsable et aider l''entreprise à évoluer vers des modèles plus soutenables grâce au numérique....', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable green IT' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition de la stratégie Green IT — Clarifie le périmètre du green IT au sein de son organisation et le connecte à sa politique RSE.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition de la stratégie Green IT — Analyse l’impact du système d’information (SI) sur l’environnement et identifie les indicateurs de performance à suivre et publier.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition de la stratégie Green IT — Définit la stratégie green IT de l’entreprise en fonction des priorités.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition de la stratégie Green IT — Décline la stratégie en plan d’actions concrètes et la traduit éventuellement en charte green IT.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition de la stratégie Green IT — Spécifie, valide et met en œuvre les standards et référentiels green IT utilisés par l’entreprise (auprès de la DSI et de l''ensemble des directions de l''entreprise).', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage des projets — Pilote la réalisation et assure la cohérence des projets green IT en relation avec les parties prenantes internes (DSI, DAF, DDD, DHA) et externes (prestataires et partenaires).', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage des projets — Anime et conseille un réseau de collaborateurs investis pour tendre vers un SI plus responsable (filière Numérique Responsable).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage des projets — Propose des innovations techniques, sociétales et environnementales pour améliorer les performances du SI et aider l’entreprise à tendre vers des modèles économiques plus responsables.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage des projets — Gère le suivi des projets à l’aide de tableaux de bord basés sur des indicateurs et des objectifs quantifiés.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage des projets — Prend part à certaines phases techniques des projets lorsqu’elles requièrent une expertise green IT spécifique (ex : conception des applications, tests green, support utilisateurs…).', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication, sensibilisation — Promeut, par des actions de conseil, de sensibilisation et de communication, la démarche Green IT auprès des différentes parties prenantes internes et externes (clients, partenaires, actionnaires, différentes directions concernées).', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication, sensibilisation — Valorise les actions menées via les moyens les plus adaptés.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille et benchmark — Met en place une démarche d''intelligence économique spécifique au green IT dans le but de cibler les opportunités business et de gérer les risques dans un contexte réglementaire évolutif.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille et benchmark — Assure une veille sur l’évolution des normes et de la réglementation et en assure la diffusion aux collaborateurs impactés.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille et benchmark — Recueille et partage les bonnes pratiques et se compare à l''état de l''art pour s''améliorer en continu.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille et benchmark — Transcrit l''apport de l’informatique sur l’impact environnemental (réduction des GES, réduction de consommation de ressources…).', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Stratégie, politique (plan d’actions) et charte Numérique Responsable.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Plan de communication green IT.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Tableau de bord green IT.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Référentiels des bonnes pratiques green IT.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Référentiel d’écoconception logicielle.', NULL, 1005);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Guide des achats responsables et écolabels.', NULL, 1006);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Guide des écogestes.', NULL, 1007);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Paragraphe Numérique Responsable dans le rapport RSE.', NULL, 1008);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure l’impact économique, environnemental, et social des actions entreprises, globalement et par projet.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Suivi d’année en année, par utilisateur et par an, scope 2 et 3 (pour les étapes fabrication et', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : utilisation du cycle de vie) — kWh.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : utilisation du cycle de vie) — Litres d’eau.', NULL, 2004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : utilisation du cycle de vie) — kg CO2 éq. Empreinte carbone.', NULL, 2005);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Mise en place d’un plan d’activité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion du développement durable' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie pour la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prestation de services de formation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de l''information et de la connaissance' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 6);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 7);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 8);
-- Parcours professionnel : Bac + 5 ingénieur informatique + formation développement durable et / ou numérique responsable, avec au minimum 10 ans dans plusieurs métiers opérationnels du système d’information et la supervision de projets. Une sensibilité forte aux problèmes environnementaux et sociaux est nécessaire et une expérience en communication est un plus.
-- Tendances et facteurs d’évolution : Ce métier est récent et apparaît dans les très grandes entreprises et administrations (+ de 2 000 salariés) et dans les filiales de ces entreprises. Ce métier nécessite une très bonne expertise technique dans tous les domaines du système d’information et un tissu relationnel important au niveau des équipes opérationnelles puisqu’il a pour enjeu la prise en compte du Green IT dans l''évolution des usages et des comportements.
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Directeur de projets', 'Il assume la responsabilité fondamentale du ou des projets dans toutes ses dimensions (stratégiques, commerciales, financières, humaines, juridiques, organisationnelles, techniques…). Il pilote l’ensemble du ou des projets dans toute leur complexité (multiplicité des parties prenantes, intérêts souvent divergents…). Il est le garant de l’enjeu stratégique du projet pour le métier, l’entreprise ou des tiers.', 'Il assume la responsabilité fondamentale du ou des projets dans toutes ses dimensions (stratégiques, commerciales, financières, humaines, juridiques, organisationnelles, techniques…). Il pilote l’ensemble du ou des projets dans toute leu...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Directeur de projets' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Direction du projet — Garantit la pertinence et l’opportunité du développement du ou des projets.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Direction du projet — Est responsable de toutes les décisions importantes.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Direction du projet — Valide la recette définitive du ou des projets.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication / animation — Mène toute action pour mener le ou les projets à bonne fin.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication / animation — Gère et anime la communication auprès des équipes et des différentes instances.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication / animation — Prépare et pilote la conduite du changement.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des ressources — Conduit, optimise et est responsable de l''ensemble des ressources du ou des projets (humains, budget, clientèle, décision finale).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des ressources — Est responsable de la gestion financière du ou des projets ainsi que de toutes les exigences définies (qualité, coût, délai…).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Plan de l''organisation du ou des projets qu''il manage.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Reporting Direction sur l''alignement des projets.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Indicateurs qualité/coûts/délais.', NULL, 2001);
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
-- Parcours professionnel : Bac + 5, formation ingénieur avec plus de 10 ans en tant que manager sur des postes nécessitant une vision globale en termes d''organisation, de stratégie, d''enjeux etc. Une expérience en conduite de projets opérationnels complexes est indispensable.
-- Tendances et facteurs d’évolution : Parce qu’il porte de plus en plus la cohérence de la réponse du SI aux Métiers., le directeur de projets « informatique » évolue de plus en plus vers une fonction de directeur de projets Métier de l''entreprise comprenant des lots ou des projets SI.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chef de projet maîtrise d''ouvrage', 'Il définit, met en œuvre et conduit un projet dans le but d''obtenir un résultat optimal et conforme aux exigences métiers formulées et validées par ou pour le commanditaire en ce qui concerne la qualité, les performances, le coût, le délai et la sécurité.', 'Il définit, met en œuvre et conduit un projet dans le but d''obtenir un résultat optimal et conforme aux exigences métiers formulées et validées par ou pour le commanditaire en ce qui concerne la qualité, les performances, le coût, le dél...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chef de projet maîtrise d''ouvrage' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu fonctionnel du projet — Définit les besoins métier, établit les spécifications fonctionnelles générales et rédige précisément le cahier des charges.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu fonctionnel du projet — Participe au choix d''une solution (progiciel, développement.) en relation avec le maître d’œuvre.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu fonctionnel du projet — Prévoit les moyens à mettre en œuvre (humains, techniques, financiers…).', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu fonctionnel du projet — Définit et supervise la réalisation des prototypes et des tests fonctionnels.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet — Organise, coordonne et anime l’équipe de maîtrise d’ouvrage du projet.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet — Arbitre les éventuels différends entre l’équipe et les autres intervenants.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet — Supervise le déroulement du projet.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet — Coordonne, synthétise, et assure la qualité des validations prononcées.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet — Fait circuler et diffuse l’information côté métiers.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet — Est responsable de la totalité des événements survenant dans le projet. Préparation, déploiement du projet, et mise en œuvre des actions d’accompagnement des', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'utilisateurs — Définit la cible utilisateurs.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'utilisateurs — Définit au plus tôt la méthode et les moyens pédagogiques de formation des utilisateurs.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'utilisateurs — Met en œuvre la formation et l’accompagnement des utilisateurs, en fonction de leurs besoins.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'utilisateurs — Définit le service de support à l’utilisateur.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'utilisateurs — Définit les modalités de traitement des demandes d’évolution.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Effectue la recette des réalisations et apprécie leur conformité au cahier des charges de l’ouvrage.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Garantit le respect des délais et des coûts.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Propose au commanditaire, en cours de projet, d’éventuelles modifications d’objectifs (qualité, coût, délai) liées à des contraintes de réalisation ou des modifications d’environnement.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Définit et gère le planning d’avancement du projet.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Arbitre les choix à faire en fonction du risque et du résultat.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Met en place tous les indicateurs nécessaires au suivi et à la gestion du projet, notamment sur l’évaluation de la performance, des coûts et des délais.', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Cahier des charges du projet.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Spécifications générales.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Procès-verbal de recette.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Différentiel notifié dans les procès-verbaux de recettes en ce qui concerne la qualité, les performances, le coût et le délai.', NULL, 2001);
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
-- Parcours professionnel : Bac + 3 avec expérience ou Bac + 5 sans expérience. Attention, le chef de projet maîtrise d’ouvrage représentant les utilisateurs du SI, n’est pas un spécialiste du traitement de l’information.
-- Tendances et facteurs d’évolution : Il accompagne de plus en plus l''accélération de l''évolution du numérique et des besoins de réactivité associés. Il doit être ouvert sur les nouvelles méthodologies de conduite de projet (Scrum, méthodes agiles.). Confiée à un manager expérimenté, cette fonction peut conduire à des postes plus importants tels que celui de directeur de projet ou à des postes opérationnels de la direction métiers pour laquelle il a réalisé le projet. Du fait du rapprochement des fonctions de chef de projet maîtrise d''œuvre et chef de projet maîtrise d''ouvrage, le chef de projet maîtrise d''ouvrage devient de plus en plus un chef de projet Métier et avec le développement de l’agilité en entreprise, et sous réserve d’une formation adaptée, on peut le voir évoluer vers des métiers agiles comme par exemple le Product Owner.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chef de projet maîtrise d’œuvre', 'Il définit, met en œuvre et conduit un projet SI depuis sa conception jusqu''à la réception dans le but d''obtenir un résultat optimal et conforme aux exigences formulées par le chef de projet MOA ou le client métier en ce qui concerne la qualité, les performances, le coût, le délai et la sécurité.', 'Il définit, met en œuvre et conduit un projet SI depuis sa conception jusqu''à la réception dans le but d''obtenir un résultat optimal et conforme aux exigences formulées par le chef de projet MOA ou le client métier en ce qui concerne la ...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chef de projet maîtrise d’œuvre' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu technique du projet — Définit la conception technique et rédige les spécifications techniques détaillées.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu technique du projet — Participe au choix de progiciels, en relation avec le maître d’ouvrage.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu technique du projet — Participe à la réalisation en termes de développements spécifiques ou d''intégration.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Responsabilité du contenu technique du projet — Définit les tests et participe aux recettes.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet sur le terrain — Organise, coordonne et anime l''ensemble de l’équipe de maîtrise d’œuvre du projet.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet sur le terrain — Arbitre les éventuels différends entre l’équipe et les autres intervenants.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet sur le terrain — Supervise le déroulement du projet.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet sur le terrain — Coordonne, synthétise, et assure la qualité des validations prononcées.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet sur le terrain — Fait circuler et diffuse l’information côté maîtrise d’œuvre.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conduite du projet sur le terrain — Gère la relation avec le ou les fournisseurs (depuis la signature du contrat à la validation finale du projet).', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Déploiement technique du projet et mise en œuvre des actions d’accompagnement des utilisateurs — Déploie la nouvelle application ou le nouveau service.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Déploiement technique du projet et mise en œuvre des actions d’accompagnement des utilisateurs — Organise la maintenance.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Déploiement technique du projet et mise en œuvre des actions d’accompagnement des utilisateurs — Participe à la formation des utilisateurs.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Déploiement technique du projet et mise en œuvre des actions d’accompagnement des utilisateurs — Organise du support utilisateur.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Garantit le respect du cahier des charges.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Garantit le respect des délais et des coûts.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garantie de la meilleure adéquation qualité coût délai — Propose au métier ou maître d''ouvrage, en cours de projet, d’éventuelles modifications d’objectifs (qualité, coût, délai) liées à des contraintes de réalisation ou des modifications d’environnement.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Spécifications fonctionnelles détaillées du projet.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Procès-verbal de recette.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Différentiel notifié dans les procès-verbaux de recettes en ce qui concerne la qualité, les performances, le coût et le délai.', NULL, 2001);
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
-- Parcours professionnel : Bac + 3 avec expérience ou Bac + 5 sans expérience. Le chef de projet maîtrise d’œuvre est en général issu, pour un projet à dominante système d’information, de la direction des systèmes d’information.
-- Tendances et facteurs d’évolution : Il accompagne de plus en plus l''accélération de l''évolution du numérique et des besoins de réactivité associés. Il doit être ouvert sur les nouvelles méthodologies de conduite de projet (SCRUM, méthodes agiles.). Confiée à un manager expérimenté, cette fonction peut conduire à des postes plus importants tels que celui de directeur de projet ou à des postes opérationnels de la direction SI pour laquelle il a réalisé le projet. Du fait du rapprochement des fonctions de chef de projet MOE et MOA, le chef de projet MOE devient de plus en plus le chef de projet représentant la DSI auprès des Métiers et comme pour le chef de projet maîtrise d’ouvrage, avec le développement de l’agilité en entreprise, et sous réserve d’une formation adaptée, on peut le voir évoluer vers des métiers agiles comme par exemple le Product Owner.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Coach agile', 'Il promeut les méthodes agiles, est garant des pratiques agiles et les adapte à l’organisation. Il fait en sorte que les équipes agiles deviennent autonomes dans leur fonctionnement. Sur la méthode, il conseille aussi l’organisation pour trouver les pratiques les plus adaptées au contexte.', 'Il promeut les méthodes agiles, est garant des pratiques agiles et les adapte à l’organisation. Il fait en sorte que les équipes agiles deviennent autonomes dans leur fonctionnement. Sur la méthode, il conseille aussi l’organisation pour...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Coach agile' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion du référentiel de pratiques agiles — Définit les pratiques et s’assure de leur déploiement.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion du référentiel de pratiques agiles — Les fait évoluer en fonction des retours des équipes et de l’état de l’art.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coaching et formation — Est en support des équipes agiles avec des méthodes et des outils adaptés à la situation.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coaching et formation — Prépare les formations liées au périmètre agile, définit et met à jour le panel des formations', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'agile, en collaboration avec le département formation — Formations génériques, dans un but de sensibilisation.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'agile, en collaboration avec le département formation — Formations de niveau expert pour l’ensemble des fonctions des équipes agiles.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'agile, en collaboration avec le département formation — Sensibilise et forme l’ensemble des parties prenantes : organise, coordonne et anime l’ensemble des formations agiles au sein de l’organisation.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participation à la constitution des équipes projet agiles — Est force de proposition auprès des membres de l’équipe projet dans sa phase de cadrage.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participation à la constitution des équipes projet agiles — Afin de garantir l’atteinte des objectifs de valeur fixés par le métier, participe activement à la phase de cadrage du projet agile en apportant toute son expérience, notamment pour construire l’équipe la plus adaptée aux besoins et contraintes du projet agile, au niveau des expériences et des compétences requises.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Session d’animation.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Bonnes pratiques.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Déroulé de la méthode.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Définition des indicateurs de mesure et de performance de la méthode.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Apporte des retours d’expérience.', NULL, 1005);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de projets ou d’équipes coachées.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Niveau de maturité des équipes sur des critères autoévalués.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Autonomie acquise des équipes coachées.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Degré de satisfaction des personnes coachées.', NULL, 2004);
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
-- Parcours professionnel : Quelle que soit sa formation initiale, le Coach Agile doit avant tout maîtriser plusieurs méthodes agiles tant sur le plan théorique que sur le plan pratique ainsi que l''intégration continue et le développement piloté par les tests (Test Driven Development - TDD). Le Coach Agile doit donc avoir plusieurs années d’expériences transversales en méthodes et agiles ou en Product Owner et de formation aux méthodes agiles. Il doit maîtriser également le manifeste agile et avoir une expérience aboutie de management de projets de toutes tailles. De par son expérience il possède une forte capacité à convaincre son auditoire des bénéfices liés à l’utilisation des méthodes agiles. Il est aussi pédagogue et diplomate pour être en mesure de dialoguer avec l’exécutif de la DSI et les directions métiers. Son parcours lui aura permis de connaitre les techniques mises en œuvre dans le domaine du développement logiciel et de l’intégration continue. Ceci afin de l''aider à comprendre les équipes de développement, à s''y intégrer, à s''adapter à leur contexte et à dialoguer avec elles.
-- Tendances et facteurs d’évolution : Du fait de son positionnement particulier (manager opérationnel transverse dans l’entreprise), le Coach Agile peut intervenir sur des entités hors de la DSI.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Scrum Master', 'Leader-serviteur de l’équipe Scrum, il s’assure que la méthode Scrum est comprise et mise en œuvre et que les équipes agiles adhèrent à la théorie, aux pratiques et aux règles de Scrum. Il aide les parties externes à l’équipe à bien interagir avec la « Team » DevSecOps. Il aide toutes les parties prenantes à adapter ses interactions avec l’équipe Scrum pour maximiser la valeur créée par son équipe. Il assure l’amélioration continue des équipes Scrum dans leur façon de travailler (créativité, qualité coopération) en faisant preuve d''empathie, de coopération, de transparence, de courage et d’humilité.', 'Leader-serviteur de l’équipe Scrum, il s’assure que la méthode Scrum est comprise et mise en œuvre et que les équipes agiles adhèrent à la théorie, aux pratiques et aux règles de Scrum. Il aide les parties externes à l’équipe à bien inte...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Scrum Master' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Coache et forme en continu les intervenants des équipes sur les pratiques, les principes et les valeurs de l’approche agile et « agile à l’échelle ».', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide au suivi et à la réalisation des activités en mode agile (stories / enabler…).', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide à comprendre la planification de produit dans un contexte empirique.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assiste et conseille le PO dans la qualification des besoins. Il s’assure également que le PO a constitué et gère correctement le Backlog.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la coordination des équipes avec le PO et les parties prenantes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Anime et/ou participe aux cérémonies Scrum.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Aide l’équipe de développement (Dev Team) à s’auto-organiser et développer sa pluridisciplinarité.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maximise la valeur créée par l’équipe de développement.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Identifie et gère les risques de l’équipe de développement.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Identifie et aide à la levée des obstacles à la réalisation des activités.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit, met en place et suit des indicateurs de performance (vélocité, prévisibilité, délivrance du produit, satisfaction des utilisateurs, niveau d’engagement des intervenants, qualité de service …).', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Collabore avec d’autres Scrum Masters pour améliorer l’efficacité de l’utilisation de Scrum dans l’organisation.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : La préparation des cérémonies suivantes — Le sprint.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : La préparation des cérémonies suivantes — La revue de sprint.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : La préparation des cérémonies suivantes — La planification du sprint.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : La préparation des cérémonies suivantes — La rétrospective.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : La préparation des cérémonies suivantes — Le done (équivalent d’une recette incrémentale).', NULL, 1005);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Il n’y a pas d’indicateur spécifique à ce métier.', NULL, 2001);
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
-- Parcours professionnel : Il doit avoir une première expérience dans le pilotage et/ou le management d’équipe. Une expérience de développeur/concepteur peut-être un atout. Il doit avant tout maîtriser les méthodes agiles, tant sur le plan théorique que sur le plan pratique et notamment maîtriser le manifeste agile. Son parcours lui aura permis de connaître les techniques et méthodes agiles comme l’eXtreme Programming, le Kanban, l’intégration continue et le développement conduit par les tests (TDD), ainsi que des modèles d’agilité « à l’échelle » comme SAFe (Scaled Agile Framework), LeSS (Large-Scale Scrum), NEXUS.
-- Tendances et facteurs d’évolution : Le Scrum Master peut évoluer vers le profil métier de Coach Agile.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Product Owner', 'Le Product Owner est en charge de construire la vision métier du produit SI à réaliser et de la transmettre aux équipes de développement agile. Il s''assure que la direction métier prise est la bonne, les priorités respectées suivant un critère de valeur métier, et que la qualité des livrables de chaque cycle agile est en adéquation avec les attentes du métier. Il favorise la communication et la collaboration dans un souci de maximisation de la valeur ajoutée du produit pour les utilisateurs. Il est responsable du Product Backlog (ou carnet du produit).', 'Le Product Owner est en charge de construire la vision métier du produit SI à réaliser et de la transmettre aux équipes de développement agile. Il s''assure que la direction métier prise est la bonne, les priorités respectées suivant un c...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Product Owner' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Référent de la vision métier au sein des équipes agiles — Collabore avec les métiers pour élaborer la vision du produit.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Référent de la vision métier au sein des équipes agiles — Partage cette vision avec les équipes de développement agile.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Référent de la vision métier au sein des équipes agiles — Mène une réflexion stratégique préparatoire des versions à venir.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Priorisation par la valeur du contenu métier — Identifie les fonctionnalités et exigences attendues.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Priorisation par la valeur du contenu métier — Priorise toutes les « user stories » au sein du Product Backlog.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Priorisation par la valeur du contenu métier — Maintient le Product Backlog et cherche en permanence à maximiser la valeur métier pour les utilisateurs.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transmission aux équipes agiles pour une bonne compréhension du besoin métier — Partage sa vision avec les équipes agiles en privilégiant les interactions directes au support formel.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transmission aux équipes agiles pour une bonne compréhension du besoin métier — Découpe chaque fonctionnalité en « user story » pouvant être implémentée en une seule itération.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transmission aux équipes agiles pour une bonne compréhension du besoin métier — Définit les critères d’acceptation indispensables à sa bonne compréhension par les équipes agiles.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transmission aux équipes agiles pour une bonne compréhension du besoin métier — Intègre et suit la prise en compte des exigences non fonctionnelles (ENF : accessibilité, sécurité du SI, RSE, RGPD…) dès les étapes de conception.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transmission aux équipes agiles pour une bonne compréhension du besoin métier — Répond aux demandes de clarification émises par les équipes de développement sur les « user stories » en cours de développement.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transmission aux équipes agiles pour une bonne compréhension du besoin métier — Contribue aux réunions agiles avec les équipes de développement et le Scrum Master.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Recette des éléments métiers produits par l’équipe agile — Réalise ou organise le déroulement des tests utilisateurs/Métier.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Recette des éléments métiers produits par l’équipe agile — Récolte les feedbacks des utilisateurs pour les équipes de développement.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Recette des éléments métiers produits par l’équipe agile — Réalise une analyse des usages pour proposer aux métiers des évolutions du produit.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Reporting — Communique sur l’avancement de la réalisation du produit auprès du management IT et des utilisateurs métiers.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Le livrable principal est le produit livré conformément aux spécifications du client.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Le respect des sprints.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : La vélocité des livraisons.', NULL, 2002);
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
-- Parcours professionnel : Expérience métier et maîtrise d’ouvrage (MOA).
-- Tendances et facteurs d’évolution : Il peut évoluer vers la chefferie de projets, le management d’une entité métier ou vers un poste de responsable produit.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management de projet' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chargé de pilotage SI (PMO)', 'Il assure le suivi du pilotage opérationnel et du reporting de l’activité d’un domaine (stratégique, portefeuille projets, programmes, activités opérationnelles…). Il pilote les plannings prévisionnels d’affectation des ressources, le suivi des réalisations et le budget du projet. Il alerte les responsables de projet en cas d’anomalie par rapport aux prévisions. Il intervient soit directement dans les projets, soit pour le compte d’une direction pour un suivi transversal du portefeuille de projets.', 'Il assure le suivi du pilotage opérationnel et du reporting de l’activité d’un domaine (stratégique, portefeuille projets, programmes, activités opérationnelles…). Il pilote les plannings prévisionnels d’affectation des ressources, le su...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chargé de pilotage SI (PMO)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification — Contribue à l’élaboration du portefeuille de projets, en prenant en compte les contraintes et dépendances des différentes ressources qui doivent être engagées sur les aspects coûts, délais, et compétences pour atteindre la qualité attendue.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des activités et des ressources allouées — Vérifie l’avancement du projet/programme selon les exigences définies (qualité, coût, délai…) et le respect des engagements.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des activités et des ressources allouées — Vérifie l’application de la méthodologie et des bonnes pratiques.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des activités et des ressources allouées — Effectue l’analyse des risques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage du plan projet/programme — Évalue la capacité actuelle et prévisionnelle des ressources et des tâches, en propose l’optimisation et la possible réallocation.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage du plan projet/programme — Propose des ajustements et des replanifications si nécessaire.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi du budget et reporting — Suit et actualise le budget.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi du budget et reporting — Suit les moyens alloués au regard des prévisions (consommés, reste à faire, planning).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi du budget et reporting — Produit le reporting nécessaire au pilotage des directions concernées et à l’élaboration des dashboards.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gouvernance — Il anime le processus d’élaboration des schémas directeurs et le décline en feuille de route.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Un schéma directeur de l’activité.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Les feuilles de route de l’activité et projets.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Les suivis d’avancement et tableau de bord d’indicateurs.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Planning opérationnel.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Planification des charges et ressources.', NULL, 1005);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Analyse de risque de l’activité et des projets/programmes.', NULL, 1006);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Compte-rendu des instances décisionnaires.', NULL, 1007);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure du projet : Planifié vs réalisé.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect des coûts et du budget.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Qualité de l’animation avec les parties prenantes (indice de satisfaction).', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect de la tenue des comités et des comptes-rendus associés à ces comités.', NULL, 2004);
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
-- Parcours professionnel : Manager capable de dialoguer avec des interlocuteurs divers et transverses, avec une bonne connaissance du domaine sur lequel il travaille (vient souvent de l’interne), ce peut-être un chef de projet, un responsable d’unité ou de domaine/secteur.
-- Tendances et facteurs d’évolution : Venant de l’opérationnel, il va plutôt évoluer vers des responsabilités liées aux fonctions de support. Avec l’évolution du Saas qui va orienter l’entreprise vers des projets externes, il risque d’y avoir moins besoin de PMOs pour les projets internes. La conduite du changement et l’accroissement du périmètre et la maîtrise de la complexité devenant clés dans ce métier, les PMOs gérant des projets tendent à disparaître au profit de PMOs gérant des grands programmes. Et ceci d’autant plus que les projets de transformation numérique traitent de projets conséquents avec des composantes et des chantiers transverses qui dépassent le SI.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable des systèmes applicatifs', 'Il assure et coordonne les activités d''évolution et de maintenance corrective et applicative du système dont il est responsable. Il en assure aussi le support de niveau 2 et le conseil dans le respect du contrat de services dans toutes ses composantes (Qualité, sécurité…). Il est aussi le garant du maintien des connaissances fonctionnelles et techniques nécessaires à la pérennité de l’application.', 'Il assure et coordonne les activités d''évolution et de maintenance corrective et applicative du système dont il est responsable. Il en assure aussi le support de niveau 2 et le conseil dans le respect du contrat de services dans toutes s...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable des systèmes applicatifs' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la configuration logicielle — Assiste et conseille sur l’utilisation du système applicatif dont il a la charge.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la configuration logicielle — Vérifie et assure la qualité et la performance du fonctionnement des applications dont il est responsable.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la configuration logicielle — Coordonne la maintenance corrective, préventive et évolutive.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la qualité de la configuration — Applique les normes, méthodes et outils.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la qualité de la configuration — S''assure de la cartographie applicative utilisée dans le cadre du référentiel d''urbanisation.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la qualité de la configuration — Identifie et met à jour le référentiel documentaire du système applicatif dont il est responsable.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la qualité de la configuration — Assure la pérennité des connaissances sur les solutions apportées dans le cadre de la maintenance (KM).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Est l’interlocuteur privilégié de la DSI avec les utilisateurs pour son application.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Est l’interlocuteur privilégié avec la production informatique pour l''application dont il est responsable.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Gestion de configuration du logiciel applicatif à jour.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Temps de résolution des incidents.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Disponibilité de ses applications.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Délai de réalisation des évolutions.', NULL, 2003);
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
-- Parcours professionnel : Bac + 2/3 (BTS ou DUT/BUT) avec 5 ans d''expériences ou ingénieur, avec des expériences acquises en gestion d''applications informatiques.
-- Tendances et facteurs d’évolution : Le passage vers les modèles de service (SaaS notamment) est un facteur d''évolution de ce profil métier vers davantage de gestions de contrats de services. La tendance d''évolution de ce métier va vers l''architecture applicative ou la gestion de contrats (au sens « services »).

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Concepteur / développeur', 'À la demande du Métier, il analyse, paramètre et code les composants logiciels applicatifs dans le respect des évolutions souhaitées, des normes et des procédures.', 'À la demande du Métier, il analyse, paramètre et code les composants logiciels applicatifs dans le respect des évolutions souhaitées, des normes et des procédures.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Concepteur / développeur' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse — Contribue à la définition des spécifications générales.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse — Réalise l''analyse technique et l’étude détaillée.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse — Adapte et paramètre les progiciels applicatifs (ERP).', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse — Réalise le prototypage.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualification — Élabore les jeux de tests pour les tests unitaires d’intégration.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualification — Effectue les tests unitaires.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualification — Identifie et traite les dysfonctionnements.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Réalise les modules (objets et composants logiciels).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Assemble les composants.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Rédige les documentations.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance — A en charge la maintenance corrective.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance — A en charge la maintenance évolutive.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance — Administre les composants logiciels réutilisables et met à jour la Nomenclature de ces composants.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Code documenté suivant les règles et référentiels de l''entreprise.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de corrections en phase de recette.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Performance des composants développés (via des benchmarks).', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect du délai dans la réalisation des modifications.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de régressions.', NULL, 2004);
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
-- Parcours professionnel : Bac + 2/3 (BTS ou DUT/BUT) ou ingénieur.
-- Tendances et facteurs d’évolution : Ce métier a déjà intégré l''évolution des activités de paramétrage de progiciels. Il évolue vers le développement rapide lié à l''usage de l’internet mobile avec la portabilité des applications multi-canal sur les technologies liées aux objets connectés.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Testeur', 'Il doit s’assurer que les produits livrés seront conformes aux besoins traduits en spécifications. Cela concerne les systèmes existants, les évolutions, les corrections d’incidents, ou bien les nouveaux produits.', 'Il doit s’assurer que les produits livrés seront conformes aux besoins traduits en spécifications. Cela concerne les systèmes existants, les évolutions, les corrections d’incidents, ou bien les nouveaux produits.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Testeur' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'L’organisation des tests — Planifie les différentes tâches de tests en tenant compte des contraintes de ressources humaines, matérielles et des environnements.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'La conception des tests — Vérifie la réception des livrables nécessaires à l’élaboration du plan de tests.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'La conception des tests — Rédige les plans de qualification fonctionnels avec les acteurs concernés (utilisateurs clés, chef de projet etc.).', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'La conception des tests — Rédige les plans de tests d’installation, d’exploitation et d’intégration en fonction du dossier d’analyse ou d’exploitation.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'La conception des tests — Prépare et met à jour les configurations de tests en respectant les processus d’installation.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Le déroulement des tests — Met en œuvre les outils de suivi de tests.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Le déroulement des tests — Coordonne la réalisation des tests et le suivi des anomalies.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Le déroulement des tests — Rapporte auprès du chef de projet.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Le déroulement des tests — Rédige la fiche de qualification.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Le déroulement des tests — Organise les procédures de mise en service, bilans, archivage.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Le déroulement des tests — Met à jour les masters (configurations types) de tests.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : PV de recette.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect du planning.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect de la charge.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d''incidents de production.', NULL, 2003);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 4);
-- Parcours professionnel : Bac + 2/3 (BTS ou DUT/BUT) ou ingénieur débutant.
-- Tendances et facteurs d’évolution : Connaissant bien les applications, les testeurs peuvent évoluer vers des fonctions études pour faire de l''analyse applicative ou vers la fonction de maîtrise d''ouvrage s’ils viennent des métiers.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Intégrateur d’applications', 'Au sein de l''équipe projet, il contribue au choix des différents composants SI (progiciels, bases de données, développements spécifiques.). Il en assure l’assemblage dans le respect du plan d’urbanisme des systèmes d’information de l’entreprise et de l’architecture retenue pour le projet. Il assure la cohérence des flux inter-applications, de l''intégrité des données et de la sécurité de l''ensemble.', 'Au sein de l''équipe projet, il contribue au choix des différents composants SI (progiciels, bases de données, développements spécifiques.). Il en assure l’assemblage dans le respect du plan d’urbanisme des systèmes d’information de l’ent...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Intégrateur d’applications' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Identification et sélection des techniques du projet — Définit, sous la responsabilité du chef de projet maîtrise d’œuvre, l’architecture fonctionnelle et technique du système d’information sur le périmètre applicatif dont il a la charge.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Identification et sélection des techniques du projet — Utilise les objets existants de la cartographie des réutilisables.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réception, validation et assemblage de ces composants — Assemble et intègre les différents composants.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Réception, validation et assemblage de ces composants — Peut effectuer les tests et recettes dans une phase de pré-exploitation. Définition des interfaces et des éventuelles évolutions à apporter aux composants pour permettre', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'leur intégration — Le cas échéant, modifie ou créée de nouveaux composants.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'leur intégration — Définit et réalise des interfaces.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fourniture du système développé à l''intégrateur d''exploitation — Participe, avec la maîtrise d’ouvrage, à l’élaboration de didacticiels.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fourniture du système développé à l''intégrateur d''exploitation — Documente le système livré.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Fourniture du système développé à l''intégrateur d''exploitation — Livre la solution à l’intégrateur d’exploitation.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Un système applicatif opérable et documenté.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de réussite des tests de non régression et de charge.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d''incidents de production.', NULL, 2002);
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
-- Parcours professionnel : Bac + 3 à Bac + 5 avec expérience en étude et développement. Préférentiellement d’origine technique (études, développement), il doit avoir une expérience diversifiée des différentes technologies qu’il aura à mettre en œuvre.
-- Tendances et facteurs d’évolution : Ce profil métier apparaît pérenne avec notamment un besoin sur les composants de type progiciels dans les projets, en particulier avec les offres Saas, et en raison de la complexité et du foisonnement des technologies et des composants à maîtriser, en particulier le cloud.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Paramétreur de progiciels', 'À la demande du Métier, il analyse et conseille celui-ci sur la meilleure utilisation possible du ou des progiciels. Il assiste et apporte sa maîtrise sur le module progiciel dont il a l’expertise et les processus de modélisation associés. Il prototype et paramètre les nouveaux composants progiciels pour répondre aux évolutions souhaitées dans le respect des normes et procédures.', 'À la demande du Métier, il analyse et conseille celui-ci sur la meilleure utilisation possible du ou des progiciels. Il assiste et apporte sa maîtrise sur le module progiciel dont il a l’expertise et les processus de modélisation associé...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Paramétreur de progiciels' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse — Prototype en collaboration avec l’expert fonctionnel et l’administrateur de données', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse — Justifie les écarts entre le besoin exprimé et le standard du progiciel', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse — Effectue l''analyse fonctionnelle des besoins et détermine les interfaces avec les produits environnants dans le système d’information de l’entreprise.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Adapte et paramètre les éléments du progiciel', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Modélise les processus selon la méthodologie propre au progiciel choisi', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Participe à la réalisation des interfaces', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Rédige la documentation', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Développement — Participe à la réalisation des supports de formation des utilisateurs', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualification et tests — Élabore les jeux de tests pour les tests unitaires et d’intégration.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualification et tests — Teste les développements internes et les solutions fournies par les éditeurs.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualification et tests — Identifie et traite les dysfonctionnements constatés.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance — Effectue la maintenance corrective et évolutive à l’aide des outils et des ressources de l’éditeur.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance — Trace les évolutions du produit et des interventions dans une base de connaissances.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Progiciel opérant.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Degré de satisfaction des utilisateurs.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect du délai.', NULL, 2002);
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
-- Parcours professionnel : Bac + 2 ou Bac + 3 ou utilisateurs métiers qui évoluent vers la DSI, ou avec une première expérience en développement ou dans un projet de même nature.
-- Tendances et facteurs d’évolution : Prise en compte des standards liés aux architectures orientées service et cloud.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien d’exploitation', 'Le technicien d’exploitation assure la gestion courante de l’exploitation (hors réseau) dans le respect des plannings et de la qualité attendue. Il surveille le fonctionnement des équipements informatiques physiques et logiques du centre de production, dans le cadre des normes, méthodes d’exploitation et de sécurité.', 'Le technicien d’exploitation assure la gestion courante de l’exploitation (hors réseau) dans le respect des plannings et de la qualité attendue. Il surveille le fonctionnement des équipements informatiques physiques et logiques du centre...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien d’exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Exécute les travaux informatiques et restitue les résultats de la production dans le respect des plannings et de la qualité attendue.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Supervise les impressions.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Suit le fonctionnement des ressources du site.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Suit l’exploitation des systèmes et outils de production.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Suit l''exploitation des applicatifs.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Contrôle la gestion de la qualité des résultats.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des incidents et de la sécurité — Gère les incidents d’exploitation (diagnostic, intervention, alerte).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des incidents et de la sécurité — Effectue la maintenance applicative de dépannage de 1er niveau.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des incidents et de la sécurité — Informe les utilisateurs.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des incidents et de la sécurité — Suit les interventions.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des incidents et de la sécurité — Contribue à la sécurité physique du site informatique.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la sécurité physique des données en termes de sauvegarde et d''archivage — Gère les supports magnétiques (disques, robots, automates).', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la sécurité physique des données en termes de sauvegarde et d''archivage — Gère les ressources matérielles nécessaires.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Rapports de suivi d''exploitation.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect des contrats de service (SLA).', NULL, 2001);
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
-- Parcours professionnel : Bac + 2 (possibilité de premier poste) ou expérience de niveau technicien (avec une formation interne).
-- Tendances et facteurs d’évolution : Ce métier est sujet à une réduction des effectifs liée au cloud (réduction du nombre de centres d’exploitation), à l''utilisation de sous-traitance et d''externalisation des ressources.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien poste de travail', 'Dans le cadre de projets de déploiement, il assure l’installation et la garantie de fonctionnement des équipements informatiques et/ou téléphoniques (matériels et logiciels) liés au poste de travail. À la demande des utilisateurs, il assure la maintenance (à distance ou sur site) de ces équipements et traite les incidents.', 'Dans le cadre de projets de déploiement, il assure l’installation et la garantie de fonctionnement des équipements informatiques et/ou téléphoniques (matériels et logiciels) liés au poste de travail. À la demande des utilisateurs, il ass...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien poste de travail' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation, tests et recettes — Effectue l''installation initiale des équipements informatiques et/ou téléphoniques (applications, matériel micro, matériels de téléphonie et péritéléphonie).', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation, tests et recettes — Installe les mises à jour.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation, tests et recettes — Télédistribue les applications suivant un plan de déploiement.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation, tests et recettes — Effectue les tests et recettes utilisateurs des équipements informatiques et/ou téléphoniques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Traite les incidents à distance sur micros, réseaux, messagerie ou téléphonie.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Gère l’exploitation sur incident.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Diagnostique et traite les incidents.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Gère le parc informatique connecté au réseau.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance, administration et sécurité — Suit l’évolution de l’équipement.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance, administration et sécurité — Administre la messagerie sur la partie cliente du poste de travail (connexion, exploitation).', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance, administration et sécurité — Définit les données de télédistribution (cibles, profils, dépendances…) et de télémaintenance.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance, administration et sécurité — Contrôle la conformité des équipements avec les référentiels.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Support — Aide à la prise en main des équipements et logiciels installés.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Un poste de travail opérationnel.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Fiche de clôture d''incident.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Le niveau de satisfaction client.', NULL, 2001);
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
-- Parcours professionnel : Majoritairement Bac + 2 ou niveau Bac pour poste sans responsabilité.
-- Tendances et facteurs d’évolution : L’industrialisation de la maintenance conduit à la création de centres d’appels où le technicien peut avoir pour mission de réaliser un diagnostic, un support de premier niveau et éventuellement une escalade ou une intervention sur site. Ce profil métier est de plus en plus soumis aux évolutions technologiques et nécessitant des formations régulières et évolue également avec l’introduction de nouveaux équipements (portables, outils de mobilité.), la complexité croissante des installations, des procédures et tests et des causes d’incidents (interconnexions, multiplications des périphériques…). Il nécessitera de plus en plus de compétences liées au service client. Néanmoins ce métier diminue de manière prévisible suite à : la virtualisation qui entraîne une centralisation de la prise de main à distance mais aussi une possibilité de sous-traitance du service, et la standardisation des outils qui entraîne moins de variété, de modèles et de supports spécifiques.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien réseaux-télécoms', 'Il est garant du bon fonctionnement et de la disponibilité des réseaux ou des télécoms dont il a la responsabilité. Il assure la prévention des dysfonctionnements des réseaux ou des télécoms et contribue au bon fonctionnement du système d’information.', 'Il est garant du bon fonctionnement et de la disponibilité des réseaux ou des télécoms dont il a la responsabilité. Il assure la prévention des dysfonctionnements des réseaux ou des télécoms et contribue au bon fonctionnement du système ...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien réseaux-télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation et tests — Installe la partie active de la connectique (hubs, ponts, routeurs), du matériel informatique (postes et serveurs connectés) et des logiciels réseau.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation et tests — Respecte les procédures d’installation, de connexion… des matériels et des logiciels.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation et tests — Installe les mises à jour.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Installation et tests — Effectue les tests des équipements réseaux.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Gère l’exploitation sur incident.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Traite les incidents sur les réseaux informatiques ou téléphoniques.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Suit les ressources (hubs, imprimantes réseaux, serveurs, postes de travail connectés…).', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration et sécurité — Met en place les outils de sécurité, de sauvegarde et de métrologie.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration et sécurité — Contrôle le respect de la sécurité d’accès aux locaux techniques et signale les anomalies.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration et sécurité — Gère et maintient les infrastructures techniques, (routeurs, hubs, concentrateurs, câblage…) pour les serveurs et mainframes.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration et sécurité — Suit l’évolution de l’équipement.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration et sécurité — Exploite et administre le réseau sur son périmètre.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration et sécurité — Contrôle la conformité des équipements avec les référentiels.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : L''équipement réseau dont il a la charge.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Fiche de clôture d''incident.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect des SLAs.', NULL, 2001);
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
-- Parcours professionnel : Bac + 2 Spécialisé réseau et Télécom. Possibilité de premier poste.
-- Tendances et facteurs d’évolution : Le métier de technicien évolue avec les nouveaux équipements numériques, la complexité croissante des installations, des procédures, des tests et des causes d’incidents (interconnexions, multiplication des périphériques…), les applications collaboratives (audio et visioconférences notamment) et l’évolution des réseaux.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Administrateur d’outils / de systèmes / de réseaux -télécoms', 'Il installe, met en production, administre et exploite les moyens informatiques d’un ou plusieurs sites informatiques. Il participe au bon fonctionnement des systèmes d’information en garantissant le maintien à niveau des différents outils et/ou infrastructures des logiciels systèmes et/ou infrastructures de communication (locale, étendue, voix, image, architecture centralisée, client-serveur, web, mobile), dans un objectif de qualité, de productivité et de sécurité.', 'Il installe, met en production, administre et exploite les moyens informatiques d’un ou plusieurs sites informatiques. Il participe au bon fonctionnement des systèmes d’information en garantissant le maintien à niveau des différents outi...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Administrateur d’outils / de systèmes / de réseaux -télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Est responsable du fonctionnement optimal des outils, systèmes ou réseaux dont il a la charge.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Met en œuvre les outils garantissant la cohérence des données.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Possède une vision globale et actualisée des systèmes d’information ainsi qu''une bonne connaissance de l’entreprise.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Effectue un inventaire permanent et gère les différentes composantes des différents réseaux.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Suit et analyse les performances, met en place des mesures susceptibles d’améliorer la qualité ou la productivité de l’outil.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Élabore les règles d’utilisation de l’outil, en conformité avec les normes et standards de l’entreprise et dans le respect des contrats de service. Documente, Promeut et contrôle leur application.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Organise et optimise les ressources de son domaine.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Valide l’installation et l’intégration des nouveaux outils (systèmes, ou réseaux et télécoms) dans l’environnement de production.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Gère les droits d’accès aux serveurs et aux applications en fonction des profils.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Traite les incidents ou anomalies à partir des demandes internes : diagnostic de l’incident, identification, formulation et suivi de sa résolution.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Support — Participe aux actions de maintenance correctrice en veillant à leur qualité.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Support — Propose des améliorations pour optimiser les ressources existantes et leur organisation.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Support — Effectue le transfert de compétences et l''assistance technique des procédures aux équipes d’exploitation et participe éventuellement à leur formation.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance et sécurité — Gère les accès aux ressources du SI (en général).', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance et sécurité — Gère les évolutions et la maintenance des matériels, des logiciels et du système.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintenance et sécurité — Gère les performances (seuils d’alerte et tuning des ressources et produits du domaine).', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Études — Effectue des études de préconisation et d''implantation des matériels, outils et logiciels adaptés.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Études — Effectue une veille technologique sur les différents aspects de l’infrastructure système et de communication (matériels, logiciels, architecture, protocole, mode de transferts).', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Cartographie technique et documentée des outils, systèmes informatiques et télécoms.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d''incidents techniques sur les outils administrés.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Capacité de réaction à une anomalie.', NULL, 2002);
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
-- Parcours professionnel : Bac + 2 à Bac + 4 avec 3 à 5 ans d’expérience dans un environnement de production, d’exploitation ou de support. Évolution possible d’un technicien d''exploitation.
-- Tendances et facteurs d’évolution : L’interconnexion croissante des plates-formes et la multiplication des outils systèmes et réseaux dans l’environnement de production réclament de plus en plus de postes d’administrateurs dont les compétences sont différentes du technicien ou du pilote d’exploitation. Possibilité d''évolution du salarié vers le métier de développeur concepteur.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Administrateur de bases de données', 'Il gère et administre les systèmes de gestion de données de l’entreprise, en assure la cohérence, la qualité et la sécurité. Il participe à la définition et à la mise en œuvre des bases de données et des progiciels retenus par l’entreprise.', 'Il gère et administre les systèmes de gestion de données de l’entreprise, en assure la cohérence, la qualité et la sécurité. Il participe à la définition et à la mise en œuvre des bases de données et des progiciels retenus par l’entreprise.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Administrateur de bases de données' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Effectue le choix d''implémentation des bases de données.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Crée les bases en liaison avec l’administrateur système et les chefs de projets concernés.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Met en œuvre les logiciels de gestion de bases de données. Effectue l''adaptation, l''administration et la maintenance de ces logiciels.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Met en exploitation et en gestion les serveurs de données (administration, automatisation, développement des procédures, sécurité et autorisation d’accès, optimisation des traitements et des requêtes…).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Crée, à la demande des domaines ou de l’exploitation, les outils spécifiques d’aide à l’exploitation.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Assure l’intégrité des bases de données existantes en garantissant la sécurité physique (procédures de sauvegarde, restauration, journalisation, démarrage après incidents…) et logique (confidentialité, accès).', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Met en œuvre les outils de surveillance.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Exploitation — Règle les paramètres des bases de données pour une utilisation optimale.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Support — Assiste les utilisateurs (formation, requêtes techniques…).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Support — Effectue un support technique de second niveau pour l’ensemble des bases de données.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Support — Possède un rôle de correspondant technique entre les chefs de projets et le support technique des éditeurs.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Études et contrôles — Assure une veille technologique sur les SGBD et les progiciels retenus par l’entreprise.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Études et contrôles — Suit et contrôle les évolutions de version des bases existantes et progiciels retenus par l’entreprise.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Études et contrôles — Teste, valide, pour les aspects techniques, tous les logiciels et progiciels.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Études et contrôles — Définit les normes et standards d’utilisation et d’exploitation des SGBD.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Bases de données avec des temps d''accès raisonnables.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Documentation sur la structure de la base et les procédures d''exploitation et de production.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d''incidents de production.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Temps de réponse aux requêtes.', NULL, 2002);
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
-- Parcours professionnel : Bac + 2 à Bac + 4 avec une expérience de 3 à 5 ans dans l’élaboration et la mise en œuvre d’applications.
-- Tendances et facteurs d’évolution : Possibilité d''aller vers les métiers d''intégrateur et de qualification.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Intégrateur d’exploitation', 'À la demande du maître d’ouvrage et sous la conduite du responsable d’exploitation du SI, il intègre dans l’environnement de production la solution logicielle ou matérielle livrée par l’intégrateur d’applications et en assure le déploiement.', 'À la demande du maître d’ouvrage et sous la conduite du responsable d’exploitation du SI, il intègre dans l’environnement de production la solution logicielle ou matérielle livrée par l’intégrateur d’applications et en assure le déploiem...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Intégrateur d’exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration du logiciel dans l’environnement de production — Met en œuvre la recette, l’industrialisation et la mise en production, en liaison avec la maîtrise d’œuvre.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des changements de version (tenue à jour des versions déployées) — Gère les changements concernant les applications en production.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des changements de version (tenue à jour des versions déployées) — Effectue le suivi de la qualité de la production (performances, incidents) conformément au contrat de service.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Implantation du logiciel sur les serveurs — Contrôle l’exploitabilité de la solution sur les serveurs.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Implantation du logiciel sur les serveurs — Valide la faisabilité des déploiements et intégration systèmes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Implantation du logiciel sur les serveurs — Met éventuellement en place des outils de télémaintenance.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration des nouvelles applications et des mises à jour — Accompagne les projets d’un domaine d’activité en tant que spécialiste de la production.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration des nouvelles applications et des mises à jour — Planifie et suit l’activité d’intégration du domaine concerné en relation avec les études.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration des nouvelles applications et des mises à jour — Organise et met en œuvre le plan d’assurance qualité du système d’information.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Applications en service.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Documentation des chaînes d''exploitation et des reprises sur incident.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d''incidents en production.', NULL, 2001);
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
-- Parcours professionnel : Bac + 4 avec 3 à 5 ans d''expérience.
-- Tendances et facteurs d’évolution : Le foisonnement des nouvelles technologies est un facteur qui explique le besoin de renouvellement des savoir-faire techniques des intégrateurs d’exploitation. Possibilités d''évolution vers les métiers d’administration, de gestionnaire d''application ou de chef de projet informatiques.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Pilote d’exploitation', 'Il assure en permanence la surveillance de l’ensemble des ressources informatiques et leur gestion opérationnelle. Il veille au niveau et aux engagements de service ainsi qu''à la qualité des traitements conformément au plan d’assurance qualité et de sécurité.', 'Il assure en permanence la surveillance de l’ensemble des ressources informatiques et leur gestion opérationnelle. Il veille au niveau et aux engagements de service ainsi qu''à la qualité des traitements conformément au plan d’assurance q...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Pilote d’exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse des messages reçus à l’unité de pilotage — Diagnostique les incidents en cas de problème constaté sur le réseau, sur les serveurs ou en cas d’alerte d’un utilisateur.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Surveillance — Effectue le démarrage, l''arrêt et la surveillance permanente des ressources en référence au planning des travaux de la journée.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Surveillance — Alerte et intervient sur les incidents.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Surveillance — Lance les outils ou les commandes de reprise (reprise manuelle, reconfiguration des ressources, recopie des fichiers, opérations de sauvegarde…).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alerte éventuelle d’un niveau d’intervention supérieur — Relance des travaux après résolution.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alerte éventuelle d’un niveau d’intervention supérieur — Alimente la base des incidents.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Alerte éventuelle d’un niveau d’intervention supérieur — Maintient la documentation de pilotage.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Maintien des conditions générales de production — Assure la disponibilité des ressources physiques (disques, robots, automates…) et des ressources logiques (logiciels, espace disque, puissance…).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Rapports de suivi d''exploitation.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect des contrats de service (SLA).', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Fourniture de services' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des systèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 1, 0, 4);
-- Parcours professionnel : Bac + 2 informatique. Poste d''entrée qui permet d''appréhender la diversité du SI pour évoluer ensuite.
-- Tendances et facteurs d’évolution : La virtualisation des activités de surveillance et des procédures de contrôle conduit à un regroupement du pilotage global avec une focalisation de l’activité de surveillance de serveurs. Élargissement des plages horaires du fait de l''internationalisation des SI.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Expert systèmes d’exploitation / réseaux-télécoms', 'Il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il peut intervenir directement sur tout ou partie d’un projet qui relève de son domaine d’expertise. L’expert système d’exploitation / réseau télécoms effectue une veille technologique, il participe aux études de l’architecture technique générale et de son évolution ainsi qu’à la qualification des plates- formes informatiques.', 'Il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il peut intervenir directement sur tout ou partie d’un projet qui relève de son domaine d’expertise. L’expert système d’exploitation / réseau télécoms e...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Expert systèmes d’exploitation / réseaux-télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participation aux études et développement — Conduit les études pour la définition des systèmes en fonction des besoins.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Participation aux études et développement — Intervient dans le choix des fournisseurs.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Soutien auprès des équipes — Assiste et conseille dans la mise en œuvre des solutions techniques.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Soutien auprès des équipes — Diagnostique les causes de dysfonctionnement et propose des corrections et des solutions de rechange.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Soutien auprès des équipes — Informe les équipes des évolutions techniques du système.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Soutien auprès des équipes — Forme à l’utilisation des nouveaux systèmes.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prospective — Effectue la veille technologique.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prospective — Propose des solutions pour améliorer les performances des systèmes.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place et évolutions — Est l’interface reconnue des experts des autres domaines.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place et évolutions — Définit les règles de bonne gestion des systèmes d’exploitation / réseau télécoms.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place et évolutions — Qualifie les systèmes d''un point de vue technique et fonctionnel.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place et évolutions — Vérifie l’application des normes (sécurité informatique, qualité…).', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place et évolutions — Certifie les composants et les applications développées.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe — Participe aux colloques, forums, groupes de travail.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe — Enseignement, émet des publications.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Notes d''information et de préconisation sur les systèmes ou réseaux dont il a la charge.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de préconisations retenues.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de demandes d''intervention sur les projets.', NULL, 2002);
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
-- Parcours professionnel : Bac + 5 avec 5 ans d’expérience minimum.
-- Tendances et facteurs d’évolution : Suivant les organisations, les rôles d''expert et d''administrateur peuvent être parfois confondus. Peut évoluer vers les fonctions d''architecte, de RSSI ou de chef de projet.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Architecte technique', 'Il définit l’architecture technique de tout ou partie du système d’information. Il garantit la cohérence et la pérennité de l’ensemble des moyens informatiques, en exploitant au mieux les possibilités de l’art, dans le cadre du plan d’urbanisme de l’entreprise.', 'Il définit l’architecture technique de tout ou partie du système d’information. Il garantit la cohérence et la pérennité de l’ensemble des moyens informatiques, en exploitant au mieux les possibilités de l’art, dans le cadre du plan d’ur...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Architecte technique' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception — Définit l’architecture technique du ou des systèmes d’information.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception — Vérifie et analyse les impacts techniques des nouvelles solutions et leur cohérence avec l''architecture existante.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Définit et gère le référentiel du système informatique sur les plans : outils, procédures, normes, vocabulaire, sécurité….', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administration — Définit et gère les standards techniques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Préconisation — Pour tout nouveau projet ou toute nouvelle technologie, participe à l’étude d’impact sur l’architecture existante ou prévisionnelle.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Préconisation — Préconise des choix techniques en vue d’assurer la cohérence de cette évolution.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil — Conseille l''urbaniste sur l’utilisation et les implémentations possibles des outils informatiques et de télécommunications.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil — Organise les choix de veille technologique.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Travaille en équipe avec l''Urbaniste des SI.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Promeut l’architecture technique auprès des informaticiens.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Définition d''architecture technique opérationnelle.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Référentiel d''architecture (cartographie technique du ou des SI).', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Notes d''information et de préconisation.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure de l''agilité et de la réactivité de l''infrastructure technique à un changement donné (délai de prise en compte et coût d’un changement d’ordre technique).', NULL, 2001);
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
-- Parcours professionnel : Bac + 5 ingénieur pluridisciplinaire avec une expérience minimum de 5 ans. (Exploitation, développement, conduite de projet).
-- Tendances et facteurs d’évolution : C’est un métier en croissance dû à l''augmentation des usages nécessitant des architectures de plus en plus sollicitées et de plus en plus complexes. Cette complexification et la rapidité d’évolution des systèmes aussi bien sur un plan technique que fonctionnel va rendre nécessaire de savoir intégrer dans le système d’information des éléments exogènes (SaaS, Cloud, progiciels, plates-formes de convergence…), ainsi que de maîtriser le risque de perte d’intégrité du système d’information dans un contexte d’accélération des évolutions (techniques, concurrentielles, organisationnelles…). Évolutions possibles vers des profils de RSSI, urbaniste, chef de projet.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Support et assistance aux utilisateurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Assistant fonctionnel', 'Référent Métier, il apporte à l’utilisateur final une aide en matière d’utilisation de logiciels, en période de déploiement ou en régime de croisière, et contribue à résoudre toute difficulté que celui-ci rencontre. Il signale aux acteurs projet les demandes d''évolutions et les dysfonctionnements. À la jonction de la DSI (maître d’œuvre) et du client (direction, maîtrise d’ouvrage, utilisateurs), il intervient directement auprès des utilisateurs. Plutôt spécialisé sur un métier ou un processus, il aide et conseille l’utilisateur final à bien utiliser ses outils logiciels. Il contribue à la conduite du changement.', 'Référent Métier, il apporte à l’utilisateur final une aide en matière d’utilisation de logiciels, en période de déploiement ou en régime de croisière, et contribue à résoudre toute difficulté que celui-ci rencontre. Il signale aux acteur...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Assistant fonctionnel' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Lors de l’installation de nouveaux logiciels bureautiques ou métiers — Aide à la définition des formations et participe à leur réalisation.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Lors de l’installation de nouveaux logiciels bureautiques ou métiers — Accompagne les utilisateurs.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Lors de l’installation de nouveaux logiciels bureautiques ou métiers — Capitalise le partage des expériences.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'En régime de croisière — Conseille les utilisateurs.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'En régime de croisière — Détecte les utilisateurs en difficulté.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'En régime de croisière — Recense et répercute les améliorations fonctionnelles souhaitées.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'En régime de croisière — Intervient en 1er niveau lors des incidents en sollicitant les ressources (internes ou externes) nécessaires. Vérification de la qualité et de la performance du fonctionnement des applications de son domaine', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'SI — Contrôle et suit les dossiers avant transmission au Métier.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'SI — Veille au respect de la qualité et de la cohérence des réponses apportées aux utilisateurs.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'SI — Réalise une analyse qualitative et quantitative des actions de son domaine de responsabilité.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Propositions d''évolutions des logiciels.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Proposition de formations. .', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d''incidents traités dans les délais imparti.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Niveau de satisfaction des utilisateurs dans son activité d’assistance.', NULL, 2002);
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
-- Parcours professionnel : Bac + 2 minimum, soit utilisateur expérimenté intéressé par les technologies, soit développeur souhaitant se distancier par rapport à ces technologies et aller vers les usages associés.
-- Tendances et facteurs d’évolution : Métier souvent existant ou bien identifié pour les logiciels « métier », souvent plus informel pour les logiciels « bureautique ». Les certifications (type ITIL) permettent à ce métier d''intervenir de plus en plus sur les thématiques complexes (passer de la gestion d''incident à la gestion de problème). Évolution possible vers des postes d''intégrateur sur plateforme, de gestionnaire d''applications.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Support et assistance aux utilisateurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Technicien support utilisateurs', 'Il assure la réception des incidents (ruptures du service habituellement rendu) ou difficultés déclarés par les utilisateurs. Il les fait prendre en charge par les ressources capables d’y apporter une solution. Il contribue, au premier niveau, à la résolution des incidents nuisant à la qualité et à la continuité de service. À la différence de l’assistant fonctionnel, il traite tout type d’incidents et n’est pas toujours présent auprès des utilisateurs.', 'Il assure la réception des incidents (ruptures du service habituellement rendu) ou difficultés déclarés par les utilisateurs. Il les fait prendre en charge par les ressources capables d’y apporter une solution. Il contribue, au premier n...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Technicien support utilisateurs' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accueil des demandes des utilisateurs suite à des dysfonctionnements — Prend en compte les appels des utilisateurs.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accueil des demandes des utilisateurs suite à des dysfonctionnements — Enregistre des incidents ou anomalies de fonctionnement signalées.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accueil des demandes des utilisateurs suite à des dysfonctionnements — Pré-diagnostique et qualifie.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Traitement ou déclenchement des actions de support correspondantes — Traite le 1er niveau des incidents ou anomalies : diagnostic, identification, information, résolution, formulation.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Traitement ou déclenchement des actions de support correspondantes — Transfère si nécessaire les appels des utilisateurs aux entités compétentes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Traitement ou déclenchement des actions de support correspondantes — Alerte sa hiérarchie sur tout incident qui est « hors norme ».', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des incidents — Effectue le suivi du traitement des appels des utilisateurs.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des incidents — Exploite la base d’incidents : relances, consolidation, analyse de tendance.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des incidents — Émet des demandes d’actions préventives de fond.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Incidents enregistrés dans la base d''incidents.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Documentation des actions correctives dans la base d''incidents.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d''incidents de 1er niveau résolus dans les délais impartis.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de préconisations d’actions préventives retenues.', NULL, 2002);
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
-- Parcours professionnel : Bac + 2. Possibilité de premier poste.
-- Tendances et facteurs d’évolution : Regroupement des fonctions d''assistance multiservices (informatique, logistique immobilière, etc.) avec un rattachement de plus en plus fréquent aux services généraux. Évolution possible vers de l''assistance fonctionnelle.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Support et assistance aux utilisateurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Expert méthode et outils / qualité', 'Garant de son domaine d’expertise, il peut intervenir directement sur tout ou partie d’un projet. En tant que référent dans son domaine, il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte sur les risques. Il effectue un travail de veille technologique sur son domaine et propose des évolutions qu’il juge nécessaires. Il est l''interlocuteur reconnu des experts externes (fournisseurs, partenaires.).', 'Garant de son domaine d’expertise, il peut intervenir directement sur tout ou partie d’un projet. En tant que référent dans son domaine, il assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte sur les risques....', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Expert méthode et outils / qualité' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes — Assiste et conseille dans le choix et l’utilisation des méthodes.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes — Informe sur les évolutions.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes — Forme aux nouvelles technologies et systèmes.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes — Participe aux études et développement & conduite d’études ponctuelles.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place des évolutions et certifications — Définit et gère des normes, méthodes, outils et référentiels.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place des évolutions et certifications — Met en place les normes, méthodes et outils et en vérifie l''application.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place des évolutions et certifications — Certifie des composants et applications développées.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe — Effectue de la veille et de l’évaluation prospective technologique.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe — Participe aux colloques, forums, groupes de travail.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe — Enseigne, publie.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Dossiers d''expertise.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Référentiels sur le domaine d''expertise.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de demandes d''intervention sur les projets.', NULL, 2001);
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
-- Parcours professionnel : Bac + 5 avec 4 à 5 ans d’expérience minimum.
-- Tendances et facteurs d’évolution : Ce métier s''enrichit des besoins liés au contrôle interne et à la maîtrise des risques.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Sécurité' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Expert en cybersécurité', 'L’Expert sécurité des SI définit et met en œuvre les dispositifs techniques de sécurité sur tout ou partie des projets dont il a la charge, conformément à la politique de sécurité des SI et de l’information, et aux réglementation s. En tant que référent dans son domaine, il assure un rôle de veille (technologique notamment), de conseil, d’assistance, d’information, de formation et d’alerte sur les risques SI.', 'L’Expert sécurité des SI définit et met en œuvre les dispositifs techniques de sécurité sur tout ou partie des projets dont il a la charge, conformément à la politique de sécurité des SI et de l’information, et aux réglementation s. En t...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Expert en cybersécurité' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Contribue à la rédaction des politiques sécurité SI.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Participe à la rédaction et au suivi des standards de sécurité SI.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Identifie, propose et met en œuvre les outils et solutions techniques répondant à l’application de la PSSI (Politique de Sécurité des Systèmes d’Information).', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en œuvre — Établit et tient à jour la cartographie des menaces.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en œuvre — Identifie les activités et met en œuvre les outils et techniques de protection des SI dans le cadre de la lutte contre la cybercriminalité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en œuvre — Identifie et industrialise le traitement des failles de sécurité.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en œuvre — Assure l’analyse des relevés d’incidents et alertes.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il peut également être amené à vérifier la bonne élaboration des — PCA (Plan de Continuité d’Activité).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il peut également être amené à vérifier la bonne élaboration des — PRA (Plan de Reprise d’Activité).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il peut également être amené à vérifier la bonne élaboration des — PCI (Plan de Continuité Informatique).', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il peut également être amené à vérifier la bonne élaboration des — PRI (Plan de Reprise Informatique).', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il peut également être amené à vérifier la bonne élaboration des — DLP (Data Loss Prevention – mesures de protection contre la perte / le vol de données).', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes — Accompagne, conseille et informe les projets dans le choix, l’utilisation et l’évolution des méthodes, solutions et standards de sécurité ainsi que dans le cadrage sur le volet sécurité des projets.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes — Forme les utilisateurs, intervenants techniques et autres relais opérationnels, aux nouvelles technologies et systèmes, en veillant à la bonne application des mesures de sécurité.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes — Participe aux études et développement & conduite d’études ponctuelles.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place des évolutions et certifications — Définit, met en place et vérifie l’application des normes, méthodes, outils et référentiels de sécurité.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place des évolutions et certifications — Propose les actions correctrices pour pallier aux dysfonctionnements de sécurité SI.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Mise en place des évolutions et certifications — Certifie les applications et composants développés au regard de la réglementation (RGPD par exemple pour la protection des données).', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe et veille technologique — Assure une veille technologique autour de la sécurité et de la cybersécurité.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe et veille technologique — Participe aux colloques, forums, groupes de réflexion pour comprendre comment optimiser les règles de sécurité et les scénarios visant à assurer la sécurité des SI.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Ouverture externe et veille technologique — Est l''interlocuteur reconnu des experts externes (fournisseurs, partenaires.).', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Dossiers d’expertise.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Cartographie des menaces.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Les référentiels sécurité SI.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Robustesse : taux d’indisponibilité des systèmes.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Tendance d’évolution des attaques par niveau de gravité.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de failles détectées.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Pourcentage d’attaques déjouées et délai entre l’attaque et la réaction.', NULL, 2004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure de l’impact provoqué par une attaque : taux d’indisponibilité des systèmes.', NULL, 2005);
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
-- Parcours professionnel : Bac + 2/3 (BTS DUT/BUT) avec 10 ans d’expérience ou Bac + 5, avec 4 à 5 ans d’expérience. Pour ce type de poste, les certifications en (cyber)sécurité des SI sont un plus.
-- Tendances et facteurs d’évolution : Ce métier s’enrichit des besoins liés au contrôle interne, à la maîtrise des risques et la prévention de la cybersécurité. Le profil d’expert sécurité des SI peut, le cas échéant, être complété par une spécialité telle que : • lutte informatique défensive (LID), • lutte contre la cybercriminalité, • gestion de crise cyber. • pentests (tests d’intrusion), • cryptologie, • vulnérabilités & codes malveillants, • investigation numérique & détection d’intrusions, • analyse en détection d’intrusions / en traitement d’incidents, • direction de SOC. • ….

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Sécurité' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Auditeur SSI', 'L’auditeur en SSI a pour mission d’effectuer des inspections de sécurité et des audits sur les SI afin d’en connaître l’état de vulnérabilité et de déterminer les mesures à prendre pour en renforcer la sécurité. Un auditeur SSI peut effectuer des audits de différents niveaux, selon son périmètre d’activité (tests d’intrusion, audit de code, revue de configuration, etc.). Il identifie les vulnérabilités et propose des actions de remédiation. Il assure le contrôle de la conformité technique, opérationnelle, réglementaire, légale.', 'L’auditeur en SSI a pour mission d’effectuer des inspections de sécurité et des audits sur les SI afin d’en connaître l’état de vulnérabilité et de déterminer les mesures à prendre pour en renforcer la sécurité. Un auditeur SSI peut effe...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Auditeur SSI' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse de risques — Administrer la réalisation d’inspections locales (interviews, audits, tests d''intrusion, analyses d’architecture).', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse de risques — Produire des tableaux de bord du niveau de sécurité et de conformité.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étude et préconisations — Rédiger des rapports incorporant une analyse des vulnérabilités rencontrées et des préconisations techniques et organisationnelles.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étude et préconisations — Rédiger des fiches techniques sur des domaines SSI techniques ou plus généraux.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception d’outils — Élaborer des outils utilisés pour les audits.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conception d’outils — Identifier de nouveaux moyens pour détecter des failles.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audit et contrôle — Contrôle la bonne application des procédures.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audit et contrôle — Vérifie la sécurité organisationnelle, le PRA/PCA, DLP (Data Loss Prevention), la conformité par rapport aux exigences d’une norme (exemple : PCI DSS) ou un référentiel.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audit et contrôle — Procède aux audits des configurations et audits de code.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille — Assurer une veille active et ciblée dans les domaines des menaces, nouvelles technologies, référentiels réglementaires et les nouvelles normes.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Rapports d’audits.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Préconisations en regard des résultats de l’audit concerné.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d’application des préconisations.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Suivi des non conformités (évolution, clôture des incidents…).', NULL, 2002);
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
-- Parcours professionnel : Bac + 5, spécialité SSI. La certification (ISO 27001…) est un plus.
-- Tendances et facteurs d’évolution : La mise en place de nouvelles obligations réglementaires de respect des normes et usages, de réalisation régulière d’audit de sécurité des systèmes d’information va entraîner un fort besoin en auditeurs spécialisés. Par ailleurs, l’augmentation de la menace renforce encore la place centrale que doit prendre la mission de protection du SI qui lui est dévolue. Au-delà de la spécificité de ce profil, c’est aussi une fonction qui peut se retrouver dans d’autres profils comme le RSSI ou les CERT ou dans différentes filières suivant les organisations : il peut être rattaché ou non à la filière SI. Plutôt positionné sur la « cyber protection » il peut évoluer vers le domaine de la « cyberdéfense ». Il peut aussi évoluer vers un profil de RSSI ou Expert SSI.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Sécurité' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable sécurité des Systèmes d’Information (RSSI)', 'Sa mission première est de s’assurer et garantir la bonne application de la politique de sécurité du SI. Le RSSI assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il préconise toute décision d’intervention sur les systèmes d’information, dans leur globalité, de son périmètre pour préserver l’intégrité et la continuité du SI.', 'Sa mission première est de s’assurer et garantir la bonne application de la politique de sécurité du SI. Le RSSI assure un rôle de conseil, d’assistance, d’information, de formation et d’alerte. Il préconise toute décision d’intervention...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable sécurité des Systèmes d’Information (RSSI)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Sensibilisation et formation aux enjeux de la sécurité — Sensibilise et forme les directions opérationnelles et métiers.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Sensibilisation et formation aux enjeux de la sécurité — Assure la promotion de la charte de sécurité informatique auprès de tous les utilisateurs.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Décline à son niveau la politique de sécurité des SI — Définit les objectifs et les besoins de sécurité liés aux SI de l''entreprise sur son périmètre.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Décline à son niveau la politique de sécurité des SI — Définit et met en place les procédures liées à la sécurité des SI sur son périmètre.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Décline à son niveau la politique de sécurité des SI — Peut proposer un Plan d’Assurance Sécurité (PAS) pour décrire le dispositif de sécurité d’une prestation qui pourra figurer en annexe d’un contrat.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étudie les moyens et fait des préconisations — Valide techniquement les outils de sécurité.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étudie les moyens et fait des préconisations — Définit les normes et les standards de sécurité.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étudie les moyens et fait des préconisations — Définit et coordonne les projets d’amélioration continue sur les process et outils de la sécurité.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étudie les moyens et fait des préconisations — S’assure de l’intégration de la sécurité dans la définition des projets sur son périmètre et peut animer les instances correspondantes.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Étudie les moyens et fait des préconisations — Anticipe et propose des évolutions en regard de son périmètre de responsabilité et en capitalisant sur l’ensemble des retours d’expérience (dont incidents de sécurité…).', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Planifie et pilote les audits (conformité, techniques, réglementaires…).', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Propose des recommandations et un plan de réduction des risques.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Contrôle et garantit que les équipes appliquent les principes et règles de sécurité du SI.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Audite la vulnérabilité du SI de l’entreprise sur son périmètre.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Alerte les cellules de crise en cas d’incidents sécurité SI.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Veille.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Effectue le suivi des évolutions réglementaires et techniques de son domaine.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audite et contrôle — Veille sur les évolutions nécessaires pour garantir la sécurité logique et physique du SI.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse de risques — Évalue les risques, les menaces et les conséquences.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse de risques — Étudie les moyens assurant la sécurité et leur bonne utilisation.', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse de risques — Établit le plan de prévention.', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse de risques — Prend les mesures techniques et/ou organisationnelles permettant la surveillance, l’appréciation de la sécurité et la réaction face aux attaques.', NULL, 22);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Résilience — Prend les mesures conservatoires immédiates en cas d’incident.', NULL, 23);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Résilience — Prépare et met en œuvre un plan de continuité informatique, dans le cadre du Plan de Continuité des Activités (PCA).', NULL, 24);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Résilience — Prépare et met en œuvre un plan de reprise informatique, dans le cadre du Plan de Reprise des Activités (PRA).', NULL, 25);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Remédiation — Fait effectuer les analyses nécessaires à la compréhension d’un problème.', NULL, 26);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Remédiation — Fait mettre en œuvre les mesures nécessaires à la résolution d’un problème.', NULL, 27);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Résultats des audits de sécurité internes.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Résultats des audits imposés par la législation.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Reporting et tableaux de bord de la sécurité SI.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Journal des incidents.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Volumes de contrôles de sécurité.', NULL, 2001);
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
-- Parcours professionnel : Ingénieur ou équivalent Bac + 5 en informatique et sécurité réseaux avec 5 ans minimum d’expérience dans le domaine IT, de la sécurité ou des télécoms. Évolution possible pour un expert sécurité.
-- Tendances et facteurs d’évolution : Évolution vers un poste de DSSI ou directeur de la cybersécurité ou bien vers la fonction d’Architecte d’Entreprise. Évolution possible vers un poste de responsable de Business Unit. Compréhension et prise en compte de la sécurité dans les projets agiles. Très grand rapprochement et coordination avec la direction de gestion des risques et de la qualité et de la conformité de l’entreprise.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Directeur des systèmes d’information (DSI)', 'Garant de l’alignement du SI sur la stratégie de l’entreprise, il est responsable de la conception, de la mise en œuvre et du maintien en conditions opérationnelles du système d’information, de la sécurité et de sa qualité. Dans ce cadre, il porte le marketing du SI et de la DSI, dans son entreprise et à l''extérieur. Il fixe et valide les grandes évolutions de l’informatique de l’entreprise. Il anticipe les évolutions nécessaires en fonction de la stratégie de l’entreprise et en maîtrise les coûts. Il détermine les investissements en fonction des sauts technologiques souhaités. Il s’assure de l’efficacité et de la maîtrise des risques liés au système d’information', 'Garant de l’alignement du SI sur la stratégie de l’entreprise, il est responsable de la conception, de la mise en œuvre et du maintien en conditions opérationnelles du système d’information, de la sécurité et de sa qualité. Dans ce cadre...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Directeur des systèmes d’information (DSI)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et supervision de la politique de SI et de sa mise en œuvre — Définit des orientations stratégiques I&T de l’entreprise.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et supervision de la politique de SI et de sa mise en œuvre — Conseille et définit la politique du SI de l’entreprise.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et supervision de la politique de SI et de sa mise en œuvre — Suit l’ensemble des activités de la DSI.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et supervision de la politique de SI et de sa mise en œuvre — Arbitre les moyens de la DSI (études, ressources, budgets, investissements…).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promotion de la qualité dans les relations avec les partenaires internes — Organise, anime et suit les concertations et échanges entre la direction générale et les responsables du système d’information.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promotion de la qualité dans les relations avec les partenaires internes — Garantit la qualité de la relation clients-fournisseurs.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Promotion de la qualité dans les relations avec les partenaires internes — Définit et garantit le respect des contrats de service.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et mise en œuvre d’une politique de « faire ou faire-faire » — Négocie, maîtrise et suit les contrats de sous-traitance et leur mise en œuvre.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et mise en œuvre d’une politique de « faire ou faire-faire » — Analyse le marché, évalue les offres de sous-traitance et est force de proposition vis-à-vis de la direction générale.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et mise en œuvre d’une politique de « faire ou faire-faire » — Analyse les performances contrôle la qualité de la sous-traitance.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication interne, motivation et animation du personnel de la DSI — Définit et supervise la gestion générale et l’organisation de la DSI.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication interne, motivation et animation du personnel de la DSI — Gère et arbitre les projets pluridisciplinaires impliquant des acteurs géographiquement dispersés.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication interne, motivation et animation du personnel de la DSI — Met en œuvre des actions d’accompagnement du changement pour les informaticiens.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Supervision des relations avec les prestataires et partenaires extérieurs — Gère les relations avec les partenaires I&T.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Supervision des relations avec les prestataires et partenaires extérieurs — Suit les relations avec les organismes extérieurs partenaires.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garant de la sécurité informatique — Définit et met en œuvre la politique de gestion des risques informatiques.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Garant de la sécurité informatique — Garantit la fiabilité, la confidentialité et l’intégrité des systèmes d’information.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Le système d''information de l''entreprise.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : ROI des projets.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Efficacité au moindre coût du système d''information.', NULL, 2002);
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
-- Parcours professionnel : Bac + 5, manager de haut niveau. Management de grandes structures dans un contexte national mais aussi international. Informatique ou direction de grands projets à l’échelle de l’entreprise.
-- Tendances et facteurs d’évolution : Très dépendant des stratégies d’entreprise et de son modèle d''organisation. Définition et mise en œuvre d’une politique de « faire ou faire-faire » et impact sur la GPEC de la DSI. Prise en compte de l''agilité du système d''information et de l’exigence croissante des utilisateurs.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable d’entité', 'Il dirige, anime, coordonne, et gère une entité informatique pour atteindre les objectifs fixés dans le cadre de la stratégie définie pour son entité. Il est force de proposition des grandes évolutions du SI dans le cadre de la stratégie déterminée par le DSI. Il participe à la définition d’une politique de « faire ou faire faire » et la met en œuvre. Il est le garant de prestations informatiques produites en qualité et sécurité pour le coût optimum.', 'Il dirige, anime, coordonne, et gère une entité informatique pour atteindre les objectifs fixés dans le cadre de la stratégie définie pour son entité. Il est force de proposition des grandes évolutions du SI dans le cadre de la stratégie...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable d’entité' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution des effectifs et des compétences de son entité.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Pilote la gestion financière (récurrente et projet) en veillant au respect des procédures budgétaires.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle des autres domaines.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité, sécurité — Pilote la mise en place et veille au respect des procédures et méthodes d’assurance de qualité et de sécurité du SI.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Communique auprès des directions métier et maîtrises d’ouvrages clientes de l’entité.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Communique au sein de son entité (communication d’entreprise, communication sur l’évolution informatique, etc.).', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Ensemble de prestations respectant les critères de délai et de qualité, et satisfaction clients (utilisateurs internes ou externes à l''entreprise).', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Adéquation des compétences de l''entité avec le service attendu.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect des délais et des budgets.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Progression des compétences de l''entité.', NULL, 2002);
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
-- Parcours professionnel : Bac + 5 avec 5 à 10 ans d’expérience dans le Métier ou dans le domaine des SI. Et au moins une expérience dans le management d’équipe.
-- Tendances et facteurs d’évolution : Ce métier requiert d''être au plus près des évolutions, attentes et enjeux Métier et d’anticiper les impacts des évolutions technologiques.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable Télécoms', 'Le responsable télécoms et réseaux est chargé de définir et mettre en application dans le cadre du schéma directeur informatique la stratégie Réseaux et Télécoms de l’entreprise. Son champ d’action recouvre les services de données et de voix. Il porte et met en œuvre la politique Sécurité de l''entreprise dans son domaine.', 'Le responsable télécoms et réseaux est chargé de définir et mettre en application dans le cadre du schéma directeur informatique la stratégie Réseaux et Télécoms de l’entreprise. Son champ d’action recouvre les services de données et de ...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable Télécoms' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution des effectifs et des compétences de son entité.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Pilote la gestion financière (récurrente et projet) en veillant au respect des procédures budgétaires.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle des autres domaines.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et conception de l’architecture télécom — Définit les besoins et les choix de l’architecture télécoms et réseaux.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définition et conception de l’architecture télécom — Valide les choix et leur compatibilité avec l’architecture informatique et les standards technologiques du groupe et des partenaires.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Continuité de service — Est responsable de l’exploitation et de l’administration des réseaux et services à valeur ajoutée.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Continuité de service — Établit un tableau de bord sur la qualité du service réseau.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Continuité de service — Fournit support et assistance dans l’utilisation des services de communication voix et données.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Continuité de service — Se charge de l’application des polices de sécurité et exploitation des journaux de sécurité.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille, prospective et conseil — Conseille et assiste les équipes projets du département IT ou des divisions opérationnelles.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille, prospective et conseil — Oriente et organise la veille technologique.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille, prospective et conseil — Suit les nouvelles offres et nouveaux entrants.', NULL, 18);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille, prospective et conseil — Suit la réglementation tarifaire.', NULL, 19);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Appels d’offres et achat de services télécoms — Définit le cahier des charges (périmètre, services…).', NULL, 20);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Appels d’offres et achat de services télécoms — Réalise le dépouillement des appels d’offres.', NULL, 21);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Appels d’offres et achat de services télécoms — Fait le choix et le suivi des équipements, services, opérateurs et intervenants extérieurs.', NULL, 22);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Appels d’offres et achat de services télécoms — Se charge des achats, négociation et contractualisation réalisés avec le service des achats, le service juridique et la finance.', NULL, 23);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Relations MOE-MOA — Se charge de la définition des besoins.', NULL, 24);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Relations MOE-MOA — Fixe et garantit le niveau de service des réseaux voix et données.', NULL, 25);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Relations MOE-MOA — Assure la coordination générale et la cohérence des projets Télécom et Réseaux.', NULL, 26);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audit et contrôle de gestion — Se charge de l’optimisation et de la maîtrise des coûts télécoms.', NULL, 27);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audit et contrôle de gestion — Contrôle la qualité de service des opérateurs.', NULL, 28);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audit et contrôle de gestion — Établit des tableaux de bord.', NULL, 29);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Audit et contrôle de gestion — Valide et contrôle le budget Telecom et Réseaux.', NULL, 30);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Une architecture réseau et télécoms opérationnelle et performante.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de satisfaction des utilisateurs, notamment en situation de mobilité ou de télétravail.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre d’incidents remontés.', NULL, 2002);
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
-- Parcours professionnel : Bac + 5 avec 4 à 5 ans d’expérience.
-- Tendances et facteurs d’évolution : Il est confronté aux défis : • Économiques : concurrence et délai de mise en œuvre des solutions. • Techniques (dont la sécurité) et technologiques (5G, Wifi 6…). • D''évolutions des métiers dans un environnement technologique en forte évolution.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable d’exploitation', 'Il dirige l’ensemble des opérations et des moyens de production de l’activité de son entité ; il est responsable du niveau de qualité de service et de sécurité prévus conformément aux attentes des utilisateurs. Il anime et coordonne l’activité des différents secteurs d’un centre d’exploitation, de façon à garantir un fonctionnement optimum des unités de production (planification, organisation, délais, normes…).', 'Il dirige l’ensemble des opérations et des moyens de production de l’activité de son entité ; il est responsable du niveau de qualité de service et de sécurité prévus conformément aux attentes des utilisateurs. Il anime et coordonne l’ac...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable d’exploitation' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution des effectifs et des compétences de son entité.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Pilote la gestion financière (récurrente et projet) en veillant au respect des procédures budgétaires.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle des autres domaines.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Production informatique, maintenance — Supervise l’ensemble de la production : pilotage, ingénierie système et exploitation. Ainsi que la maintenance des matériels, logiciels d’exploitation et logiciels de base, et optimise les ressources informatiques.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité, sécurité — Contrôle la fiabilité du système, la sécurité des données ; le cas échéant, définit des plans de secours.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité, sécurité — Applique les plans de secours et de sauvegarde.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité, sécurité — Coordonne la réalisation des traitements informatiques dans les meilleures conditions de qualité de délais et de coûts.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Organisation de l’information en cas de situation perturbée, diffusion de l’information nécessaire à l’exercice du métier.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est force de proposition, tant du point vue technique qu’économique et budgétaire, pour — Assurer le maintien au niveau technique adéquat des moyens de production.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est force de proposition, tant du point vue technique qu’économique et budgétaire, pour — Anticiper les évolutions technologiques et leurs impacts sur le dimensionnement de l’environnement de production (par exemple intégration des nouveaux matériels, gestion du parc).', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Est force de proposition, tant du point vue technique qu’économique et budgétaire, pour — Assure le suivi des contrats de prestation.', NULL, 17);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Un système informatique de production opérationnel et performant.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de satisfaction des utilisateurs (conformité fonctionnelle).', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre d’incidents remontés.', NULL, 2002);
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
-- Parcours professionnel : Bac + 5 avec 5 à 10 ans d’expérience dans les domaines informatiques.
-- Tendances et facteurs d’évolution : Ce profil métier doit prendre en compte une exigence croissante des Métiers dans la relation clients- fournisseurs (contrats de service). Industrialisation des activités d’exploitation informatique (intégration de plus en plus fine dans les démarches de type processus). Anticipation des impacts des évolutions technologiques (Saas, cloud...).

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable d’études', 'Il dirige des activités d’étude et de développement qui contribuent à l’évolution et la maintenance du SI. Il travaille essentiellement en regard des processus métiers de l’entreprise.', 'Il dirige des activités d’étude et de développement qui contribuent à l’évolution et la maintenance du SI. Il travaille essentiellement en regard des processus métiers de l’entreprise.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable d’études' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Coordonne, gère et anime le personnel de son entité.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Répartit la charge de travail, en volume et en calendrier, en fonction des prévisions d’évolution des effectifs et des compétences de son entité.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Encadrement, animation — Dirige, organise, planifie et contrôle les activités de l’entité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit le plan de charge.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Négocie les objectifs et les moyens de l’entité.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Pilote la gestion financière (récurrente et projet) en veillant au respect des procédures budgétaires.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Garantit la cohérence des projets et applications de son périmètre de responsabilité avec celle des autres domaines.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Établit et suit les tableaux de bord.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation, gestion — Analyse et propose des solutions pour améliorer continuellement la productivité de son entité.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration et automatisation des processus métiers — Conduit (pour éviter de confondre avec l’étape d’intégration) les études et réalisations de tous nouveaux projets de l’entreprise.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration et automatisation des processus métiers — Propose les initiatives fonctionnelles, techniques et organisationnelles pour assurer l’optimisation des processus métiers des entités (ou structures) utilisatrices.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration et automatisation des processus métiers — Définit les contrats de service (SLA) associés aux processus métiers qui engagent la DSI auprès des métiers.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie SI — Participe aux décisions concernant la stratégie SI, les évolutions des architectures applicatives et techniques, les choix de logiciels, ainsi que l''organisation de la DSI et des projets.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Planification, organisation et gestion — Pilote la coordination organisationnelle et opérationnelle avec ses partenaires.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Relations fournisseurs — Entretient une parfaite maîtrise des relations avec les fournisseurs, en particulier les éditeurs de logiciels, sociétés de services et cabinets de conseil intervenant sur de grands projets de mise en œuvre de systèmes.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Solutions applicatives avec leur maintenance associée.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Respect des SLA définis au départ.', NULL, 2001);
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
-- Parcours professionnel : Bac + 5 avec une bonne connaissance des Systèmes d''Information, des enjeux Métier, des éditeurs et du marché. Expérience indispensable en pilotage de grands projets
-- Tendances et facteurs d’évolution : Intégration dans le Métier

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chief Digital Officer (CDO)', 'Principalement il engage et pilote la transformation numérique de l’entreprise, avec le support de la Fonction SI, et en embarquant tous les métiers. Il impulse la réflexion des dirigeants sur l’impact du numérique sur le modèle d’affaires et sur la stratégie de l’entreprise. La fonction de CDO peut être portée par le DSI, qui aura alors la double responsabilité d’orchestrer globalement la transformation de l’entreprise et d’assurer l’intégration du numérique de manière cohérente et maîtrisée.', 'Principalement il engage et pilote la transformation numérique de l’entreprise, avec le support de la Fonction SI, et en embarquant tous les métiers. Il impulse la réflexion des dirigeants sur l’impact du numérique sur le modèle d’affair...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chief Digital Officer (CDO)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Identifie les opportunités de création de valeur par l’utilisation des technologies numériques, tant pour l’optimisation des modèles d''affaire existants que pour l’identification de nouveaux.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Promeut le développement du multi-canal (primauté de l’expérience client, personnalisation, services à valeur ajoutée, …).', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Garantit la pleine exploitation des données à disposition, en liaison avec le Chief Data Officer.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Organise le développement de partenariats avec l’écosystème.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Améliore la chaîne de production par les innovations numériques et les nouvelles formes d’organisation du travail.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Définit les priorités numériques de l’entreprise, conformément à la stratégie numérique de l’entreprise.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Évalue la performance des investissements digitaux.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagnement du changement — Diffuse la culture numérique dans les métiers et les fonctions support.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagnement du changement — Impulse la culture « données » dans l’entreprise, organise la transversalité entre les métiers dans toute l’entreprise.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagnement du changement — Contribue à faire évoluer, avec la DRH, l’organisation du travail, les processus de recrutement, la gestion des carrières, les méthodes d’évaluation des contributions à la performance de l’entreprise.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagnement du changement — Contribue à mettre en place des dispositifs de formation et de mise à niveau de l’ensemble des collaborateurs sur le numérique.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : La stratégie de transformation digitale de son organisation.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Grille de maturité digitale de l’organisation.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Roadmap digitale.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Ensemble des plans d’investissement digitaux consolidés avec ROI.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Mesure de la progression dans la maturité digitale.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Le nombre de projets digitaux avec leur ROI.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Visibilité digitale de l’organisation de l’entreprise (exemple la place de l’entreprise dans le e- CAC 40).', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Contribution digitale au business (comme les offres business sont valorisées).', NULL, 2004);
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
-- Parcours professionnel : Profil expérimenté niveau DG avec une bonne vision de la stratégie. Peut venir d’autre métiers ou marketing mais avec une forte appétence au numérique.
-- Tendances et facteurs d’évolution : Le poste de CDO n’a pas nécessairement vocation à être pérenne dans l’entreprise : sa mission peut être transitoire mais indispensable pour permettre à l’entreprise d’opérer sa transformation numérique. Évolutions vers des postes de DSI ou de DG (marketing, direction métiers...) Cela dépend d’où il vient et du contexte de l’organisation.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Management opérationnel' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Responsable marketing de la DSI', 'Le responsable du marketing de la DSI construit une relation avec les clients de la DSI, les utilisateurs des services et a une connaissance précise de leurs besoins. Il markette l’offre de la DSI et ainsi définit, valorise, rationalise et commercialise/publie l’offre de services SI. Il garantit la satisfaction des clients et utilisateurs en rendant visible et faisant la promotion de la qualité de service auprès des clients et utilisateurs. Il met en place une stratégie de communication structurée qui permettra de répondre aux besoins d’information des utilisateurs, et ce, tout au long du cycle de vie d’un service (évolutions de fonctionnalités, dysfonctionnements…).', 'Le responsable du marketing de la DSI construit une relation avec les clients de la DSI, les utilisateurs des services et a une connaissance précise de leurs besoins. Il markette l’offre de la DSI et ainsi définit, valorise, rationalise ...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Responsable marketing de la DSI' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la relation client — Est responsable de la relation avec les clients et les utilisateurs de la DSI.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la relation client — Assure la gestion de la demande hors catalogue et des réclamations à la DSI.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la relation client — Mesure régulièrement et améliore la satisfaction des clients et des utilisateurs du SI (enquêtes utilisateurs, enquête à chaud support…).', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la relation client — Développe la connaissance clients et utilisateurs (bases de connaissances clients et utilisateurs, segmentations, profilage, …).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication et accompagnement du changement — Organise et anime des « clubs utilisateurs » et des événements autour des projets/services de la DSI.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication et accompagnement du changement — Fait connaitre l’offre de service et le catalogue de service de la DSI auprès des utilisateurs.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication et accompagnement du changement — Accompagne les projets SI dans la conduite du changement et dans leur communication opérationnelle vers les utilisateurs.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Marketing de l’offre — Markette l’offre de service de la DSI (définitions des fiches de service, packages, …).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Marketing de l’offre — Publie l’offre (catalogue de service).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité de service — Promotion et communication sur la qualité du ou des supports bureautiques et applicatifs (satisfaction, respect des SLAs, communication incidents…).', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Qualité de service — Contribue au développement de projets SLAs, à la définition et au suivi des engagements de services et à la publication de la « météo des services » (monitoring).', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Innovation — Développe la Customer Experience', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Innovation — Propose de nouveaux services, en intégrant dès la conception une approche marketing (user expérience, ergonomie, compréhension des besoins).', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Plan marketing et communication.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Outillage de la mesure de la satisfaction client (enquêtes…).', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Catalogue de services.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Indice de satisfaction client.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre d’événements clients et utilisateurs organisés.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux d’adhésion aux nouveaux services.', NULL, 2003);
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
-- Parcours professionnel : Le responsable marketing de la DSI vient du marketing, notamment des services (et peut y revenir). Il peut aussi venir de la MOA (notion de proximité avec le client) mais avec une bonne expérience de la relation client.
-- Tendances et facteurs d’évolution : Il peut évoluer vers : • Le marketing de service ou d’autres fonctions (notamment achats). • La vente de services de SI (par exemple en SSII). • Des fonctions de responsable de projet de fonction d’innovation ou de développement de l’expérience utilisateur. Le rôle de la DSI se développe et justifie ce métier mais ne nécessite pas de gros volumes (en ressources). L''activité de « marketing de la DSI » ne devrait pas concerner une seule personne mais se disséminer dans l''organisation (à des niveaux différents suivants les métiers).

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Data Scientiste', 'Positionné auprès des Métiers ou de la DSI, il exploite, analyse et évalue la richesse de données, structurées ou non, pour établir des scénarii permettant de comprendre et anticiper de futurs leviers métiers ou opérationnels pour l’entreprise.', 'Positionné auprès des Métiers ou de la DSI, il exploite, analyse et évalue la richesse de données, structurées ou non, pour établir des scénarii permettant de comprendre et anticiper de futurs leviers métiers ou opérationnels pour l’entr...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Data Scientiste' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'S‘appuie sur ses compétences scientifiques et techniques avancées, contextualisées par des connaissances métier indispensables pour valoriser les gisements de données.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille sur des périmètres métiers ciblés (cas d’usage) pour explorer et exploiter des flux de données issus du data lake ou d’autres sources (dans ce cas il évalue la qualité et la richesse des données, les analyse et en restitue les résultats pour ensuite les intégrer dans le système d’information cible du métier).', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Obtient des données adéquates, trouve les sources de données pertinentes, fait des recommandations sur les données à consolider, modifier, rapatrier, externaliser, internaliser.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intervient de façon plus intégrée en industrialisant ses réalisations dans la chaine technologique du data lake et/ou les intègre dans le système d’information du métier.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conçoit des modèles statistiques et/ou d’apprentissage automatisé.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Compare et évalue différents modèles ou méthodes de calcul et anticipe les avantages et inconvénients dans un environnement métier.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la veille en recherche & innovation pour introduire de nouvelles approches d’analyse et de modélisation des données.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Scénarios prédictifs.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Précision et valeur ajoutée des prédictions.', NULL, 2001);
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
-- Parcours professionnel : Bac + 5 issu d’école d’ingénieur, de commerce, écoles spécialisées en statistiques. Maîtrise des techniques du data mining et des statistiques, avec une forte inclination aux technologies et aux outils informatiques des bases de données, et un savoir-faire métier dans le secteur d’application des données analysées (marketing, finance par exemple).
-- Tendances et facteurs d’évolution : C’est un acteur important dans la transformation numérique et dans la stratégie de l’entreprise. C’est un nouveau métier du numérique en forte progression.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Data Analyste', 'Positionné auprès des Métiers ou de la DSI ou dans un pôle data transverse, il met en œuvre des outils informatiques, des techniques et des méthodes statistiques pour permettre d’organiser, synthétiser et traduire efficacement des données Métiers. Il produit et est responsable des indicateurs de performance qui permettent les prises de décision. Activités et tâches.', 'Positionné auprès des Métiers ou de la DSI ou dans un pôle data transverse, il met en œuvre des outils informatiques, des techniques et des méthodes statistiques pour permettre d’organiser, synthétiser et traduire efficacement des donnée...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Data Analyste' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il apporte un appui analytique à la conduite d’exploration et à l’analyse complexe de données Métiers permettant de fournir des indicateurs concrets.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'À partir des exigences Métiers, il identifie les données les plus intéressantes.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il dégage des logiques de génération d’indicateurs pour les Métiers.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Il conçoit les tableaux de bord nécessaires à la restitution des différents indicateurs sous la forme de Data visualisation.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Une présentation de l’activité métier sous forme — d’indicateurs de performance,', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Une présentation de l’activité métier sous forme — de tableaux de bord Session d’animation.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : La circulation des tableaux de bord fournis (la valeur est d’autant plus forte qu’ils circulent).', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : La mesure de l’impact sur des décision business prises.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Le délai de mise à disposition des indicateurs.', NULL, 2003);
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
-- Parcours professionnel : Bac + 5 ou ingénieur, venant de différents secteurs mais avec une spécialisation en analyse et traitement des données.
-- Tendances et facteurs d’évolution : Le métier est encore récent et les populations restreintes. Les analystes de données pourraient évoluer dans le domaine data vers le métier de Data Scientiste, mais la marche semble haute (le différentiel de nature de compétences est important).

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Chief Data Officer', 'Le Chief Data Officer est un directeur responsable des Données de l’entreprise. Son rattachement dépend de l’organisation et de la gouvernance de l’entreprise. Il a pour mission transverse et générale de définir et de faire appliquer la stratégie de l’entreprise au regard de la valorisation de son patrimoine informationnel. Il est responsable de l’optimisation de l’utilisation des données en termes de qualité et de cohérence. Il travaille en synergie avec les RSSI pour la sécurité des données, le DPO pour les problématiques liées aux données personnelles, et avec les managers des équipes de données (Data). Il travaille également étroitement avec l’ensemble des acteurs de l’organisation pour créer profit et valeur : cette fonction peut donc s’exercer sur différents domaines, tels que la stratégie, le juridique, le marketing, l’innovation, les SI, l’efficacité opérationnelle et la gestion du patrimoine informationnel.', 'Le Chief Data Officer est un directeur responsable des Données de l’entreprise. Son rattachement dépend de l’organisation et de la gouvernance de l’entreprise. Il a pour mission transverse et générale de définir et de faire appliquer la ...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Chief Data Officer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gouvernance — Le Chief Data Officer élabore la politique générale de la gouvernance transverse des données', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'pour en garantir l’efficacité dans la confiance — Périmètre des données à mettre sous contrôle.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'pour en garantir l’efficacité dans la confiance — Outillage, normes, standards et processus.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'pour en garantir l’efficacité dans la confiance — Principes de gestion et de fiabilisation des données.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'pour en garantir l’efficacité dans la confiance — Assurer la conduite du changement et vérifier son application.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage — Le Chief Data Officer déploie et pilote la politique générale de gouvernance des données.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage — Il s’assure que l’ensemble des acteurs de la chaîne de valeur des données mettent à disposition les moyens nécessaires pour servir les ambitions de transformation de l’entreprise.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage — Il garantit la maîtrise des données sur tout leur cycle de vie, et organise la transversalité, la mutualisation et le partage des données dans l’entreprise afin par exemple de favoriser l’amélioration de la connaissance (client, produit, écosystème) et la performance des processus internes.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication — Il communique et « évangélise » les métiers et l’entreprise sur l’utilisation de la donnée au service de la transformation (démarche orientée data – Data Driven).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Une politique de gouvernance des données.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Des rapports d’audit sur l’application de la politique des données.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Une organisation de la communauté « données ».', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de projets/programmes lancés autour de la donnée (capacité à évangéliser).', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Conclusions du rapport d’audit sur l’application de la politique des données.', NULL, 2002);
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
-- Parcours professionnel : Bac + 5 ou Bac + 6 écoles d’ingénieurs, de commerce, gestion, marketing, management, statistiques avec plusieurs années d’expérience professionnelle sur des fonctions transverses.
-- Tendances et facteurs d’évolution : Évolution vers des postes avec une dimension leadership forte.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Data Engineer', 'Le Data Engineer développe, construit et maintient des infrastructures de données d’un point de vue système et sécurité. Il s’assure de la collecte, du stockage et de l’exploitation des flux de données répondant aux enjeux de l’entreprise. Il est garant de l’accès qualitatif des sources de données qui viennent alimenter le Data Lake afin d’en faciliter l’exploitation par les équipes de Data Science. Il définit également la structure des métadonnées.', 'Le Data Engineer développe, construit et maintient des infrastructures de données d’un point de vue système et sécurité. Il s’assure de la collecte, du stockage et de l’exploitation des flux de données répondant aux enjeux de l’entrepris...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Data Engineer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Infrastructures de données — Cartographie et documente les sources de données.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Infrastructures de données — Assure la maintenance des différentes applications données (Data) déployées en production et des infrastructures.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Infrastructures de données — Conçoit les solutions permettant le traitement de volumes importants de flux de données et ceci en toute sécurité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Infrastructures de données — Structure les bases de données (sémantique, format, etc.).', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Infrastructures de données — Contribue à la gestion des référentiels de données.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration des données — Capte et stocke, en toute sécurité, les données (structurées ou non) produites dans les différentes applications ou venant de l’extérieur de l’entreprise.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration des données — Assure la supervision et l’intégration des données de diverses nature qui proviennent de sources multiples. Vérifie la qualité des données qui entrent dans le Data Lake et s’assure de leur sécurité.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intégration des données — Nettoie la donnée (élimination des doublons…) et la valide pour une utilisation aval.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Animation des communautés — Anime la communauté technique qui met en œuvre les dispositifs prévus ou nécessaires à l’application de la politique de la donnée de l’entreprise.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille technologique — Reste en alerte sur les technologies liées au traitement de la manipulation de la donnée et identifie les solutions utilisables.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Veille technologique — Propose des évolutions pour les infrastructures et solutions de données en place.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Dossier d’architecture (ou cadre technique) des solutions (plateformes) de traitement des données.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Un data lake adapté aux besoins actuels et futurs de l’entreprise.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Une cartographie des données.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Les éléments permettant de garantir la qualité de la donnée.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Volume et richesse du Data Lake.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Rapidité de la mise à disposition de la donnée.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Qualité de la donnée.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de rejet (plus il est faible meilleur c’est).', NULL, 2004);
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
-- Parcours professionnel : Bac + 2/3 (DUT/BUT BTS informatique), développeur Bac + 5 ou en statistiques et mathématiques. École d’ingénieur ou master spécialisé dans la science de la donnée (data science). Doit maîtriser Scala, Python, Kafka, Spark, Hadoop ; avec en option, une bonne maîtrise de l’analyse de données, de l’intelligence artificielle ou des méthodes fondamentales en data science.
-- Tendances et facteurs d’évolution : Vers la fonction de data scientiste (voir la fiche 8.1 de la Nomenclature du Cigref). Expertise technique sur la donnée.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Délégué à la protection des données (DPO)', 'Le DPO est la personne chargée de la protection des données au sein d’une organisation. Il est désigné dans les conditions prévues par la réglementation en vigueur, est indépendant et ne reçoit pas d’instructions de son employeur. Le DPO est un point de contact de l’entreprise à l’égard de l’Autorité de Contrôle (la CNIL). Dans la réalisation de ses missions, il prend en considération les risques afférents à la nature, la portée, les finalités et le contexte des traitements réalisés dans son entreprise, sur le périmètre pour lequel il a été désigné. Sa fonction peut s’exercer sur différents domaines, tels que la stratégie, le juridique, le marketing, l’innovation, les SI, l’efficacité opérationnelle et la gestion du patrimoine informationnel. Il travaille à minima en synergie avec le Chief Data Officer et le DSI.', 'Le DPO est la personne chargée de la protection des données au sein d’une organisation. Il est désigné dans les conditions prévues par la réglementation en vigueur, est indépendant et ne reçoit pas d’instructions de son employeur. Le DPO...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Délégué à la protection des données (DPO)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Information — Informe et conseille son entreprise, ses dirigeants et responsables et équipes opérationnelles sur les obligations qui leur incombent en vertu de la réglementation et des dispositions en vigueur en matière de protection des données à caractère personnel.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle de la conformité — Veille à la mise en œuvre des mesures appropriées pour permettre de démontrer que les traitements de données à caractère personnel effectués par l’entreprise sont conformes à la règlementation.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle de la conformité — Veille à la bonne application du principe de protection des données dès la conception et par défaut (Privacy by Design) dans tous les projets comportant un traitement de données personnelles.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle de la conformité — Pilote la production et la mise en œuvre de politiques, de lignes directrices, de procédures et de règles de contrôle de l’application du RGPD.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle de la conformité — S’assure que le registre des traitements des données à caractère personnel soit tenu et à jour.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contrôle de la conformité — De manière générale a en charge le suivi de l’évolution réglementaire quant à la protection des données personnelles.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyses d''impact sur la vie privée — Procède aux analyses d’impacts et de risques sur les données.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyses d''impact sur la vie privée — Apporter les conseils nécessaires en ce qui concerne les analyses d’impact sur la protection des données personnelles.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyses d''impact sur la vie privée — Vérifie l’exécution des AIPD (Analyse d’Impact sur la Protection des Données ou PIA - Private Impact Assesment) selon la réglementation .', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes, formation — S’assure du bon traitement de l’exercice de leurs droits par les personnes concernées par les traitements de données à caractère personnel.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes, formation — Conseille et forme les acteurs SI au respect de la réglementation en vigueur.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et support auprès des équipes, formation — Conseille les métiers sur les processus et les procédures à mettre en place, à tous les stades de l’utilisation des données, pour que soit garanti le respect de la vie privée, la confidentialité des données clients et celles des salariés, le respect des règles de sécurité de l’information.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Plan d’audit.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Directives sur la politique d’application de la réglementation .', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Préconisations et recommandations en matière de gestion des données personnelles suite à une intervention de la CNIL.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de recours.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de réalisation des audits.', NULL, 2002);
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
-- Parcours professionnel : Le DPO peut venir de toute fonction dès lors que la personne a une très bonne connaissance des enjeux de l’entreprise et de son organisation.
-- Tendances et facteurs d’évolution : Le conseil, l’audit, le juridique et éventuellement la RSE sont des domaines vers lesquels un DPO peut évoluer.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Manager de contrats', 'À la croisée des domaines juridique, financier et opérationnel, il optimise le programme d’achats de la DSI : • En garantissant la compétitivité et l’équité des contrats signés. • En assurant le suivi opérationnel de la relation fournisseurs (éditeurs, prestataires). • Ainsi que l’efficience de la politique de sous-traitance informatique. Il définit et met en œuvre la stratégie de performance des contrats au regard de leur cycle de vie ; il met en place et assure le suivi des indicateurs de l’activité contractuelle. Son périmètre d’action comprend (hors licences gérées par le SAM) les prestations informatiques techniques ou intellectuelles (éditeurs, constructeurs, distributeurs, conseil.), la sous-traitance applicative ou technique, la Tierce Maintenance Applicative (TMA) et l’infogérance de moyens.', 'À la croisée des domaines juridique, financier et opérationnel, il optimise le programme d’achats de la DSI : • En garantissant la compétitivité et l’équité des contrats signés. • En assurant le suivi opérationnel de la relation fourniss...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Manager de contrats' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Contribue à la mise en place des processus de sourcing et d’achat des prestations informatiques et contrôle leur application et l’efficience de leur réalisation.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Stratégie — Évaluer les opportunités (économiques, organisationnelles, politiques.) pour améliorer la performance des contrats.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Participe au cycle de vie (établissement, avenants, (re)négociations, terminaison.) des contrats IT.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Participe à la formalisation des contrats et assiste les prescripteurs dans l’élaboration des cahiers des charges.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Contribue et participe aux négociations et à la conduite des appels d''offres avec les partenaires internes ou externes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Organise et anime les Comités contractuels avec les fournisseurs majeurs.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Gère les obligations contractuelles, financières et liées au risque.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — S’assure du bon déroulement des contrats et du respect du cadre de référence (PAQ, PRA, Plan sécurité, accessibilité etc.).', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Pilote les prescriptions techniques en lien avec les partenaires internes, pendant la phase d’élaboration des contrats.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Alimente et consolide les tableaux de bord.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Alerte la direction en cas de dérives et propose des axes de progrès.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et analyse — En lien avec toutes les parties prenantes, il analyse les besoins émanant des projets et les qualifie.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conseil et analyse — Assure une veille technologique sur les outils en relation avec son activité de performance et d’optimisation.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Indicateurs et tableaux de bord.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre d’avenants signés.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de dossiers contentieux.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de gestion de crise gérées.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Maintien de la trajectoire financière.', NULL, 2004);
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
-- Parcours professionnel : Bac + 5 avec 5 à 10 ans d’expérience. Personnes issues de formation/parcours juridiques ou acheteurs ; ou venant de l’IT mais ayant une expérience dans le management de contrats.
-- Tendances et facteurs d’évolution : Recherche d’agilité de plus en plus forte dans les contrats pour une adaptation plus facile et rapide à l’activité réelle. Ce profil métier existe au sein de la DSI mais sa définition est basée sur la fonction Achat groupe.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Acheteur IT', 'Il garantit la compétitivité et l’équité des contrats signés avec les éditeurs, constructeurs et prestataires de services informatiques. Il veille au respect du processus achats et à l’équilibre des relations clients-fournisseurs. À ce titre, il négocie les prix, les termes et conditions et les contrats des biens et services IT acquis ou souscrits par l’entreprise. Il pilote et anime les relations économiques et commerciales avec les fournisseurs, accompagne et conseille ses clients internes. Il assure une veille marché, réglementaire et technologique dans l’intérêt de l’entreprise et des clients internes.', 'Il garantit la compétitivité et l’équité des contrats signés avec les éditeurs, constructeurs et prestataires de services informatiques. Il veille au respect du processus achats et à l’équilibre des relations clients-fournisseurs. À ce t...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Acheteur IT' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Analyse et étudie les contrats entrant dans son périmètre et analyse les risques fournisseurs.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Négocie les contrats en relation avec les experts techniques de la DSI / Direction du Digital et le Département Juridique.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Communique et suit les déploiements des accords auprès des clients internes et des utilisateurs.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion des contrats — Informe le management sur les principaux contrats, les échéances et les risques associés.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Processus achats — Prépare et construit, en lien avec les équipes opérationnelles, des consultations (RFI, RFP, RFQ).', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Processus achats — Procède au sourcing et à l’identification des prestataires.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Processus achats — Prépare et anime les consultations et les soutenances.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Processus achats — Construit des grilles d’analyse et évalue les offres techniques, fonctionnelles et commerciales.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Processus achats — Pilote les négociations (gré à gré ou dans le cadre des consultations).', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Processus achats — Participe au processus de décision et de choix des fournisseurs et à la contractualisation.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage, performance et spend management — Gestion des relations fournisseurs : analyse des reportings, revue des contrats et des dépenses, organisation et animation des réunions de suivi des fournisseurs clefs.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage, performance et spend management — Analyse des dépenses pour sa catégorie : collecte et analyse des dépenses par fournisseur et par catégorie, produit des analyses et des synthèses.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage, performance et spend management — Suivi régulier des performances achats : production des indicateurs clefs.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage, performance et spend management — Participe ou pilote les analyses de risques marché et fournisseurs.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage, performance et spend management — Assure une veille marché, technologique et réglementaire.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Pilotage, performance et spend management — Effectue des benchmark.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Documents de consultations (RFI, RFP, RFQ).', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Analyses et documents de synthèses : étude de risque, analyse de marché, audit fournisseur, notes de choix….', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Indicateurs de performance.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Montant sous gestion : en-cours, dépenses gérées par catégorie, par fournisseur.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Économies générées : coûts évités, réduction/optimisation des budgets, réductions des charges visibles dans le compte de résultats.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Panel fournisseurs : évolutions du nombre de fournisseurs.', NULL, 2003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Simplification : réduction du nombre de contrats, factures, transactions.', NULL, 2004);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des contrats' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Veille technologique' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3);
-- Parcours professionnel : Formation initiale : Bac + 2 à Bac +5. Filières universitaires : économie, gestion, scientifique, finance ou technique ; ou école de commerce ou d’ingénieur. Formation complémentaire : master 2 Achats. Expériences de type acheteur (autres catégories), ingénieur informaticien, chef de projet, juriste, contrôleur de gestion.
-- Tendances et facteurs d’évolution : Professionnalisation de la fonction pour répondre à la technicité et la diversité des solutions des contrats et des modèles économiques des fournisseurs IT et numériques, avec une spécialisation croissante des acheteurs : acheteur software, matériel, télécom, services …. Forte croissance de l’activité et des enjeux d’où une exposition de plus en plus forte des acheteurs IT en interne (famille stratégique). Meilleure acceptation de la fonction par les équipes IT.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Software Asset Manager (SAM)', 'Il s’assure de la conformité de l’installation logicielle de l’organisation, afin de réduire les risques liés aux audits éditeurs. Il optimise les usages et les coûts des licences, des maintenances et des services cloud. Il apporte également une expertise et un support à la DSI, à la direction achats et à la direction juridique dans leurs relations techniques et commerciales avec les éditeurs de logiciels.', 'Il s’assure de la conformité de l’installation logicielle de l’organisation, afin de réduire les risques liés aux audits éditeurs. Il optimise les usages et les coûts des licences, des maintenances et des services cloud. Il apporte égale...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Software Asset Manager (SAM)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conformité logicielle — Prévoit et coordonne les inventaires logiciels au sein de l’organisation (recensement et analyse des contrats et des licences/maintenances/abonnements acquis, inventaires des déploiements logiciels, des usages et des projets impactant les besoins).', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conformité logicielle — Garantit le maintien du référentiel des données de la gestion des licences.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conformité logicielle — Gère dès leur démarrage les audits éditeurs.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conformité logicielle — Collecte, vérifie et centralise les données d’inventaires.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conformité logicielle — Analyse la conformité : vérifie que les installations et les usages sont conformes aux droits acquis, aux contrats (en s’appuyant sur une bibliothèque de contrats - contrathèque - fournie par la Direction des achats) et aux règles de licensing des éditeurs.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conformité logicielle — Évalue les écarts et valorise les risques.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conformité logicielle — Propose des plans d’actions, en lien avec les équipes IT et achats pour réduire les risques et restaurer, le cas échéant, la conformité.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Optimisation — Optimise les achats de logiciels en évitant redondances et les manques par rapport aux besoins (minimise notamment le risque financier), et tient à jour les allocations / affectations des licences.', NULL, 8);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Optimisation — Pilote, en lien avec les fonctions IT et achats, la mise en œuvre des optimisations.', NULL, 9);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Optimisation — Identifie des leviers techniques, commerciaux, contractuels (cf. contrathèque) permettant de contrôler ou réduire les besoins en logiciels et/ou les coûts.', NULL, 10);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Optimisation — Évalue les économies associées à ces optimisations et les coûts éventuels de mises en œuvre ainsi que les impacts associés.', NULL, 11);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gestion de la demande — Accompagne les chefs de projets et les acheteurs pour chiffrer et optimiser les coûts d’acquisitions et les informer des modalités de comptage des licences et des coûts associés.', NULL, 12);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Négociation et gestion des fournisseurs — Participe (conseil et de facilitateur) aux négociations éditeurs et à la gestion des fournisseurs en support à la direction des achats.', NULL, 13);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organisation et gouvernance — Met en place les processus SAM et les interfaces avec les processus IT, achats existants.', NULL, 14);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organisation et gouvernance — Il coordonne les initiatives SAM internes à l’entreprise.', NULL, 15);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organisation et gouvernance — Pour les organisations matures : choisit, déploie et assure le maintien d’une solution logicielle SAM.', NULL, 16);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Feuille de route de la stratégie d’optimisation SAM.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Note de synthèse, dossier de synthèse expliquant les contrats, les règles éditeurs.', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Inventaires, analyse, bilan de conformité et gestion des risques et chiffrage des économies réalisées et/ou pénalités évitées.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Risques de non-conformité identifiés.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Économies générées (cash, cost avoidance).', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de couverture (%) des licences sous contrôle SAM.', NULL, 2003);
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
-- Parcours professionnel : Connaissance IT et maîtrise de l’anglais incontournables, disposant d’un goût prononcé et de compétences pour l’analyse de données, l’IT et les contrats. Métiers précédents liés à l’Audit IT, à l’achat IT, à la qualité et au conseil IT.
-- Tendances et facteurs d’évolution : Complexité croissante du métier du fait de la multiplication et de l’accumulation des règles, de l’augmentation des modes de licensing (licences perpétuelles, Services, cloud…) et de la recrudescence des audits des éditeurs. La part consacrée à l’analyse de données complexes (data science) augmente.

SET @famille_id = (SELECT id FROM famille_si WHERE nom='Relations fournisseurs' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES (@famille_id, 'Vendor Manager', 'Il s’inscrit dans une dynamique de transformation des organisations qui, de plus en plus, « achètent » au lieu de « faire », et a pour mission de maîtriser au mieux la relation avec les fournisseurs IT (en particulier les infogérants) dont le poids est croissant dans les organisations. Au confluent de la fonction Achats, du contrôle de gestion / finance et des entités technologiques de la DSI (aussi bien orientées « service delivery » que « expertise »), cette fonction vise trois objectifs majeurs : • Développer la « relation » avec les fournisseurs en définissant la gouvernance, en assurant la communication mutuelle sur chacune des organisations et en intervenant comme médiateur / facilitateur entre les intervenants. • Rendre opérationnelle la relation contractuelle issue des achats en intervenant comme « référent » sur les clauses opérationnelles : l’évolution du catalogue de prestations, le support aux demandes non standards et à leur négociation avec les fournisseurs, la communication sur les tarifs / indicateurs contractuels, …. • Piloter la relation « administrative et financière » avec les fournisseurs, en préparant les comités de pilotage des prestations, en suivant les tableaux de bord techniques et financiers ainsi que le respect des engagements de services, négociant les éventuelles pénalités, en complément des achats et avant l’intervention du juridique.', 'Il s’inscrit dans une dynamique de transformation des organisations qui, de plus en plus, « achètent » au lieu de « faire », et a pour mission de maîtriser au mieux la relation avec les fournisseurs IT (en particulier les infogérants) do...', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Vendor Manager' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des activités et des ressources allouées — Définit et met en œuvre des outils et méthodologies de suivi et benchmark de la performance de chaque fournisseur.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des activités et des ressources allouées — Définit et met en œuvre des outils et méthodologies de suivi des contrats et de gestion des licences.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Suivi des activités et des ressources allouées — Analyse les usages et anticipe les besoins des métiers pour adapter au mieux les achats futurs et anticiper les discussions avec les fournisseurs.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication et accompagnement du changement — Est proactif dans le suivi des usages, alerte SI besoin les utilisateurs sur les usages inadaptés et prévoit les ajustements nécessaires avec les fournisseurs.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication et accompagnement du changement — Communique vers les équipes IT et les métiers.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication et accompagnement du changement — Est « orienté client ».', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Communication et accompagnement du changement — Sait gérer les éventuels conflits avec les fournisseurs.', NULL, 7);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Notes sur l’évolution des fournisseurs et des marchés, issus d’une veille continue.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Dossier de suivi fournisseurs (vision globale sur les fournisseurs, sa stratégie, son business, avec l’entreprise, passé, présent et futur).', NULL, 1002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Revue de fournisseur.', NULL, 1003);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Balance scorecard.', NULL, 1004);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Ranking du fournisseur.', NULL, 1005);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Enquête de satisfaction fournisseur.', NULL, 2001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de couverture des fournisseurs stratégiques.', NULL, 2002);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Indicateurs de la Balance scorecard.', NULL, 2003);
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
-- Parcours professionnel : Bac + 5 école d’ingénieur ou école de commerce avec un focus IT / numérique. MBA ou Executive MBA ou tout autre titre dans le domaine des achats et de la gestion des fournisseurs est un plus.
-- Tendances et facteurs d’évolution : Il peut potentiellement y avoir un rapprochement du métier avec les contrats manager ou avec la gouvernance des achats. Cette nouvelle fonction, qui nécessite à la fois des compétences techniques pour comprendre le contenu des prestations fournies, mais également des compétences de pilotage et de management, complété par un bon savoir-faire relationnel / diplomatique, ouvre de réelles perspectives RH pour des chefs de projets, managers, software asset managers ou intervenants « service management ».

 

-- ============================================================
-- AJOUTS COMPLEMENTAIRES AU REFERENTIEL METIERS SI
-- Metiers emergents / modernes coherents avec le projet ASINHPA
-- ============================================================

-- Competences SI complementaires
INSERT INTO competence_si (nom, description) VALUES ('Cloud computing', 'Conception, déploiement et exploitation de services cloud.');
INSERT INTO competence_si (nom, description) VALUES ('Infrastructure as Code', 'Provisionnement et gestion d’infrastructures par le code.');
INSERT INTO competence_si (nom, description) VALUES ('Conteneurisation et orchestration', 'Maîtrise des conteneurs et des orchestrateurs de type Kubernetes.');
INSERT INTO competence_si (nom, description) VALUES ('Observabilité et monitoring', 'Supervision, métriques, logs, traces et alerting.');
INSERT INTO competence_si (nom, description) VALUES ('Recherche utilisateur', 'Recueil et analyse des besoins, usages et irritants des utilisateurs.');
INSERT INTO competence_si (nom, description) VALUES ('Prototypage d’interfaces', 'Conception de wireframes, maquettes et prototypes interactifs.');
INSERT INTO competence_si (nom, description) VALUES ('Design system', 'Conception et maintien de composants et règles de design réutilisables.');
INSERT INTO competence_si (nom, description) VALUES ('Sécurité applicative', 'Intégration des exigences de sécurité dans le cycle de développement.');
INSERT INTO competence_si (nom, description) VALUES ('Optimisation des coûts cloud', 'Pilotage, analyse et optimisation des coûts des services cloud.');
INSERT INTO competence_si (nom, description) VALUES ('MLOps et mise en production IA', 'Industrialisation, déploiement et supervision des modèles d’intelligence artificielle.');
INSERT INTO competence_si (nom, description) VALUES ('Modélisation de données', 'Conception des modèles conceptuels, logiques et physiques de données.');
INSERT INTO competence_si (nom, description) VALUES ('Transformation de données analytiques', 'Transformation, structuration et fiabilisation de données pour l’analyse.');
INSERT INTO competence_si (nom, description) VALUES ('Qualité des données', 'Définition des règles, contrôles et indicateurs de qualité des données.');
INSERT INTO competence_si (nom, description) VALUES ('Ingénierie de la fiabilité', 'Conception de systèmes robustes, résilients et hautement disponibles.');

-- ============================================================
-- 3. CYCLE DE VIE DES APPLICATIONS
-- ============================================================

-- DevOps
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'DevOps', 'Il automatise, sécurise et fiabilise le cycle de vie des applications, du développement à la production, en fluidifiant la collaboration entre les équipes de développement et d’exploitation.', 'Automatise, sécurise et fiabilise le cycle de vie des applications.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='DevOps' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place et maintient les pipelines d’intégration et de déploiement continus.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Automatise la construction, les tests, le packaging et la mise en production des applications.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Industrialise l’infrastructure et les configurations par le code.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Administre les environnements conteneurisés et leurs outils d’orchestration.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Supervise la disponibilité, la performance et la stabilité des services applicatifs.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Collabore avec les équipes de développement, de sécurité et d’exploitation pour réduire le time-to-market.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Pipelines CI/CD, scripts d’automatisation, documentation d’exploitation.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Fréquence de déploiement, taux d’échec des changements, temps moyen de restauration.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception et développement d''applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Intégration des composants' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Infrastructure as Code' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conteneurisation et orchestration' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Observabilité et monitoring' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 1, 6);

-- UX Designer
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Cycle de vie des applications' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'UX Designer', 'Il conçoit des expériences utilisateurs utiles, utilisables, accessibles et cohérentes, en s’appuyant sur la recherche utilisateur et sur une démarche de conception centrée utilisateur.', 'Conçoit des expériences utilisateurs utiles, accessibles et cohérentes.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='UX Designer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Recueille les besoins utilisateurs et analyse les parcours, usages et irritants.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conçoit les parcours, wireframes, maquettes et prototypes des interfaces.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Organise et exploite les tests utilisateurs pour améliorer les interfaces.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intègre les exigences d’accessibilité, d’ergonomie et d’éco-conception dès l’amont.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille avec les métiers, product owners et développeurs pour garantir la cohérence produit.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la structuration et à l’évolution d’un design system.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Parcours utilisateurs, wireframes, maquettes, prototypes, règles UX.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de satisfaction utilisateur, taux de succès sur tâche, réduction des irritants UX.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Expérience utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Recherche utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Prototypage d’interfaces' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Design system' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);

-- ============================================================
-- 4. MISE A DISPOSITION ET MCO DES INFRASTRUCTURES
-- ============================================================

-- Cloud Engineer
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'Cloud Engineer', 'Il conçoit, déploie, sécurise et exploite les infrastructures cloud nécessaires au fonctionnement des services numériques et à leur montée en charge.', 'Conçoit, déploie et exploite des infrastructures cloud sécurisées et robustes.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Cloud Engineer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Déploie et administre les ressources cloud nécessaires aux applications et aux données.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Automatise le provisionnement des infrastructures et des configurations.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en œuvre les mécanismes de sécurité, de sauvegarde, de reprise et de haute disponibilité.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Surveille la performance, la capacité et les incidents des services cloud.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Optimise les coûts, les performances et l’usage des ressources cloud.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne les équipes projets dans l’adoption des services cloud.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Architecture cible cloud, scripts IaC, documentation d’exploitation, tableaux de bord de supervision.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Disponibilité, coût mensuel maîtrisé, taux d’automatisation, temps de déploiement.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Cloud computing' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Infrastructure as Code' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des systèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Ingénierie des systèmes TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 1, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Optimisation des coûts cloud' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);

-- Site Reliability Engineer (SRE)
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'Site Reliability Engineer (SRE)', 'Il garantit la fiabilité, la disponibilité, la performance et la résilience des services numériques en production en s’appuyant sur l’automatisation et l’observabilité.', 'Garantit la fiabilité, la disponibilité et la résilience des services en production.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Site Reliability Engineer (SRE)' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et suit les objectifs de service, de disponibilité et de performance.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place les outils d’observabilité, d’alerting et d’analyse des incidents.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Automatise les opérations répétitives afin de réduire le travail manuel non créateur de valeur.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse les incidents, conduit les post-mortems et pilote les actions correctives.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Améliore la capacité, la résilience et la reprise sur incident des plateformes.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille avec les équipes de développement pour améliorer la qualité en production.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : SLO/SLI, tableaux de bord de fiabilité, rapports d’incident, plans de remédiation.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de disponibilité, MTTR, nombre d’incidents majeurs, respect des SLO.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Ingénierie de la fiabilité' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Observabilité et monitoring' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des systèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des problèmes' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Infrastructure as Code' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);

-- Platform Engineer
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'Platform Engineer', 'Il conçoit et maintient des plateformes internes standardisées permettant aux équipes de développement de déployer, exploiter et sécuriser plus rapidement leurs produits numériques.', 'Conçoit et maintient des plateformes internes pour accélérer les équipes de développement.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Platform Engineer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conçoit et maintient des plateformes internes de déploiement et d’exploitation.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Standardise les outils, templates, composants et pratiques techniques communs.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Automatise le provisionnement des environnements et des services partagés.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Documente et améliore l’expérience développeur sur la plateforme interne.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intègre la sécurité, l’observabilité et la conformité au niveau plateforme.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne les équipes produits dans l’adoption des services de plateforme.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Plateforme interne, catalogues de services, templates, documentation développeur.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Temps de mise à disposition d’un environnement, taux d’adoption plateforme, satisfaction développeurs.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Cloud computing' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Infrastructure as Code' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conteneurisation et orchestration' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Observabilité et monitoring' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 6);

-- FinOps Engineer
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Mise à disposition et maintenance en condition opérationnelle des infrastructures' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'FinOps Engineer', 'Il optimise la valeur économique des services cloud en pilotant les coûts, les usages et les arbitrages entre ingénierie, finance et métiers.', 'Optimise la valeur économique des services cloud et pilote les coûts.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='FinOps Engineer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Analyse les dépenses cloud et identifie les leviers d’optimisation.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Produit des reportings de coûts, d’usage et de consommation par service ou entité.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit et suit les règles de gouvernance FinOps et de tagging.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne les équipes techniques dans le right-sizing et l’optimisation des ressources.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille avec la finance et les métiers pour fiabiliser les prévisions budgétaires.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place des indicateurs de coût unitaire et de valeur produite.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Tableaux de bord de coûts cloud, rapports d’optimisation, règles de gouvernance FinOps.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Coût cloud optimisé, taux de couverture du tagging, précision des prévisions budgétaires.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Cloud computing' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Optimisation des coûts cloud' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion des risques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la relation client' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);

-- ============================================================
-- 6. SECURITE
-- ============================================================

-- DevSecOps
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Sécurité' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'DevSecOps', 'Il intègre la sécurité dans l’ensemble du cycle de vie applicatif, des développements aux déploiements, en automatisant les contrôles et en accompagnant les équipes techniques.', 'Intègre la sécurité dans l’ensemble du cycle de vie applicatif.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='DevSecOps' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Intègre les contrôles de sécurité dans les pipelines de développement et de déploiement.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Automatise les analyses de vulnérabilités, de dépendances et de configurations.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les exigences de sécurité applicative et accompagne leur mise en œuvre.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Sécurise la gestion des secrets, identités, certificats et accès techniques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille avec les équipes sécurité, développement et infrastructure pour réduire le risque.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la remédiation et à l’amélioration continue de la posture de sécurité.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Règles de sécurité applicative, contrôles automatisés, rapports de vulnérabilités.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Nombre de vulnérabilités critiques, délai moyen de correction, taux de couverture des contrôles.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Sécurité applicative' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Développement d''une stratégie de sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Infrastructure as Code' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);

-- ============================================================
-- 8. DONNEES
-- ============================================================

-- ML Engineer
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'ML Engineer', 'Il industrialise, déploie et maintient les modèles de machine learning dans des environnements de production fiables, sécurisés et observables.', 'Industrialise, déploie et maintient les modèles de machine learning en production.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='ML Engineer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prépare les pipelines d’entraînement, de validation et de déploiement des modèles.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en production les modèles et les expose dans des services utilisables par les applications.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Surveille les performances techniques et fonctionnelles des modèles en production.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Automatise le versioning, les tests et les déploiements des artefacts IA.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille avec les data scientists et les data engineers pour fiabiliser la chaîne de valeur IA.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Gère les problématiques de dérive, de traçabilité et de reproductibilité.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Pipelines ML, services de mise en production, tableaux de suivi des modèles.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Temps de mise en production, disponibilité des services IA, taux de dérive détectée.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Science des données et analyse' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='MLOps et mise en production IA' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Déploiement de la solution' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Observabilité et monitoring' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la qualité des TIC' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);

-- Data Architect
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'Data Architect', 'Il conçoit l’architecture des données de l’organisation, garantit leur cohérence, leur urbanisation et leur intégration avec les applications et plateformes.', 'Conçoit l’architecture des données et garantit leur cohérence.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Data Architect' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Définit les principes d’architecture des données et leur trajectoire d’évolution.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Conçoit les modèles de données conceptuels, logiques et physiques.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Assure la cohérence entre les flux, référentiels, applications et plateformes de données.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue aux choix de solutions de stockage, d’échange et de valorisation des données.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Prend en compte les exigences de sécurité, de confidentialité et de qualité des données.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Accompagne les équipes projets dans la mise en œuvre des standards de données.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Cartographie des flux de données, modèles de données, standards d’architecture.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Taux de conformité aux standards, qualité de modélisation, réduction des redondances.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Conception de l''architecture' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Modélisation de données' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 5, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gouvernance des systèmes d''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Qualité des données' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Gestion de la sécurité de l''information' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);

-- Analytics Engineer
SET @famille_id = (SELECT id FROM famille_si WHERE nom='Données' LIMIT 1);
INSERT INTO metier_si (famille_id, titre, description, mission_courte, actif) VALUES
(@famille_id, 'Analytics Engineer', 'Il transforme, teste, documente et met à disposition des jeux de données fiables, compréhensibles et exploitables par les équipes métiers et analytiques.', 'Transforme et fiabilise les données pour l’analyse et les usages métiers.', 1);
SET @metier_id = (SELECT id FROM metier_si WHERE famille_id=@famille_id AND titre='Analytics Engineer' LIMIT 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Construit les modèles de données analytiques et les datasets prêts à l’usage.', NULL, 1);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Transforme, teste et documente les données utilisées dans les tableaux de bord et analyses.', NULL, 2);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Travaille avec les métiers et analystes pour comprendre les besoins de restitution.', NULL, 3);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Met en place des contrôles et alertes de qualité des données analytiques.', NULL, 4);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Industrialise les transformations de données avec des pratiques d’ingénierie logicielle.', NULL, 5);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Contribue à la gouvernance et à la lisibilité du patrimoine de données analytiques.', NULL, 6);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'Livrable : Modèles analytiques, jeux de données documentés, règles de tests et de qualité.', NULL, 1001);
INSERT INTO activite_si (metier_id, libelle, description, ordre) VALUES (@metier_id, 'KPI : Fiabilité des datasets, délai de mise à disposition, taux d’échec des tests de données.', NULL, 2001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Transformation de données analytiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Qualité des données' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 1, 2);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Production de la documentation' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Science des données et analyse' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 4);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Identification des besoins' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 5);

-- ============================================================
-- COMPLEMENTS ANAP / SANTE NUMERIQUE : AJOUTS DE COMPETENCES SI
-- ET LIAISONS AUX METIERS CIGREF / METIERS MODERNES EXISTANTS
-- ============================================================

INSERT INTO competence_si (nom, description) VALUES ('Archivage des données informatiques', 'Capacité à définir, organiser et mettre en œuvre les règles d’archivage, de conservation, de traçabilité et de restitution des données et documents numériques.');
INSERT INTO competence_si (nom, description) VALUES ('Pilotage de l’exploitation des systèmes, réseaux et applications', 'Capacité à organiser, superviser et améliorer l’exploitation courante des systèmes, réseaux et applications en garantissant disponibilité, qualité de service et continuité.');
INSERT INTO competence_si (nom, description) VALUES ('Préparation, installation et configuration des systèmes, réseaux et applications', 'Capacité à préparer, installer, paramétrer et mettre en service des composants techniques ou applicatifs dans le respect des exigences de sécurité, d’interopérabilité et de qualité.');
INSERT INTO competence_si (nom, description) VALUES ('Tests et analyse des performances', 'Capacité à préparer, exécuter et analyser des tests techniques, fonctionnels ou de performance afin de valider le bon fonctionnement et la robustesse des solutions.');
INSERT INTO competence_si (nom, description) VALUES ('Maintenance corrective, évolutive et préventive du SI', 'Capacité à assurer la maintenance des composants du système d’information afin de corriger les anomalies, faire évoluer les solutions et prévenir les défaillances.');
INSERT INTO competence_si (nom, description) VALUES ('Qualification des demandes d’assistance utilisateur', 'Capacité à recueillir, qualifier, prioriser et orienter les demandes d’assistance ou incidents utilisateurs pour en assurer un traitement adapté.');
INSERT INTO competence_si (nom, description) VALUES ('Audit et contrôle de la sécurité du SI', 'Capacité à évaluer le niveau de sécurité du système d’information, à contrôler l’application des règles de sécurité et à formuler des actions correctives.');
INSERT INTO competence_si (nom, description) VALUES ('Sauvegarde des données et dispositifs de secours', 'Capacité à définir, mettre en œuvre et contrôler les mécanismes de sauvegarde, de restauration et de secours nécessaires à la résilience du système d’information.');

-- Gestionnaire d’applications
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Gestionnaire d’applications' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Pilotage de l’exploitation des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Maintenance corrective, évolutive et préventive du SI' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Qualification des demandes d’assistance utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3003);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests et analyse des performances' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3004);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Archivage des données informatiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3005);

-- Chargé d’affaires internes
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Chargé d’affaires internes' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Qualification des demandes d’assistance utilisateur' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Pilotage de l’exploitation des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3002);

-- Consultant en systèmes d’information
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Consultant en systèmes d’information' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Archivage des données informatiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Audit et contrôle de la sécurité du SI' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3002);

-- Urbaniste des systèmes d’information
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Urbaniste des systèmes d’information' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Archivage des données informatiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3001);

-- Responsable du système d’information « métier »
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Responsable du système d’information « métier »' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Pilotage de l’exploitation des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Archivage des données informatiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Audit et contrôle de la sécurité du SI' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3003);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Sauvegarde des données et dispositifs de secours' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3004);

-- Architecte d’entreprise
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Architecte d’entreprise' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Archivage des données informatiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Sauvegarde des données et dispositifs de secours' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3002);

-- DevOps
SET @metier_id = (SELECT id FROM metier_si WHERE titre='DevOps' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests et analyse des performances' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Maintenance corrective, évolutive et préventive du SI' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Pilotage de l’exploitation des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3003);

-- Cloud Engineer
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Cloud Engineer' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Préparation, installation et configuration des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests et analyse des performances' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Sauvegarde des données et dispositifs de secours' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3003);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Pilotage de l’exploitation des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3004);

-- Site Reliability Engineer (SRE)
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Site Reliability Engineer (SRE)' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests et analyse des performances' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Maintenance corrective, évolutive et préventive du SI' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Sauvegarde des données et dispositifs de secours' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3003);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Pilotage de l’exploitation des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3004);

-- Platform Engineer
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Platform Engineer' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Préparation, installation et configuration des systèmes, réseaux et applications' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests et analyse des performances' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Maintenance corrective, évolutive et préventive du SI' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3003);

-- DevSecOps
SET @metier_id = (SELECT id FROM metier_si WHERE titre='DevSecOps' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Audit et contrôle de la sécurité du SI' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 4, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Tests et analyse des performances' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3002);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Sauvegarde des données et dispositifs de secours' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3003);

-- Data Architect
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Data Architect' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Archivage des données informatiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3001);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Sauvegarde des données et dispositifs de secours' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 3, 0, 3002);

-- Analytics Engineer
SET @metier_id = (SELECT id FROM metier_si WHERE titre='Analytics Engineer' LIMIT 1);
SET @competence_id = (SELECT id FROM competence_si WHERE nom='Archivage des données informatiques' LIMIT 1);
INSERT INTO metier_competence_si (metier_id, competence_id, niveau_requis, obligatoire, ordre) VALUES (@metier_id, @competence_id, 2, 0, 3001);

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
  -- ============================================================
-- FORMATIONS SANTE NUMERIQUE COMPLEMENTAIRES
-- Interopérabilité, INS / identitovigilance, e-santé, RGPD
-- ============================================================

-- ANS-Formation - Parcours e-santé
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'ANS-Formation - Parcours e-santé',
  'Plateforme e-learning de l’Agence du Numérique en Santé. Couvre les grands sujets de la doctrine du numérique en santé, notamment INS, cybersécurité, données de santé, interopérabilité et usages en établissement.',
  'https://esante.gouv.fr/se-former-a-la-e-sante',
  'Agence du Numérique en Santé'
WHERE NOT EXISTS (
  SELECT 1 FROM formation WHERE nom = 'ANS-Formation - Parcours e-santé'
);

-- Formation FHIR - Module 1
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Formation FHIR - Module 1 : Vue d''ensemble, documentation et outils',
  'Formation Interop''Santé dédiée à l’introduction au standard HL7 FHIR, à sa documentation et à ses outils. Pertinente pour l’interopérabilité santé, les standards d’échange et l’intégration de services numériques de santé.',
  'https://www.interopsante.org/formations',
  'Interop''Santé'
WHERE NOT EXISTS (
  SELECT 1 FROM formation WHERE nom = 'Formation FHIR - Module 1 : Vue d''ensemble, documentation et outils'
);

-- Formation FHIR - Module 2
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Formation FHIR - Module 2 : Ressources et API',
  'Formation Interop''Santé centrée sur les ressources FHIR et les API. Pertinente pour la mise en œuvre technique des échanges de données de santé et des services REST conformes aux référentiels nationaux.',
  'https://www.interopsante.org/formations',
  'Interop''Santé'
WHERE NOT EXISTS (
  SELECT 1 FROM formation WHERE nom = 'Formation FHIR - Module 2 : Ressources et API'
);

-- Formation HL7 v2.5 / IHE PAM
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Formation HL7 v2.5 / IHE PAM',
  'Formation Interop''Santé sur le standard HL7 v2.5 avec focus sur le profil IHE PAM (Patient Administration Management). Très pertinente pour les flux inter-applicatifs, l’identité patient et l’interopérabilité des SI de santé.',
  'https://www.interopsante.org/les-formations',
  'Interop''Santé'
WHERE NOT EXISTS (
  SELECT 1 FROM formation WHERE nom = 'Formation HL7 v2.5 / IHE PAM'
);

-- Référentiel INS et déploiement INS
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'Référentiel INS et déploiement INS',
  'Ressources ANS autour de l’Identité Nationale de Santé, de son intégration et du déploiement de la solution chez les utilisateurs. Pertinent pour INS, identité patient et identitovigilance.',
  'https://esante.gouv.fr/ens/offre/referentiel-ins',
  'Agence du Numérique en Santé'
WHERE NOT EXISTS (
  SELECT 1 FROM formation WHERE nom = 'Référentiel INS et déploiement INS'
);

-- L''Atelier RGPD
INSERT INTO formation (nom, description, url, organisme)
SELECT
  'L''Atelier RGPD',
  'MOOC gratuit de la CNIL pour comprendre et appliquer le RGPD. Couvre notions clés, principes, responsabilités, outils de conformité et mise en pratique. Pertinent pour protection des données de santé, conformité et analyses d’impact.',
  'https://www.cnil.fr/fr/comprendre-le-rgpd/le-mooc-de-la-cnil',
  'CNIL'
WHERE NOT EXISTS (
  SELECT 1 FROM formation WHERE nom = 'L''Atelier RGPD'
);

-- ============================================================
-- LIAISONS FORMATION / COMPETENCES
-- ============================================================

-- Liaison compétences / ANS-Formation - Parcours e-santé
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Interopérabilité des systèmes de santé'
WHERE f.nom = 'ANS-Formation - Parcours e-santé'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Référentiel national d’identité de santé (INS)'
WHERE f.nom = 'ANS-Formation - Parcours e-santé'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identitovigilance'
WHERE f.nom = 'ANS-Formation - Parcours e-santé'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des incidents de sécurité'
WHERE f.nom = 'ANS-Formation - Parcours e-santé'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Protection des données de santé et RGPD'
WHERE f.nom = 'ANS-Formation - Parcours e-santé'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Formation FHIR - Module 1
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Interopérabilité des systèmes de santé'
WHERE f.nom = 'Formation FHIR - Module 1 : Vue d''ensemble, documentation et outils'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Standards d’échange de données de santé'
WHERE f.nom = 'Formation FHIR - Module 1 : Vue d''ensemble, documentation et outils'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Formation FHIR - Module 2
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Interopérabilité des systèmes de santé'
WHERE f.nom = 'Formation FHIR - Module 2 : Ressources et API'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Standards d’échange de données de santé'
WHERE f.nom = 'Formation FHIR - Module 2 : Ressources et API'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des flux inter-applicatifs'
WHERE f.nom = 'Formation FHIR - Module 2 : Ressources et API'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Formation HL7 v2.5 / IHE PAM
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Standards d’échange de données de santé'
WHERE f.nom = 'Formation HL7 v2.5 / IHE PAM'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des flux inter-applicatifs'
WHERE f.nom = 'Formation HL7 v2.5 / IHE PAM'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de l’identité patient'
WHERE f.nom = 'Formation HL7 v2.5 / IHE PAM'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identitovigilance'
WHERE f.nom = 'Formation HL7 v2.5 / IHE PAM'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / Référentiel INS et déploiement INS
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Référentiel national d’identité de santé (INS)'
WHERE f.nom = 'Référentiel INS et déploiement INS'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion de l’identité patient'
WHERE f.nom = 'Référentiel INS et déploiement INS'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Identitovigilance'
WHERE f.nom = 'Référentiel INS et déploiement INS'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

-- Liaison compétences / L'Atelier RGPD
INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Protection des données de santé et RGPD'
WHERE f.nom = 'L''Atelier RGPD'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Analyse d’impact sur la protection des données'
WHERE f.nom = 'L''Atelier RGPD'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );

INSERT INTO formation_competence (formation_id, competence_id)
SELECT f.id, c.id
FROM formation f
JOIN competence_si c ON c.nom = 'Gestion des risques'
WHERE f.nom = 'L''Atelier RGPD'
  AND NOT EXISTS (
    SELECT 1 FROM formation_competence fc
    WHERE fc.formation_id = f.id AND fc.competence_id = c.id
  );