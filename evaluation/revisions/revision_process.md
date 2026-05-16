# Revision Process

Procédure de révision des dialogues après évaluation. Opérationnalise la boucle d'amélioration décrite dans `pipeline_overview.md` (étape 4).

Document symétrique de `evaluation_process.md` : l'évaluation produit un rapport, la révision applique ce rapport à la version courante pour produire la version suivante.

---

## Rôles

Workflow solo + assistant IA :

- **Auteur (Loïc)** — lit le rapport d'évaluation, trie les retours (RETENU / REJETÉ / MODIFIÉ), prend les décisions finales d'arbitrage entre intention créative et règles du projet.
- **Réviseur IA (Claude, projet dédié)** — reçoit la version courante, le rapport, le triage et les référentiels. Produit la version suivante du `.ink` et le changelog des modifications appliquées. N'a aucune latitude pour réécrire hors du périmètre du triage.
- **Validation finale** — l'auteur a le dernier mot. Le `.ink` produit par le réviseur est un livrable, pas une autorité.

---

## Quand réviser

| Événement | Révision déclenchée ? |
|-----------|-----------------------|
| Rapport d'évaluation reçu avec score < 90/100 | Oui |
| Rapport contenant au moins une Critical Issue | Oui, quel que soit le score |
| Rapport ≥ 90/100 sans Critical | Non, passage à la relecture auteur (étape 5 de la pipeline) |
| Garde-fou : trois itérations sans progrès | Stop, résoudre la cause-racine (scénario, référentiel, grille) avant de continuer |

---

## Procédure

### 1. Triage par l'auteur

L'auteur lit le rapport. Pour chaque issue listée (Critical, Major, Minor), il attribue un verdict :

- **RETENU** — l'issue est valide et doit être corrigée. Note éventuelle pour préciser l'orientation.
- **MODIFIÉ** — l'issue pointe un vrai problème mais la correction proposée par le rapport ne convient pas. Une note d'orientation décrit la direction à prendre.
- **REJETÉ** — l'issue n'est pas retenue. Un motif court est obligatoire pour traçabilité (ex. « intention v1 conservée », « punctum assumé », « cohérent avec [autre référentiel] »).

Les sections **Strengths** et **Suggested Improvements** ne se trient pas : Strengths est informatif, Suggested Improvements est la matière première dont le réviseur se sert pour exécuter les RETENU / MODIFIÉ.

Le triage est rédigé dans un fichier `revision_v<x>_to_v<x+1>.md` (voir gabarit plus bas), placé dans `/evaluation/revisions/`.

### 2. Préparation du bundle

L'auteur prépare les inputs pour le réviseur :

- La version courante à réviser (`mission<N>_scene<M>_v<x>.ink`)
- La version v1 du dialogue (`mission<N>_scene<M>_v1.ink`) — ancrage de voix, en knowledge du projet réviseur ou attachée
- Le rapport d'évaluation (`eval_mission<N>_scene<M>_v<x>_YYYY-MM-DD.md`)
- Le triage rempli (`revision_v<x>_to_v<x+1>.md`, section 1 complétée)
- Le scénario (`scenario_mission<N>_scene<M>.md`)
- Les fiches `/characters` des personnages présents
- Les référentiels globaux (en knowledge du projet réviseur)

### 3. Passage du réviseur

L'auteur ouvre une nouvelle conversation dans le projet dédié `L'Abîme — Réviseur` et y attache les inputs volatils (la version v<x>, le rapport, le triage, et le cas échéant la version v1 et le scénario s'ils ne sont pas en knowledge).

Le réviseur applique sa procédure (cf. `prompt_reviseur_pipeline.txt`) et produit deux livrables :

- `mission<N>_scene<M>_v<x+1>.ink` — la nouvelle version
- `revision_v<x>_to_v<x+1>.md` — le même fichier que le triage, mais avec la section 2 (Changelog) désormais remplie

### 4. Archivage

- Le `.ink` rejoint `/dialogues/missions/mission<N>/scenes/`
- Le fichier de révision reste dans `/evaluation/revisions/`
- L'ancienne version (`v<x>`) n'est pas écrasée — la pipeline préserve l'historique des versions

### 5. Nouvelle évaluation

La version `v<x+1>` est soumise à l'évaluateur dans une nouvelle conversation Incognito ou dans le projet `L'Abîme — Évaluateur`. Voir `evaluation_process.md`.

La boucle reprend à l'étape 1 si nécessaire.

---

## Convention de nommage des fichiers de révision

```
revision_v<x>_to_v<x+1>.md
```

Exemples :
- `revision_v2_to_v3.md`
- `revision_v3_to_v4.md`

Les numéros de version correspondent à ceux du `.ink` : on part de `mission1_scene1_v2.ink` pour produire `mission1_scene1_v3.ink`, donc le fichier de révision s'appelle `revision_v2_to_v3.md`.

Cette convention ne mentionne pas la mission et la scène concernées : le contexte est donné par l'arborescence. Si plusieurs scènes sont en révision en parallèle (ce qui n'est pas le mode de travail standard), on utilisera `revision_mission<N>_scene<M>_v<x>_to_v<x+1>.md`.

