# Revision Process

Procédure de triage et de révision des dialogues après évaluation. Opérationnalise l'étape 4 de `pipeline_overview.md`.

---

## Rôles

Workflow solo + assistant IA :

- **Auteur (Loïc)** — lit le rapport, trie chaque issue (RETENU / MODIFIÉ / REJETÉ), prend les décisions finales d'arbitrage. Il a le dernier mot.
- **Claude (assistant en conversation principale)** — assiste l'auteur dans le triage en posant les arbitrages un par un, puis applique le triage et produit la version suivante du `.ink` ainsi que le changelog des modifications.
- **Validation finale** — l'auteur. Le `.ink` produit par Claude est un livrable, pas une autorité.

Le mode **agent réviseur isolé** (projet Claude dédié) a été abandonné après essai (cf. `pipeline_overview.md`, historique). La révision est désormais intégrée à la conversation principale.

---

## Quand réviser

| Événement | Révision déclenchée ? |
|-----------|-----------------------|
| Rapport d'évaluation contenant au moins une Critical Issue | Oui |
| Rapport contenant des Major Issues que l'auteur juge bloquantes | Oui |
| Rapport propre (pas de Critical, Major acceptables) | Non, passage à la relecture auteur (étape 5) |
| Garde-fou : trois itérations sans progrès | Stop, résoudre la cause-racine (scénario, référentiel, grille) |

L'auteur juge en dernière instance, sans seuil chiffré (cf. `pipeline_overview.md` étape 4).

---

## Procédure

### 1. Préparation par l'auteur

L'auteur ouvre une nouvelle conversation dans le projet principal **L'Abîme** avec Claude. Il y attache :

- La version courante (`mission<N>_scene<M>_v<x>.ink`)
- La version v1 du dialogue (`mission<N>_scene<M>_v1.ink`) — ancrage de voix
- Le rapport d'évaluation (`eval_mission<N>_scene<M>_v<x>_YYYY-MM-DD.md`)
- Le scénario (`scenario_mission<N>_scene<M>.md`)
- Les fiches `/characters` des personnages présents
- Les référentiels globaux

Les référentiels stables peuvent rester en knowledge du projet principal pour ne pas être réattachés à chaque session.

### 2. Triage assisté

L'auteur demande à Claude d'engager le triage du rapport. Claude propose chaque issue (Critical, Major, Minor) avec ses options d'arbitrage. L'auteur tranche :

- **RETENU** — l'issue est valide et doit être corrigée. Note éventuelle pour préciser l'orientation.
- **MODIFIÉ** — l'issue pointe un vrai problème mais la correction proposée par le rapport ne convient pas. Note d'orientation pour décrire la direction à prendre.
- **REJETÉ** — l'issue n'est pas retenue. Motif court obligatoire pour traçabilité.

Les sections **Strengths** et **Suggested Improvements** ne se trient pas formellement : Strengths est informatif, Suggested Improvements est matière première pour les RETENU/MODIFIÉ.

L'auteur peut aussi ajouter ses propres remarques de relecture comme issues à part entière (`r1`, `r2`...), même si elles ne figurent pas dans le rapport.

### 3. Application et changelog

Une fois le triage complet, Claude rédige dans la même conversation :

- Le fichier `revision_v<x>_to_v<x+1>.md` consolidé (triage + changelog, voir gabarit plus bas)
- Le `.ink` v<x+1> avec les modifications actées

L'auteur sauvegarde les deux fichiers dans le repo aux emplacements convenus.

### 4. Archivage

- Le `.ink` rejoint `/dialogues/missions/mission<N>/scenes/`
- Le fichier de révision rejoint `/evaluation/revisions/`
- L'ancienne version (`v<x>`) n'est pas écrasée

### 5. Nouvelle évaluation

La version `v<x+1>` est soumise au projet Évaluateur dans une nouvelle conversation. Voir `evaluation_process.md`.

La boucle reprend à l'étape 1 si nécessaire.

---

