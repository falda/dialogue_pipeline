# Pipeline Overview

Document de référence haut niveau pour la pipeline d'écriture des dialogues du projet **L'Abîme**.

Lecture recommandée comme premier contact avec le projet — avant le `README.md`, qui décrit l'arborescence, et avant les référentiels eux-mêmes, qui détaillent les règles.

---

## Pourquoi ce document existe

Le `README.md` répond à *"qu'est-ce qu'il y a dans ce repo ?"*.
Ce document répond à *"comment cette pipeline fonctionne-t-elle, et pourquoi est-elle structurée ainsi ?"*.

C'est la couche au-dessus du quoi : les principes directeurs, le flux de travail, les choix structurels.

---

## Principes directeurs

### 1. Le GDD est la source de vérité du jeu

Le `GDD_Labime_v*.txt` définit le monde, les personnages, les mécaniques, l'arc narratif. La pipeline ne le remplace pas, elle le traduit en outils opérationnels pour écrire les dialogues.

Si une information existe dans le GDD, la pipeline la résume mais ne la duplique pas mot à mot. Sinon, à chaque révision du GDD, la pipeline se désynchronise.

### 2. Source de vérité unique

Une information n'a qu'un seul lieu de résidence dans la pipeline.

- Le vocabulaire est dans `world_lexicon.md`, pas dans chaque fiche personnage.
- Les conventions Ink sont dans `ink_conventions.md`, pas répétées dans chaque scénario.
- L'intention émotionnelle d'une scène est dans `player_experience.md`, pas duplicée dans le scénario.

Quand un référentiel évolue, un seul fichier change.

### 3. Distinction explicite entre décidé et à fixer

Tout ce qui n'est pas définitivement arrêté est marqué comme tel, avec une proposition de départ. Cela évite deux pièges :
- Réouvrir des décisions déjà prises (perte de temps).
- Figer par inertie des choix qui méritaient encore réflexion.

Chaque fiche personnage et chaque référentiel comporte une section *"Notes de production"* listant ce qui reste ouvert.

### 4. Décisions cadrées avant écriture, libertés à l'intérieur

Avant d'écrire un dialogue, les intentions et contraintes sont posées dans :
- Le scénario de la scène (objectif narratif, contraintes spécifiques)
- La fiche du personnage qui parle (voix, désir, fonction)
- L'intention émotionnelle attendue (`player_experience.md`)
- Les règles globales (style, monde, lexique)

À l'intérieur de ce cadre, l'écriture reste libre. Le cadre n'est pas une camisole — c'est une boussole.

### 5. L'auteur a le dernier mot

L'évaluation IA et la grille produisent des retours structurés. Ils sont des inputs, pas des autorités. La décision finale d'acceptation d'un dialogue revient toujours à l'auteur (Loïc).

---

## Le flux de travail

### Vue d'ensemble

```
       ┌──────────────────────────┐
       │ 1. Premier jet (auteur)  │
       │    Donne la direction    │
       └────────────┬─────────────┘
                    │
                    ▼
       ┌──────────────────────────┐
       │ 2. Entrée dans pipeline  │
       │    Conventions, format   │
       └────────────┬─────────────┘
                    │
                    ▼
       ┌──────────────────────────┐
       │ 3. Évaluation (IA)       │◀────┐
       │    Application du rubric │     │
       └────────────┬─────────────┘     │
                    │                   │
                    ▼                   │
       ┌──────────────────────────┐     │
       │ 4. Révision (auteur+IA)  │─────┘  Boucle tant que
       │    Intègre les retours   │        score < 90/100
       └────────────┬─────────────┘
                    │ (score ≥ 90)
                    ▼
       ┌──────────────────────────┐
       │ 5. Relecture auteur      │
       │    Dernier mot           │
       └────────────┬─────────────┘
                    │
                    ▼
       ┌──────────────────────────┐
       │ 6. Validation finale     │
       │    Dialogue accepté      │
       └──────────────────────────┘
```

### Étape 1 — Premier jet par l'auteur

L'auteur écrit la première version du dialogue **avant** toute évaluation. Cette étape fixe la direction artistique de la scène : voix des personnages, ton, choix structurants, sous-texte voulu.

Pourquoi cette étape est essentielle : la pipeline et l'évaluation IA peuvent corriger, équilibrer, signaler — elles ne peuvent pas inventer la direction. L'identité créative vient de l'auteur, et le premier jet la pose.

Le premier jet n'a pas besoin d'être propre. Il peut comporter des trous, des notes, des hésitations. Il doit avoir une voix.

### Étape 2 — Entrée dans la pipeline

Le premier jet est mis aux conventions du projet :
- `INCLUDE global.ink` en tête
- Variables locales remontées dans `global.ink` si pertinentes
- Attribution des locuteurs (`LOCUTEUR: réplique`)
- Didascalies entre crochets
- Knots et stitches nommés selon les conventions

C'est un travail mécanique, pas créatif.

### Étape 3 — Évaluation par l'IA

