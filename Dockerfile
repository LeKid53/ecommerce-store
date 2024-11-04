# Étape 1 : Utiliser l'image node alpine
FROM node:22-alpine3.19 AS dev

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install --frozen-lockfile

# Copier le reste de l'application
COPY . .

# Passer les variables d'environnement
ARG NEXT_PUBLIC_API_URL
ENV NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL}
ENV NODE_ENV=development

# Exposer le port 3000 pour l'application Next.js
EXPOSE 3000

# Démarrer l'application en mode développement
CMD ["npm", "run", "dev"]