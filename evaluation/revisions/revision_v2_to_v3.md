# Revision v2 → v3 — Mission 1 / Scène 1

**Rapport source** : eval_mission1_scene1_v2_2026-05-11.md
**Date triage** : 2026-05-16
**Auteur du triage** : Loïc

---

## 1. Triage (rempli par l'auteur avant envoi)

### Critical

- **C1** — Ligne 9 « Entrez. » ambigu (garde ou fonctionnaire) → **RETENU**
  Orientation : attribuer au FONCTIONNAIRE. Réordonner la narration pour qu'il dise « Entrez. » sans lever les yeux du dossier.

### Major

- **M1** — Fonctionnaire commente le fond de la faille dans Reponse_Savoir et Reponse_Silence → **MODIFIÉ**
  Orientation : durcir les répliques vers le moralisme abstrait (registre biblique : conséquences morales, curiosité comme défaut). Retirer toute ambiguïté géographique. Référentiel : v1.

- **M2** — Comment_ca explicite le mécanisme de chantage du garde → **MODIFIÉ**
  Orientation : voie implicite mais lisible. Le fonctionnaire suggère qu'il dispose d'un dossier sur le garde (geste vers un tiroir, mention d'un dossier), sans détailler le contenu ni le mécanisme. Préserver l'idée que Jean Dubois instrumentalise la corruption sans s'y salir les mains. Cohérent avec jean_dubois.md.

- **M3** — Mot « abîme » absent → **MODIFIÉ**
  Orientation : voie mixte. Le fonctionnaire utilise « abîme » une à deux fois comme marqueur signature. « Là-bas »/« en bas » restent acceptables ailleurs comme registre courant.

- **M4** — Pseudo-choix `[Utile ?]` dans Pourquoi_traitement → **RETENU**
  Orientation : absorber en transition narrative, sans bracket.

- **M5** — Sadisme caricatural à deux endroits → **RETENU**
  Orientation :
  (a) Knot Le_garde, ligne 108 : supprimer « Enfin... rien qu'il ne puisse supporter ».
  (b) Clôture, lignes 205-207 : supprimer le sourire. Garder « mort certaine » et l'effet de chute. La cruauté est dans le mot, pas dans la physionomie.

### Minor

- **m1** — Typo ligne 178 « la-bàs » → **RETENU**
  Auto-fix : corriger en « là-bas ».

- **m2** — Grammaire interactive incohérente dans Comment_ca (« De quel genre de service ? » non formalisée en choix) → **MODIFIÉ**
  Orientation : le réviseur tranche selon ce qui sonne juste dans la réécriture voie B de Comment_ca (joueur muet ou reprise de parole en choix `[...]`).

- **m3** — Variable player_age déclarée et jamais consommée → **RETENU**
  Auto-fix : supprimer la déclaration.

- **m4** — player_name jamais initialisé dans le fichier → **RETENU**
  Auto-fix : ajouter un commentaire en tête de fichier pour documenter que l'affectation est déléguée à Unity.

- **m5** — Choix `+` rejouables dans le hub Questions → **REJETÉ**
  Motif : exploration libre voulue sur les questions de lore.

- **m6** — Choix unique final `[Le remercier]` → **REJETÉ**
  Motif : clôture en bouton de validation assumée. Sera réévalué au cycle suivant si nécessaire.

### Auto-fixes attendus en plus (non listés au rapport mais identifiés)

- Ajouter les préfixes locuteur (FONCTIONNAIRE:/JOUEUR:/[didascalie]) sur toutes les répliques, conformément à ink_conventions.md §1. La v2 ne les portait pas — non-conformité technique non détectée par l'évaluation v2.

---

## 2. Changelog (rempli par le réviseur)

[à compléter par l'agent réviseur]

### Issues retenues / modifiées

### Issues rejetées (rappel pour traçabilité)

### Auto-fixes hors triage (conformité technique)

### Signalements
