# 📋 Architecture Hiérarchique Agentic - Préservation

**Date**: 21 octobre 2025
**Créateur**: Omar El Mountassir & Claude
**Statut**: Document de préservation avant modifications

## 🎯 Vision Initiale d'Omar

### Philosophie "Stop Coding" - Double Application

#### Pour Omar (Humain Strategist)
- **Rôle**: Ne code PLUS directement
- **Mission**: Vision stratégique et définition des objectifs
- **Action**: Orchestre l'agent principal (Claude)
- **Léviation**: Passe de "codeur" à "stratège agentic"

#### Pour Claude (Agent Principal)
- **Rôle**: Ne code PAS directement non plus
- **Mission**: Planification, coordination, délégation
- **Action**: Crée et gère des agents subordonnés pour l'exécution
- **Léviation**: Passe d'exécuteur à "manager d'agents"

### Architecture Hiérarchique à 3 Niveaux

```
Niveau 1: Omar (Strategist)
    ↓ Donne vision et objectifs
Niveau 2: Claude Principal (Main Agent)
    ↓ Planifie, coordonne, délègue
Niveau 3: Claude Subordonnés (Worker Agents)
    ↓ Exécutent les tâches techniques
```

## 🏗️ Structure Technique Proposée

### Localisation des Agents
- **Claude Principal**: Racine du projet (`/home/omar/work/learning/systems/agentic/`)
- **Claude Subordonnés**: Sous-dossier séparé (ex: `workspace/`, `agents/`, ou `subordonnés/`)

### Fichiers de Configuration
- **CLAUDE.md racine**: Instructions pour l'agent principal (moi)
- **CLAUDE.md sous-dossier**: Instructions pour les agents subordonnés

## ❌ Questions en Attente de Réponse

1. **Structure des dossiers**: Quel nom exact pour le sous-dossier des subordonnés ?

2. **Instructions différenciées**: Les agents subordonnés doivent-ils avoir des instructions différentes de l'agent principal ?

3. **Communication**: Comment les remontées d'information s'opèrent-elles ?
   - Subordonné → Principal → Strategist ?
   - Ou communication directe possible ?

4. **Portée des projets**:
   - Un subordonné par projet ?
   - Ou collaboration entre subordonnés possible ?

5. **Initialisation**: Que signifie exactement "initialiser à la racine de ce pwd" ?

## 🔄 État Actuel du Projet

### Dépôt GitHub
- **URL**: https://github.com/Agent-Genesis/agentic-learning-journey
- **Statut**: Configuré et fonctionnel

### Structure Existantes
```
agentic/
├── README.md                    # Parcours d'apprentissage
├── docs/lessons/001/            # Contenu pédagogique
├── notes/001-introduction.md    # Nos premiers apprentissages
├── progress/checklist.md        # Suivi de progression
├── exercises/                   # Vide, en attente
├── projects/                    # Vide, en attente
└── docs/                        # Contient ce document
```

### Prochaines Actions (En Attente)
1. Réponses aux questions ci-dessus
2. Création du sous-dossier pour agents subordonnés
3. Configuration des fichiers CLAUDE.md différenciés
4. Initialisation de l'architecture hiérarchique
5. Test de la chaîne de commandement

## 💡 Principes Clés à Préserver

1. **Double "Stop Coding"**: Humain ET agent principal n'écrivent pas de code
2. **Chaîne de commandement**: Strategist → Main Agent → Worker Agents
3. **Autonomie croissante**: Chaque niveau gère son domaine de responsabilité
4. **Documentation continue**: Préservation de l'évolution de l'architecture

---

**Note**: Ce document doit être préservé et utilisé comme référence pour toutes les futures modifications de l'architecture agentic.