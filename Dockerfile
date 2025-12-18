# Utilisation de Python 3.11 Slim pour la légèreté
FROM python:3.11-slim

# --- COUCHE SYSTÈME (Tooling Layer) ---
# Installation de :
# 1. Tesseract-OCR : Pour l'ingestion des specs (PDF/Images) [cite: 17]
# 2. OpenJDK (Java) : Requis pour faire tourner plantuml.jar [cite: 57]
# 3. Graphviz : Requis par PlantUML pour le calcul du rendu graphique [cite: 66]
# 4. Curl : Pour télécharger le jar
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    default-jre \
    graphviz \
    curl \
    && rm -rf /var/lib/apt/lists/*

# --- COUCHE OUTILS ---
# Téléchargement du binaire PlantUML dans un dossier dédié
WORKDIR /tools
RUN curl -L https://github.com/plantuml/plantuml/releases/download/v1.2023.13/plantuml-1.2023.13.jar -o plantuml.jar

# --- COUCHE APPLICATION ---
WORKDIR /app

# Installation des dépendances Python
# On sépare le COPY requirements pour utiliser le cache Docker si le code change mais pas les libs
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie du code source
COPY ./app .

# Commande par défaut (à modifier selon votre fichier de lancement)
CMD ["python", "main.py"]