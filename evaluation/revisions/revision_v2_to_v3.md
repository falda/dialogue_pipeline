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

### Issues retenues / modifiées

- **C1** → emplacement : ouverture du knot Scene1 → modification appliquée : la didascalie « Le fonctionnaire ne lève pas les yeux de son dossier » est déplacée avant « Entrez. », qui est désormais préfixée FONCTIONNAIRE. La seconde mention du même geste, qui suivait dans v2, est supprimée pour éviter la redondance.

- **M1** → emplacement : knots Reponse_Savoir et Reponse_Silence → modification appliquée : reformulations sans référence géographique au fond. Reponse_Savoir : « La curiosité est un vilain défaut, Monsieur {player_name}. / Vous l'apprendrez à vos dépens. ». Reponse_Silence : « Le silence est la plus prudente des réponses, Monsieur {player_name}. / Mais il n'a jamais épargné personne du jugement. ». Ancrage v1 conservé : la maxime sur la curiosité (Reponse_Savoir) et la rhétorique morale de conséquence (Reponse_Silence).

- **M2** → emplacement : knot Comment_ca → modification appliquée : réécriture intégrale en mode implicite. Suppression des deux phrases qui décrivaient le « genre de service » (transfert de détenus, faire taire). Ajout d'une didascalie « [Le fonctionnaire pose la main sur un tiroir, sans l'ouvrir.] » suivie d'une mention indirecte du dossier sur le garde. Le mécanisme de chantage n'est plus jamais énoncé ; seul le geste et le mot « dossier » portent le sous-entendu.

- **M3** → emplacement : knot Choix_Motivation, troisième réplique du fonctionnaire → modification appliquée : « cherchant volontairement à descendre là-bas » devient « cherchant volontairement à descendre dans l'abîme ». Une seule occurrence introduite, conformément à l'orientation.

- **M4** → emplacement : knot Pourquoi_traitement → modification appliquée : suppression du choix `+ [Utile ?]`. La réplique du joueur « Utile ? » est intégrée comme transition forcée (préfixe JOUEUR:, sans bracket), suivie d'un divert direct vers Comment_ca.

- **M5a** → emplacement : knot Le_garde → modification appliquée : suppression intégrale de la troisième réplique « Enfin... rien qu'il ne puisse supporter. »

- **M5b** → emplacement : knot Fin_Interrogatoire, choix `[Le remercier]` → modification appliquée : suppression de la didascalie « Un léger sourire apparaît sur son visage. ». Les répliques « Après tout... je vous envoie vers une mort certaine. » et « Je vous dis adieu, Monsieur {player_name}. » sont conservées telles quelles.

- **m2** → emplacement : knot Comment_ca → modification appliquée : résolue mécaniquement par la réécriture de M2. La réplique « De quel genre de service ? » a disparu, le joueur reste muet dans ce knot (cohérent avec la fiche protagoniste : « observe avant de parler »). Choix de la voie « joueur muet » sur les deux pistes proposées par le triage.

- **m3** → emplacement : tête de fichier → modification appliquée : suppression de la déclaration `VAR player_age = 0`.

- **m4** → emplacement : tête de fichier, au-dessus de `VAR player_name` → modification appliquée : ajout du commentaire `// initialisée par Unity`, conforme à ink_conventions.md §4.

### Issues rejetées (rappel pour traçabilité)

- **m5** — non appliqué, motif transmis par l'auteur : exploration libre voulue sur les questions de lore.

- **m6** — non appliqué, motif transmis par l'auteur : clôture en bouton de validation assumée. Sera réévalué au cycle suivant si nécessaire.

### Auto-fixes hors triage (conformité technique)

- Ajout des préfixes locuteur FONCTIONNAIRE: et JOUEUR: sur toutes les répliques parlées (tous les knots), conformément à ink_conventions.md §1 et au point identifié par l'auteur en fin de triage.
- Mise entre crochets `[...]` de toutes les didascalies préexistantes (Scene1, transitions, fermeture du dossier), conformément à ink_conventions.md §2.
- Disparition mécanique du typo « la-bàs » (ligne 178 v2) par la réécriture de Reponse_Silence dans le cadre de M1 — l'auto-fix m1 est donc absorbé sans intervention dédiée.

### Signalements

- Le fichier `scenario_mission1_scene1.md` n'était pas fourni avec le bundle. La révision a pu être menée car les contraintes scénaristiques mobilisées par le triage (le garde ne parle pas, cadre de l'interrogatoire, etc.) sont déjà reprises dans la fiche `jean_dubois.md` et dans le rapport d'évaluation v2. Aucune direction du triage n'a été bloquée par cette absence, mais à confirmer pour les cycles suivants.
- Le fichier v2 ne contient pas de directive `INCLUDE global.ink`, alors que `global.ink` déclare déjà `player_name`, `player_age` et `motivation`. La déclaration locale `VAR motivation` reste donc en doublon avec la déclaration globale. Le triage ne demande pas d'ajouter cet INCLUDE ni de supprimer la redéclaration locale ; statu quo conservé. À résoudre au cycle suivant si l'auteur souhaite la conformité avec ink_conventions.md §4.
- Le knot `Fin_Interrogatoire` contient un seul choix `* [Le remercier]` — non-conforme à ink_conventions.md §6 (« un knot ne doit jamais contenir un seul choix unique présenté avec * ou + »). L'issue m6 ayant été explicitement rejetée par l'auteur, la structure est conservée. Tension à arbitrer au cycle suivant si elle persiste.
