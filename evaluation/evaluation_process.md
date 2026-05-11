# Evaluation Process

Procédure d'évaluation des dialogues. Opérationnalise `evaluation_rubric.md`.

---

## Rôles

Workflow solo + assistant IA :

- **Auteur (Loïc)** — écrit les versions, prend les décisions finales d'acceptation ou de révision.
- **Évaluateur IA (Claude)** — applique la grille `evaluation_rubric.md` à une version donnée et produit un rapport structuré.
- **Validation finale** — l'auteur a le dernier mot. Le rapport IA est un input, pas une autorité.

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

1. **Préparer le contexte** — rassembler les inputs nécessaires :
   - Le `.ink` à évaluer
   - Le `scenario_*.md` correspondant
   - `dialogue_style_guide.md`
   - `world_rules.md`
   - `world_lexicon.md`
   - Fiches `/characters` des personnages présents
   - Section pertinente de `player_experience.md`
   - Section pertinente du GDD (si applicable)
   - `evaluation_rubric.md`

2. **Lancer l'évaluation** — demander à l'évaluateur IA d'appliquer la grille point par point en produisant le rapport au format défini ci-dessous.

3. **Lire et trier les retours** — l'auteur classe les remarques :
   - Critiques bloquantes (à corriger avant tout)
   - Améliorations majeures (à intégrer dans la prochaine version)
   - Améliorations mineures (à intégrer si compatible avec le scope)
   - Remarques rejetées (avec brève justification, pour traçabilité)

4. **Archiver le rapport** — dans `/evaluation/logs/` avec la convention de nommage définie plus bas.

5. **Décider** — acceptation ou nouvelle version (voir règles de décision).

---

## Convention de nommage des logs

```
eval_<mission>_<scene>_<version>_<YYYY-MM-DD>.md
```

Exemples :
- `eval_mission1_scene1_v2_2026-05-11.md`
- `eval_mission1_scene1_v3_2026-05-18.md`

Le suffixe de version dans le nom du log correspond à la version du `.ink` évaluée, pas à un compteur d'évaluations.

---

## Règles de décision

Indicatives, pas mécaniques. L'auteur tranche.

| Score global | Action recommandée |
|--------------|---------------------|
| < 60/100 | Réécriture majeure |
| 60-74 | Révision ciblée sur les axes faibles |
| 75-89 | Polish, ajustements mineurs, peut avancer |
| ≥ 90 | Acceptation, peut avancer à la scène suivante |

**Override automatique** : la présence d'au moins une « Critical Issue » dans le rapport déclenche une révision, quel que soit le score global.

**Cas particulier** : un dialogue qui obtient un bon score mais qui rate l'intention émotionnelle de `player_experience.md` doit être révisé même si la grille est satisfaite. La cohérence avec l'expérience joueur prime.

---

## Format du rapport d'évaluation

Gabarit à utiliser pour chaque rapport archivé. Reprend la structure de `evaluation_rubric.md`.

```markdown
# Évaluation — <mission>/<scène>/<version>

**Date** : YYYY-MM-DD
**Fichier évalué** : chemin/vers/le/fichier.ink
**Évaluateur** : IA (Claude) / Auteur / Conjoint

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

---

## Notes de production

- Le seuil de 30% pour déclencher une évaluation (révision majeure) est arbitraire et peut être ajusté à l'usage.
- Les seuils de score (60/75/90) sont des points de départ. À recalibrer après les 3-4 premières évaluations réelles.
- Une fois quelques dialogues écrits et évalués, possibilité d'enrichir le rubric avec des critères spécifiques à L'Abîme (marqueurs mystiques, respect du tabou linguistique du Gouffre, distinction registre surface/faille...). Pour l'instant la grille générique suffit.