---

## Format du fichier de révision

Gabarit à utiliser. La section 1 est remplie par l'auteur avant le passage du réviseur. La section 2 est remplie par le réviseur.

```markdown
# Revision v<x> → v<x+1> — Mission <N> / Scène <M>

**Rapport source** : eval_mission<N>_scene<M>_v<x>_YYYY-MM-DD.md
**Date triage** : YYYY-MM-DD
**Auteur du triage** : Loïc

---

## 1. Triage (rempli par l'auteur avant envoi)

### Critical
- **C1** — <résumé court de l'issue> → **RETENU / MODIFIÉ / REJETÉ**
  Note ou motif : <texte libre>

### Major
- **M1** — <résumé court> → **RETENU / MODIFIÉ / REJETÉ**
  Note ou motif : <texte libre>
- **M2** — ...

### Minor
- **m1** — <résumé court> → **RETENU / MODIFIÉ / REJETÉ**
  Note ou motif : <texte libre>

---

## 2. Changelog (rempli par le réviseur)

### Issues retenues / modifiées
- **C1** → emplacement : <ligne ou knot> → modification appliquée : <description concise>
- **M1** → emplacement : <ligne ou knot> → modification appliquée : <description concise>
...

### Issues rejetées (rappel pour traçabilité)
- **M2** — non appliqué, motif transmis par l'auteur : <motif recopié>
...

### Auto-fixes hors triage (conformité technique)
- <description de chaque correction mécanique appliquée (typos, préfixes locuteur, variables orphelines, etc.)>
```

---

## Latitude du réviseur

Le réviseur fonctionne en mode **semi-strict** :

- Quand le rapport ou le triage donne une instruction concrète (« remplacer X par Y »), le réviseur applique mot pour mot.
- Quand le rapport donne une direction (« remplacer une menace physique par une menace institutionnelle »), le réviseur **propose une matérialisation concrète** en respectant trois ancres :
  1. La voix de l'auteur, telle qu'elle s'exprime dans v1
  2. La fiche personnage
  3. Le `world_lexicon.md`
- Le réviseur **ne réécrit jamais une scène ou un passage qui ne fait pas partie du triage**.
- Le réviseur **ne décide jamais qu'une partie est ratée** s'il n'y a pas de mandat explicite pour la modifier.

Les modifications mécaniques (typos, préfixes locuteur, variables orphelines, indentation, didascalies mal formatées) sont **appliquées automatiquement et listées au changelog** comme « auto-fixes hors triage ». Elles ne nécessitent pas de figurer dans le triage. Si un auto-fix est ambigu (ex. : un mot pourrait être un anglicisme volontaire ou une faute), le réviseur le signale au changelog plutôt que d'appliquer.

---

## Comportement si le triage est incomplet

Si une ou plusieurs issues du rapport (Critical, Major, Minor) n'ont pas de verdict dans le triage, le réviseur **bloque** : il ne produit ni `.ink` ni changelog, et renvoie un message identifiant les issues sans verdict :

> Triage incomplet. Issues sans verdict : <liste>. Merci de compléter et de renvoyer le bundle.

Aucune issue n'est appliquée silencieusement. Aucune issue n'est ignorée silencieusement. C'est ce qui garantit qu'une omission de triage ne « corrompt » pas la suite du pipeline.

---

## Règles de décision après réception du `.ink` v<x+1>

L'auteur lit le changelog et inspecte la nouvelle version. Trois cas :

| Situation | Action |
|-----------|--------|
| Changelog cohérent avec le triage, aucune surprise | Soumettre v<x+1> à l'évaluateur |
| Une modification ne correspond pas à l'intention | Corriger à la main dans la nouvelle version, ou rouvrir un cycle de révision |
| Le changelog signale une ambiguïté (auto-fix incertain, direction non matérialisable) | Trancher à la main et corriger ; pas besoin de re-passer le réviseur |

L'auteur peut toujours intervenir directement sur le `.ink` produit avant de le soumettre à l'évaluation suivante. Le réviseur n'est pas l'autorité finale.

---

## Notes de production

- La convention de nommage `revision_v<x>_to_v<x+1>.md` suppose qu'on ne fait pas plusieurs branches parallèles d'une même version. Si ce besoin émerge (rare en solo), on adaptera.
- Le format de triage à listes (RETENU / MODIFIÉ / REJETÉ) est volontairement simple. Si à l'usage on s'aperçoit qu'il manque une catégorie (par exemple « EN ATTENTE » pour différer une décision), elle s'ajoutera.
- Le seuil de blocage sur triage incomplet est strict. Si à l'usage il s'avère trop pénible (oublis fréquents), on pourra introduire une catégorie « IGNORER » qui permet à l'auteur de marquer explicitement une issue comme non traitée — différent d'un oubli silencieux.
- L'archivage en `/evaluation/revisions/` est symétrique de `/evaluation/logs/`. À terme, on peut envisager un dossier unique `/evaluation/cycles/<mission>_<scene>_v<x>/` qui regrouperait rapport + révision pour chaque cycle. Pas pour l'instant.
