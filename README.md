# Server Performance Stats

Ce projet contient un script Bash qui permet d'analyser et d'afficher des statistiques de performance de votre machine.

## Fonctionnalités

Le script affiche notamment :

- **Utilisation totale du CPU**
- **Utilisation de la mémoire**  
  (Mémoire totale, utilisée, libre et pourcentage d'utilisation)
- **Utilisation des disques**  
  (Espace total, utilisé, disponible et pourcentage d'utilisation)
- **Top 5 des processus par consommation de CPU**
- **Top 5 des processus par consommation de mémoire**

### Options supplémentaires (stretch goals)
Le script affiche également quelques informations complémentaires :
- Version du système d'exploitation
- Temps d'activité (uptime)
- Charge moyenne (load average)
- Utilisateurs connectés
- Tentatives de connexion échouées (si disponibles)

## Prérequis

Assurez-vous que votre système Linux dispose des commandes suivantes :
- `bash`
- `top`
- `free`
- `df`
- `ps`
- `uptime`
- `bc`
- `grep`, `awk`, `sed`

Ces outils sont généralement installés par défaut sur la plupart des distributions Linux.

## Installation

1. Téléchargez ou clonez ce dépôt.
2. Rendez le script exécutable avec la commande suivante :
   ```bash
   chmod +x server-stats.sh
---
https://roadmap.sh/projects/server-stats
