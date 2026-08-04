# 🇯🇵 Séismes au Japon : de la routine sismique à Tohoku

Exploration et storytelling autour de 24 ans de données sismiques japonaises
(2000-2024), depuis l'API publique de l'USGS (US Geological Survey).

> 📄 **[Voir le rapport complet (HTML)](https://stephanekosmala.github.io/seismes-japon-r/analysis.html)**
> *(lien actif une fois GitHub Pages configuré — voir ci-dessous)*

## 🎯 Objectif

Le Japon est l'un des pays les plus sismiquement actifs au monde. Ce projet
explore la structure "normale" de son activité sismique, puis zoome sur
l'événement qui a marqué la période étudiée : le séisme de Tohoku
(11 mars 2011, magnitude 9.0) et la décroissance de ses répliques.

**Questions explorées :**
- À quoi ressemble la distribution habituelle des séismes (magnitude, profondeur) ?
- L'activité sismique est-elle stable dans le temps, ou marquée par des ruptures ?
- Comment se comportent les répliques après un séisme majeur ?

## 🔍 Points forts de l'analyse

- **EDA rigoureuse** : contrôle qualité complet (valeurs manquantes, doublons, valeurs aberrantes) avant toute interprétation
- **Storytelling structuré** : de la routine sismique à l'anomalie de 2011, avec vérification explicite des hypothèses alternatives
- **Validation empirique d'une loi physique** : la décroissance des répliques suit la loi d'Omori, visible directement sur les données réelles
- **Carte interactive** des répliques le long de la zone de subduction

## 🛠️ Stack technique

| Outil | Usage |
|---|---|
| `httr` / `jsonlite` | Requêtes API USGS et parsing JSON |
| `dplyr` / `tidyr` | Nettoyage et transformation des données |
| `ggplot2` | Visualisations statiques |
| `leaflet` | Carte interactive des épicentres |
| `rmarkdown` | Rapport reproductible (code + narration + résultats) |

## 📂 Structure du repo

```
seismes-japon-r/
├── JMA.R              # Script d'import des données (API USGS)
├── analysis.Rmd        # Rapport principal (EDA + storytelling)
├── analysis.html        # Rapport rendu, consultable sans R
├── data/
│   └── raw/            # Données brutes (non versionnées, régénérées via JMA.R)
└── .gitignore
```

## ▶️ Reproduire l'analyse

```r
# Installer les dépendances
install.packages(c("tidyverse", "sf", "httr", "jsonlite", "leaflet", "lubridate", "rmarkdown"))

# 1. Récupérer les données
source("JMA.R")

# 2. Générer le rapport
rmarkdown::render("analysis.Rmd")
```

## 📊 Source des données

[USGS Earthquake Catalog](https://earthquake.usgs.gov/earthquakes/search/) —
séismes de magnitude ≥ 4.5, zone géographique du Japon, 2000-2024.

## ⚠️ Limites

Le seuil de magnitude ≥ 4.5 exclut les nombreux petits séismes qui
représentent la majorité de l'activité sismique réelle. La zone
géographique interrogée (bounding box) inclut aussi des zones maritimes
voisines (Russie, péninsule coréenne), ce qui peut légèrement gonfler le
compte pour les zones frontalières.

## 👤 Auteur

**Stéphane Kosmala**
[GitHub](https://github.com/StephaneKosmala)
