# Monorepo Spring Boot + React (Vite)

## Structure

```
Projet-tutore-RH
├─ backend      → API Spring Boot / Swagger / endpoints Ollama
├─ frontend     → application React + Vite
└─ pom.xml      → parent Maven
```

## Prérequis

- Node.js 18+ et npm 9+ pour le frontend.
- JDK 21 (obligatoire : la compilation Maven échoue sinon).
- Maven wrapper (`./mvnw`) inclus dans ce dépôt.
- (Optionnel) [Ollama](https://ollama.com/) si vous souhaitez utiliser l’IA locale pour classer les CV.

## Installation des dépendances frontend

```bash
cd frontend
npm install
```

Cette commande est à exécuter une seule fois (ou après un `git pull` qui ajoute de nouvelles dépendances).

## Lancer le frontend (Vite)

```bash
cd frontend
npm run dev
```

Par défaut, Vite sert l’application sur [http://localhost:5173](http://localhost:5173) avec rechargement à chaud.  
Le proxy défini dans `vite.config.ts` enverra les requêtes `/rest/**` vers le backend Spring Boot (port 8989), pensez donc à le démarrer aussi pour éviter les erreurs `ECONNREFUSED`.

## Lancer le backend Spring Boot

Depuis la racine du projet :

```bash
./mvnw --projects backend spring-boot:run
```

- L’API est disponible sur [http://localhost:8989](http://localhost:8989).
- Console H2 : [http://localhost:8989/h2-console](http://localhost:8989/h2-console)
- Swagger UI : [http://localhost:8989/swagger-ui/index.html](http://localhost:8989/swagger-ui/index.html)
- Endpoints Ollama : `/rest/ollama/status` et `/rest/ollama/warmup`

> ⚠️ Assurez-vous que `java -version` retourne bien une version 21+, sinon Maven refusera de compiler (`release version 21 not supported`).

## Utiliser l’IA locale (Ollama)

1. Installer Ollama et lancer le service :
   ```bash
   ollama serve
   ```
2. Option facultative mais recommandée : précharger le modèle Mistral dans un terminal séparé
   ```bash
   ollama run mistral
   ```
3. Dans l’interface (section “IA locale”), cliquez sur “Vérifier l’état d’Ollama” puis “Lancer / charger Mistral”.  
   L’indicateur passe au vert quand le backend confirme que le modèle est disponible.

Les consignes RH que vous tapez dans le champ prévu seront injectées dans le prompt envoyé à l’IA, directement depuis le frontend.

## Build complet

- Générer le frontend optimisé :
  ```bash
  cd frontend
  npm run build
  ```
- Construire le backend + copier le build front dans `src/main/resources/public` :
  ```bash
  ./mvnw clean install
  ```

Le package Spring Boot résultant embarque les assets du frontend (dossier `frontend/target/dist`) et peut être démarré seul sur le port 8989.

## Déploiement (rappel)

Le dépôt contient déjà un bouton “Deploy to Koyeb” pour publier rapidement l’application. Pensez simplement à fournir un JDK 21 sur l’environnement cible et, si vous voulez l’IA locale, à installer/configurer Ollama sur cette même machine.
