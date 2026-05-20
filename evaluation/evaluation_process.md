# Evaluation Process

Procédure d'évaluation des dialogues. Opérationnalise `evaluation_rubric.md`.

---

## Rôles

Workflow solo + assistant IA :

- **Auteur (Loïc)** — écrit les versions, prend les décisions finales d'acceptation ou de révision.
- **Évaluateur IA (Claude, projet dédié L'Abîme — Évaluateur)** — applique la grille `evaluation_rubric.md` à une version donnée et produit un rapport structuré.
- **Validation finale** — l'auteur a le dernier mot. Le rapport IA est un input, pas une autorité.

L'évaluateur fonctionne en isolation : projet Claude dédié, sans accès aux conversations précédentes, sans rapport antérieur attaché. Cette isolation garantit que chaque évaluation soit un regard neuf.

---

## Quand évaluer

| Événement | Évaluation déclenchée ? |
|-----------|--------------------------|
| Première version d'un dialogue (`_v1`) | Oui |
| Révision majeure (réécriture de plus de 30% du contenu) | Oui |
| Révision ciblée suite à un rapport précédent | Oui (mesurer le progrès) |
| Correction de coquilles, ajustements mineurs | Non |
| Changement structurel du GDD impactant la scène | Oui (revérifier la cohérence) |

---

## Procédure

### 1. Préparer le contexte

L'auteur ouvre une nouvelle conversation dans le projet Claude dédié **L'Abîme — Évaluateur**. Les référentiels suivants sont en knowledge du projet (cochés en permanence) :

- `dialogue_style_guide.md`
- `world_rules.md`
- `world_lexicon.md`
- `player_experience.md`
- `ink_conventions.md`
- `global.ink`
- `evaluation_rubric.md`
- `evaluation_process.md`
- `protagonist.md`

L'auteur attache à la conversation (en pièces jointes) :

- Le `.ink` à évaluer
- Le `scenario_*.md` correspondant (si non en knowledge)
- Les fiches des personnages présents dans la scène (si non en knowledge)

Le prompt évaluateur (`prompt_evaluateur_pipeline.txt`) est en Project Instructions du projet.

### 2. Lancer l'évaluation

Message d'ouverture minimal : « Évalue. ». L'évaluateur applique sa procédure et produit le rapport au format défini ci-dessous.

### 3. Lire et archiver

L'auteur lit le rapport et l'archive dans `/evaluation/logs/` avec la convention de nommage définie plus bas.

### 4. Décider

L'auteur décide de la suite :

- Si le rapport est propre (pas de Critical, Major acceptables) : passage à la relecture (étape 5 de la pipeline)
- Sinon : ouverture d'un cycle de révision (voir `revision_process.md`)

Pas de seuil chiffré : la décision est qualitative (cf. `pipeline_overview.md`, étape 4).

---

## Convention de nommage des logs

```
eval_<mission>_<scene>_<version>_<YYYY-MM-DD>.md
```

Exemples :
- `eval_mission1_scene1_v2_2026-05-11.md`
- `eval_mission1_scene1_v3_2026-05-16.md`

Le suffixe de version dans le nom du log correspond à la version du `.ink` évaluée, pas à un compteur d'évaluations.

---

## Règles de décision

Indicatives, pas mécaniques. L'auteur tranche.

| Situation | Action recommandée |
|-----------|---------------------|
| Présence d'au moins une Critical Issue | Révision déclenchée, quel que soit le score |
| Major Issues bloquantes du point de vue de l'auteur | Révision déclenchée |
| Pas de Critical, Major acceptables | Acceptation possible, passage à la relecture |
| Score qui régresse vs version précédente | Investigation : a-t-on cassé quelque chose ou la grille interprète-t-elle différemment ? |
| Plafonnement sur 3 itérations sans progrès | Stop, résoudre la cause-racine (scénario, référentiel, grille) |

Le **score global** est un indicateur de progression, non un critère de validation. Une scène à 80/100 sans Critical peut être livrée si l'auteur juge qu'aller plus loin produirait de la sur-optimisation.

**Cas particulier** : un dialogue qui obtient un bon score mais qui rate l'intention émotionnelle de `player_experience.md` doit être révisé même si la grille est satisfaite. La cohérence avec l'expérience joueur prime.

---

## Format du rapport d'évaluation

Gabarit à utiliser pour chaque rapport archivé. Reprend la structure de `evaluation_rubric.md`.

```markdown
# Évaluation — <mission>/<scène>/<version>

**Date** : YYYY-MM-DD
**Fichier évalué** : chemin/vers/le/fichier.ink
**Évaluateur** : IA (Claude, projet dédié)

---

## Validation technique

- **Inky** : PASS / FAIL — détail si FAIL
- **Formatting** : PASS / FAIL — détail si FAIL
- **Language** : PASS / FAIL — détail si FAIL

---

## Score

### 1. Narrative Coherence (/40)
- Scene Objectives : X/10 — commentaire
- Lore Consistency : X/10 — commentaire
- Character Consistency : X/10 — commentaire
- Information Control : X/10 — commentaire

### 2. Writing Quality (/40)
- Natural Dialogue : X/10 — commentaire
- Subtext : X/10 — commentaire
- Rhythm : X/10 — commentaire
- Emotional Impact : X/10 — commentaire

### 3. Interactive Design (/20)
- Choice Clarity : X/10 — commentaire
- Choice Relevance : X/10 — commentaire

### Global Score : X/100

---

## Détection d'écriture IA

Signaux observés ou absents. Liste brève.

---

## Critical Issues
Problèmes bloquants. Vide si aucun.

## Major Issues
Problèmes importants à traiter.

## Minor Issues
Problèmes mineurs.

## Strengths
Points réussis explicitement.

## Suggested Improvements
Liste priorisée des améliorations.
```

**Règle de localisation** : chaque issue (Critical, Major, Minor) doit indiquer son emplacement précis dans le `.ink` — nom du knot et/ou numéro de ligne — pour faciliter la relecture et le triage. Une issue sans localisation oblige l'auteur à parcourir tout le fichier pour la retrouver.

---

## Notes de production

- Le seuil de 30% pour déclencher une évaluation (révision majeure) est arbitraire et peut être ajusté à l'usage.
- Les fourchettes de score sont des indicateurs, pas des seuils. La décision finale est qualitative.
- Une fois plusieurs dialogues écrits et évalués, possibilité d'enrichir le rubric avec des critères spécifiques à L'Abîme (marqueurs mystiques, respect du tabou linguistique du Gouffre, distinction registre surface/faille...). Pour l'instant la grille générique suffit.