Une conversation Incognito Claude.ai (ou ultérieurement un projet d'évaluation dédié) reçoit :
- Le `.ink`
- Le scénario
- Les fiches personnages concernées
- Les référentiels globaux
- La grille `evaluation_rubric.md`

Elle produit un rapport au format défini dans `evaluation_process.md`. Le rapport est archivé dans `/evaluation/logs/`.

### Étape 4 — Révision et boucle

L'auteur lit le rapport, trie les retours :
- **Critiques bloquantes** → corrigées
- **Améliorations majeures** → intégrées
- **Améliorations mineures** → intégrées si compatibles avec le scope
- **Remarques rejetées** → motivées brièvement, pour traçabilité

Une nouvelle version (`_v3`, `_v4`...) est produite. Elle est ré-évaluée.

**Critère de sortie de la boucle : score global ≥ 90/100.**

En dessous de 90, on continue d'itérer. Cela peut signifier plusieurs cycles, et c'est le prix de la qualité.

> **Garde-fou** : si une version régresse en score, ou si trois itérations consécutives plafonnent sous 90 sans progrès, c'est probablement le signe que :
> - le scénario lui-même demande à être révisé,
> - ou un référentiel mérite d'être clarifié,
> - ou la grille est mal calibrée pour cette scène.
> Dans ce cas, sortir de la boucle et résoudre la cause-racine avant de poursuivre.

### Étape 5 — Relecture par l'auteur

Quand la version atteint le seuil, l'auteur procède à une relecture personnelle, sans la grille. Lecture à voix haute recommandée. C'est le seul moment du processus où l'œil humain non outillé évalue le texte comme un lecteur le ferait.

### Étape 6 — Validation finale

L'auteur valide. Le dialogue est figé en tant que version courante (`mission1_scene1.ink`). Les versions antérieures sont conservées avec leur numéro de version dans le nom.

---

## L'écosystème — comment les pièces se parlent

| Pièce | Rôle | Qui la consulte |
|-------|------|-----------------|
| `GDD_Labime_v*.txt` | Source de vérité du jeu | Auteur, évaluateur (en référence) |
| `dialogue_style_guide.md` | Règles d'écriture | Auteur, évaluateur |
| `world_rules.md` | Lore et ton du monde | Auteur, évaluateur |
| `world_lexicon.md` | Vocabulaire autorisé / interdit | Auteur, évaluateur |
| `player_experience.md` | Intentions émotionnelles | Auteur, évaluateur |
| `ink_conventions.md` | Format technique des .ink | Auteur, évaluateur (validation technique) |
| `global.ink` | Variables Ink partagées | Auteur, moteur Ink |
| `/characters/*.md` | Fiches personnages | Auteur, évaluateur |
| `scenario_*.md` | Intention de la scène | Auteur, évaluateur |
| `mission_*.ink` | Le dialogue lui-même | Auteur, évaluateur, moteur Ink |
| `evaluation_rubric.md` | Grille de notation | Évaluateur |
| `evaluation_process.md` | Procédure d'évaluation | Auteur (pour cadrer les sessions) |
| `/evaluation/logs/eval_*.md` | Rapports archivés | Auteur (suivi de progression) |

Trois groupes :

1. **Référentiels stables** — règles du projet, évoluent rarement, beaucoup consultés.
2. **Documents de scène** — un par scène, évoluent à chaque cycle.
3. **Système d'évaluation** — grille, process, logs.

---

## Conventions transversales

- **Versionnage des dialogues** : `mission1_scene1.ink` est la version courante. Les anciennes sont préservées en `_v2`, `_v3`, etc. Une version validée n'est jamais écrasée.
- **Nommage de fichiers** : `snake_case`, en minuscules.
- **Nommage des knots Ink** et conventions internes : `ink_conventions.md`.
- **Langue de la pipeline** : français (référentiels, rapports, notes).
- **Identifiants de locuteurs** : MAJUSCULES (`FONCTIONNAIRE`, `JOUEUR`, `MENTOR`...). Liste centralisée dans `ink_conventions.md`.

---

## Évolution de la pipeline

La pipeline elle-même n'est pas figée. Trois types d'évolutions sont attendues :

### Évolutions naturelles
- Ajout de nouvelles fiches personnages au fil de l'écriture
- Ajout de nouveaux scénarios et dialogues mission par mission
- Enrichissement du `world_lexicon.md` à mesure que le worldbuilding se précise
- Enrichissement de `player_experience.md` scène par scène

### Évolutions de calibration
- Les seuils de score (90 pour sortir de la boucle, garde-fous) sont à recalibrer après 3-4 dialogues complets.
- La grille `evaluation_rubric.md` pourra accueillir des critères spécifiques à L'Abîme (marqueurs mystiques, tabou linguistique du Gouffre, distinction registre surface/faille) une fois ces dimensions stabilisées.

### Évolutions structurelles
- Passage d'évaluations en Incognito à un projet d'évaluation dédié, avec ses propres knowledge files.
- Automatisation possible via routine Claude Code (déclenchement automatique d'éval à chaque push d'un `.ink`), une fois le prompt d'évaluation stabilisé.

Toute évolution significative de la pipeline (ajout d'un fichier global, changement de workflow, modification d'une convention) doit être reflétée dans ce document et dans le `README.md`.

---

## Notes de production

- Les seuils de score (≥ 90 pour validation, garde-fou à 3 itérations sans progrès) sont des points de départ. À recalibrer après quelques cycles complets.
- Le passage à un projet d'évaluation dédié (au lieu d'Incognito ponctuel) sera utile une fois la grille bien stabilisée.
- L'automatisation par routine Claude Code n'est intéressante qu'une fois le prompt d'évaluation gelé — sinon on brûle des quotas pour rien.
- Ce document est lui-même susceptible d'évoluer ; le maintenir synchronisé avec la réalité de la pipeline.
