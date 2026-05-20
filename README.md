# Projet L'Abîme — Pipeline d'écriture des dialogues

Cette pipeline structure l'écriture, la révision et l'évaluation des dialogues du jeu narratif **L'Abîme**.

Le GDD (`GDD_Labime_v*.txt`) reste la source de vérité du jeu. La pipeline organise tout ce qui sert à écrire les dialogues à partir de ce GDD.

Pour une vue d'ensemble du fonctionnement et des principes directeurs, voir `pipeline_overview.md`.

---

## Arborescence

```
/characters
  protagonist.md                personnage incarné par le joueur
  _template_character.md        gabarit standard de fiche
  /pc                           héros recrutables (partent en mission)
  /npc                          PNJs (présents en ville, ne combattent pas)

/global                         documents valables pour tous les dialogues
  dialogue_style_guide.md       règles d'écriture (rythme, sous-texte, IA à éviter)
  world_rules.md                règles du monde, lore, ton général
  world_lexicon.md              vocabulaire autorisé/interdit, périphrases
  player_experience.md          intentions émotionnelles attendues par acte/scène
  ink_conventions.md            conventions d'écriture des fichiers .ink
  global.ink                    variables Ink partagées entre toutes les scènes

/dialogues                      scénarios et dialogues, organisés par mission
  /missions
    /mission1
      /scenes
        scenario_mission1_scene1.md   intention et contraintes de la scène
        mission1_scene1.ink           version courante du dialogue
        mission1_scene1_v2.ink        versions antérieures conservées

/evaluation                     système de revue des dialogues
  evaluation_rubric.md          grille de notation
  evaluation_process.md         procédure d'évaluation
  revision_process.md           procédure de triage et de révision
  /logs                         rapports d'évaluation archivés
  /revisions                    triages et changelogs archivés

prompt_evaluateur_pipeline.txt  prompt système du projet Claude Évaluateur
```

---

## Boucle de travail (résumé)

1. **Scénario** — rédiger ou mettre à jour `scenario_*.md` (intention, contraintes, état émotionnel attendu).
2. **Écriture** — produire le `.ink` à partir du scénario, des fiches personnages, des règles globales et des conventions Ink.
3. **Évaluation** — projet Claude dédié **L'Abîme — Évaluateur**. Rapport archivé dans `/evaluation/logs/`.
4. **Triage + révision** — dans le projet principal, l'auteur trie les retours avec Claude qui produit ensuite la version suivante et le changelog. Archivé dans `/evaluation/revisions/`.
5. **Itération** jusqu'à ce que l'auteur juge la scène suffisamment aboutie (pas de seuil chiffré, validation qualitative).
6. **Relecture et validation** par l'auteur.

Détails complets dans `pipeline_overview.md`.

---

## Conventions

- **Versionnage** : `mission1_scene1.ink` est la version courante. Les anciennes versions sont conservées sous `mission1_scene1_v2.ink`, `_v3.ink`, etc.
- **Nommage de fichiers** : `snake_case`, en minuscules.
- **Nommage des nœuds Ink et autres règles Ink** : voir `/global/ink_conventions.md`.
- **Variables Ink globales** : déclarées dans `global.ink`, jamais redéclarées localement.
- **Source de vérité unique** : une information n'est qu'à un seul endroit. Si elle vient du GDD, la fiche personnage la résume avec un lien de référence, elle ne la duplique pas mot pour mot.
