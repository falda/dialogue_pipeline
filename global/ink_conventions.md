# Ink Conventions

Conventions d'écriture des fichiers `.ink` pour le projet L'Abîme.

Ces conventions s'appliquent à tous les dialogues. Elles sont vérifiées dans la validation technique de `evaluation_rubric.md`.

---

## 1. Attribution des locuteurs

Toute réplique parlée doit être attribuée par un préfixe en tête de ligne :

```
LOCUTEUR: Réplique.
```

### Règles

- Préfixe en **MAJUSCULES**, suivi de `:` et d'une espace.
- Une seule réplique par ligne. Si un personnage enchaîne plusieurs phrases courtes liées, chacune sur sa ligne avec son préfixe.
- Le préfixe doit correspondre à un **identifiant de locuteur autorisé** (voir liste plus bas).
- Unity filtre les préfixes à l'affichage et les utilise pour piloter le portrait/le nom/l'animation.

### Exemple

```
FONCTIONNAIRE: J'étais justement en train de lire votre rapport.
FONCTIONNAIRE: Asseyez-vous donc.

JOUEUR: Où m'avez-vous emmené ?
```

### Cas particulier — le joueur

Le préfixe `JOUEUR:` s'utilise pour les répliques automatiques du protagoniste (sans choix) et pour le résultat d'un choix.

Pour un choix interactif, le libellé entre `[...]` est court et reste tel quel (c'est ce qui s'affiche sur le bouton de la roue). La réplique réellement prononcée par le joueur, juste après, porte le préfixe :

```
+ [Où suis-je ?]
    JOUEUR: Où m'avez-vous emmené ?
    ->Ou_suis_je
```

---

## 2. Didascalies

Les didascalies (actions, descriptions, indications de mise en scène) sont entre crochets `[...]` et placées sur leur propre ligne :

```
[Le fonctionnaire ouvre le dossier devant lui.]

FONCTIONNAIRE: J'ai mené quelques recherches à votre sujet.

[Le garde retire les menottes.]
```

### Règles

- Une didascalie ne contient **jamais de réplique parlée**.
- Une didascalie peut décrire : une action visible, un mouvement, un changement d'état émotionnel observable, une indication de mise en scène.
- Unity filtre les crochets à l'affichage. Les didascalies sont des indications pour le moteur (caméra, animation, son) ou pour la lecture par l'auteur.
- Pas de didascalie purement intérieure (« il pense que... »). On ne décrit que ce qui est visible ou perceptible.

### Distinction avec les commentaires Ink

- `[Description visible]` → didascalie diégétique, consommée par Unity.
- `// Note de l'auteur` → commentaire de code, ignoré partout.
- `/* Bloc d'auteur */` → idem, multi-lignes.

Les commentaires (`//` ou `/* */`) servent aux notes de travail. Les didascalies servent à la mise en scène.

---

## 3. Identifiants de locuteurs autorisés

Liste à enrichir au fil de l'écriture. Un nouvel identifiant ajouté ici doit aussi être déclaré côté Unity.

| Identifiant | Description |
|-------------|-------------|
| `JOUEUR` | Le protagoniste |
| `FONCTIONNAIRE` | Fonctionnaire de surface (scène 1, prologue) |
| `GARDE` | Garde de la prison de surface — ne parle pas, présent uniquement en didascalie |
| `MENTOR` | Le mentor (Acte I) |
| `NARRATEUR` | Voix narrative non incarnée (à utiliser avec parcimonie) |

> **Note** : le `GARDE` n'a pas le droit de parler dans la scène 1 (cf. `scenario_mission1_scene1.md`). S'il devait parler ailleurs, prévoir un identifiant dédié.

---

## 4. Variables

- Les variables globales sont déclarées dans `global.ink` et incluses via `INCLUDE global.ink` en tête de fichier.
- Les variables locales (état d'une seule scène) sont déclarées en tête du fichier de scène.
- Les variables initialisées en dehors d'Ink (par Unity) doivent porter un commentaire `// initialisée par Unity` au-dessus de la déclaration.
- Les variables déclarées doivent être consommées. Une variable orpheline (déclarée et jamais lue) est un défaut signalé en validation technique.

---

## 5. Nommage

- **Knots** (`=== Nom ===`) : `Snake_Case_Avec_Majuscules` (ex : `Choix_Motivation`).
- **Stitches** (`= nom`) : `snake_case` (ex : `interrogatoire`).
- **Variables** : `snake_case` (ex : `player_name`).
- **Identifiants de locuteurs** : `MAJUSCULES`.

---

## 6. Choix interactifs

- `*` pour un choix consommé (non rejouable).
- `+` pour un choix persistant (rejouable).
- Un knot ne doit jamais contenir **un seul choix unique** présenté avec `*` ou `+`. Soit le passage est forcé (alors pas de bracket), soit il y a au moins deux alternatives. Voir `dialogue_style_guide.md` (interdiction des faux choix).

---

## 7. Exemple complet — extrait conforme

```ink
INCLUDE global.ink

=== Scene1 ===

[Le garde pousse la porte de la salle d'interrogatoire.]

FONCTIONNAIRE: Entrez.

[Le fonctionnaire ne lève pas immédiatement les yeux de son dossier.]

FONCTIONNAIRE: J'étais justement en train de lire votre rapport.
FONCTIONNAIRE: Asseyez-vous donc.

[Le joueur s'assoit.]

FONCTIONNAIRE: Alors comme ça, c'est vous qui tentez de soudoyer mes gardes pour accéder à la faille ?

->Questions
```
