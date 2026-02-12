# Observatoire LimeSurvey – Frontend

Application React 18 + TypeScript permettant d\'importer un export CSV LimeSurvey, de mapper les colonnes aux questions
et d\'obtenir une synthèse interactive (répartitions, classements, réponses libres). Aucun backend n\'est requis : toutes
les données restent dans le navigateur et le mapping est stocké dans `localStorage`.

## Stack

- [React 18](https://react.dev/) + [Vite](https://vitejs.dev/)
- TypeScript strict
- [Tailwind CSS](https://tailwindcss.com/) pour les composants UI
- [PapaParse](https://www.papaparse.com/) pour le parsing CSV robuste
- React Router pour la page principale et la page formations

## Fonctionnalités clés

1. **Import CSV**
   - Bouton "Importer un CSV" (exemples fournis dans `public/exemple.csv`).
   - Parsing avec PapaParse (`header: true`, `skipEmptyLines: greedy`).
2. **Mapping dynamique**
   - Détection automatique des colonnes disponibles.
   - Sélection de la colonne pour chaque question (Q1→Q13) + prise en charge des questions multi-choix en *colonne unique*
     (valeurs séparées par `; , |`) ou en *colonnes multiples* (valeurs `1/0`).
   - Mapping sauvegardé / rechargé depuis `localStorage`.
3. **Résultats analytiques**
   - Section 1 : Répartition Q1 / Q2 avec barres responsives.
   - Section 2 : Scoring Q3 (8 domaines) avec top 3 et accès aux formations + liste brute Q5.
   - Section 3 : Répartition Q8 / Q8bis, comptage Q7 / Q7bis (+ listes "Autres").
   - Section 4 : Listes brutes Q9/Q10 et répartition Q11.
   - Section 5 : Liste Q12 et répartition Q13.
   - Page `/formations/:slug` listant les formations statiques (`src/data/referentielFormations.json`).

## Scripts

Depuis `frontend/` :

```bash
npm install
npm run dev      # http://localhost:5173
npm run build    # build statique dans target/dist
npm run lint     # eslint sur fichiers TS/TSX
```

## Utilisation

1. Lancer `npm run dev` puis ouvrir `http://localhost:5173` dans VS Code ou le navigateur.
2. Importer un CSV LimeSurvey (ex : `public/exemple.csv`).
3. Mapper chaque question :
   - Q3 → sélectionner les 8 colonnes contenant les rangs (1 = le plus prioritaire).
   - Questions multi-choix (Q7, Q7bis, Q11, Q13) → choisir `Colonne unique` (séparateurs `; , |`) ou `Colonnes multiples`.
4. Cliquer sur **Valider le mapping** → les sections de résultats deviennent interactives.
5. Utiliser les boutons "Voir formations" pour afficher `FormationsPage` filtrée par domaine.

## Structure principale

```
frontend/
├── public/
│   └── exemple.csv
├── src/
│   ├── App.tsx
│   ├── main.tsx
│   ├── index.css
│   ├── components/
│   │   ├── FileImport.tsx
│   │   ├── MappingPanel.tsx
│   │   └── Results/
│   │       ├── CertificationsSection.tsx
│   │       ├── GeneralInfoSection.tsx
│   │       ├── PerspectivesSection.tsx
│   │       ├── RecruitmentSection.tsx
│   │       ├── ResultSection.tsx
│   │       └── SkillsNeedsSection.tsx
│   ├── data/referentielFormations.json
│   ├── pages/
│   │   ├── DashboardPage.tsx
│   │   └── FormationsPage.tsx
│   ├── types/survey.ts
│   └── utils/
│       ├── aggregate.ts
│       ├── csv.ts
│       ├── formations.ts
│       └── mapping.ts
```

## Exemple de mapping minimal

Le fichier `public/exemple.csv` propose :

- Q1/Q2 : colonnes `Organisation`, `Taille`.
- Q3 : colonnes `Développement`, `Architecture logicielle`, `Data / Analyse de données`, `UX/UI Design`,
  `RGPD / conformité réglementaire`, `Cybersécurité`, `Infrastructure`, `Management Projet, déploiement logiciels`.
- Q5, Q8, Q8bis, Q9, Q10, Q12 : colonnes texte dédiées.
- Q7, Q7bis, Q11, Q13 : colonnes uniques contenant des valeurs séparées par `;`.

Il suffit de reproduire cette structure pour réaliser un import rapide et visualiser le tableau de bord.