## Convention de nommage des fichiers de révision

```
revision_v<x>_to_v<x+1>.md
```

Exemples :
- `revision_v2_to_v3.md`
- `revision_v3_to_v4.md`

Le contexte (mission, scène) est donné par l'arborescence `/evaluation/revisions/`. Si plusieurs scènes sont en révision en parallèle, utiliser `revision_mission<N>_scene<M>_v<x>_to_v<x+1>.md`.

---

## Format du fichier de révision

Gabarit consolidé en une seule passe. Plus de séparation en deux temps (héritage du mode réviseur isolé, qui supposait un ping-pong entre auteur et agent). Claude remplit l'ensemble du fichier dans la même session.

```markdown
# Revision v<x> → v<x+1> — Mission <N> / Scène <M>

**Rapport source** : eval_mission<N>_scene<M>_v<x>_YYYY-MM-DD.md
**Date** : YYYY-MM-DD
**Mode** : révision intégrée

---

## Triage et application

### Critical
- **C1** — <résumé court de l'issue> → **RETENU / MODIFIÉ / REJETÉ**
  Note ou motif : <texte libre>
  Application : <description concise de la modification appliquée, ou "non appliquée" si REJETÉ>

### Major
- **M1** — ...

### Minor
- **m1** — ...

### Remarques de relecture auteur (issues non listées par le rapport)
- **r1** (l. XX) — <description> → **RETENU / MODIFIÉ / REJETÉ**
  Application : <description>

---

## Auto-fixes hors triage (conformité technique)

- <description de chaque correction mécanique appliquée (typos, préfixes locuteur, variables orphelines, etc.), avec emplacement (knot ou ligne)>

---

## Signalements

- <toute ambiguïté, info manquante, direction non matérialisable, ou point à valider par l'auteur — une ligne par signalement. Section omise si aucun signalement.>
```

---

## Latitude de Claude (mode intégré)

Claude fonctionne en **semi-strict** :

- Quand le triage donne une instruction concrète (« remplacer X par Y »), application littérale.
- Quand le triage donne une direction (« durcir la formulation pour qu'on ne puisse pas la confondre avec un reportage »), Claude propose une matérialisation concrète en respectant trois ancres :
  1. La voix de l'auteur, telle qu'elle s'exprime dans v1
  2. La fiche personnage
  3. Le `world_lexicon.md`
- Claude **ne réécrit jamais un passage qui ne fait pas partie du triage**.
- Claude **ne décide jamais qu'une partie est ratée** s'il n'y a pas de mandat explicite.

Les modifications mécaniques (typos, préfixes locuteur, variables orphelines, indentation, didascalies mal formatées) sont **appliquées automatiquement et listées au changelog** comme « auto-fixes hors triage ». Si un auto-fix est ambigu, Claude le signale au lieu de l'appliquer.

---

## Validation avant intégration finale

Quand Claude produit une reformulation libre (par exemple pour résoudre une issue MODIFIÉ sans formulation imposée), il la signale dans la section **Signalements** comme « à valider par l'auteur ». L'auteur peut alors :

- accepter la reformulation telle quelle
- reformuler manuellement avant de pousser
- demander une autre proposition à Claude

Ce mécanisme protège l'identité de voix : la reformulation IA n'entre dans la version finale qu'avec accord explicite de l'auteur.

---

## Notes de production

- Le format consolidé (un seul livrable) remplace la version précédente en deux sections (triage rempli par l'auteur, changelog rempli par le réviseur). Cette séparation était utile quand le réviseur était un agent isolé ; en mode intégré, elle est devenue inutile.
- L'archivage en `/evaluation/revisions/` est conservé pour la traçabilité historique.
- À l'usage, possibilité d'introduire une catégorie « EN ATTENTE » pour différer une décision de triage. Pas implémentée pour l'instant.
- Les anciens fichiers `revision_v2_to_v3.md` et `revision_v3_to_v4.md` produits en format à deux sections sont conservés tels quels — pas de migration rétroactive.
