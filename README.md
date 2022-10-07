# elm server template

Permet de lancer un serveur web, sur le port par défaut 8080, pour distribuer un développement en [elm](https://elm-lang.org/)

Permet un lancement le serveur pour le développement ou en production.

## Initialisation du projet

Récupérer les sources depuis github :

```bash
git clone https://github.com/sergebesson/elm-server-template.git
rm -rf elm-server-template/.git
mv elm-server-template <mon projet>
cd <mon projet>
npm i
```

Et modifier votre `package.json` pour changer le nom du projet (attribut `name`)

Vous êtes prêt pour développer

## Lancement pour le développement

Pour changer le port du serveur, configurer la variable d'environnement `PORT`

### Pour compiler les sources [elm](https://elm-lang.org/)

```bash
npm run build:dev
```

### Pour lancer le serveur et surveiller quand les sources changent pour recompilation automatique

```bash
npm run start:dev
```

### Pour juste lancer le serveur en développement

```bash
npm run server:dev
```

## Lancement en production

1. on compile en production (option `--optimize`, minification et compression):  
   ```npm run build:prod```
1. on déploie le projet avec le répertoire `dist` et sans le répertoire `src`
1. on lance le serveur :   
   ```npm start```

Le port du serveur peut-être modifier via la variable d'environnement `PORT`, exemple :

```bash
PORT=8081 npm start
```
