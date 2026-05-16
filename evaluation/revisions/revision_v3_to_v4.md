# Revision v3 → v4 — Mission 1 / Scène 1

**Rapport source** : evaluation_mission1_scene1_v3.txt (2026-05-16)
**Date triage** : 2026-05-16
**Auteur du triage** : Loïc
**Mode** : révision intégrée (sans agent réviseur isolé)

---

## 1. Triage (rempli par l'auteur)

### Critical

- **C1** — Faux choix au knot `Fin_Interrogatoire` (un seul `* [Le remercier]`) → **MODIFIÉ**
  Orientation : ajouter une vraie alternative `[Sortir en silence]`. La branche `[Le remercier]` reste identique à v3. La nouvelle branche `[Sortir en silence]` mène à la même chute mais par un autre rythme : le fonctionnaire souhaite bonne chance, pause, puis « Après tout je vous envoie à une mort certaine. Je vous dis adieu, Monsieur {player_name}. »

- **C2** — `INCLUDE global.ink` manquant, redéclarations de `player_name` et `motivation` → **RETENU**
  Auto-fix mécanique : ajouter `INCLUDE global.ink` en tête de fichier, supprimer les déclarations locales redondantes.

### Major

- **M1** — Fragmentation `Pourquoi_traitement` → `Comment_ca` → **RETENU**
  Orientation : fusionner en un seul knot.

- **M2** — Pattern de maxime finale sur les quatre `Reponse_*` → **REJETÉ**
  Motif : le joueur ne voit qu'une seule des quatre réponses par partie, l'effet de pattern est invisible en jeu. Le pattern facilite l'écriture et est assumé.

- **M3** — Voix du protagoniste sous-caractérisée → **DÉCISION STRUCTURELLE**
  Décision prise : la voix intérieure (modèle Disco Elysium) est supprimée du projet. Pour v4 : retravailler les répliques du joueur pour qu'elles portent l'état « épuisé / détaché » sans recourir à une voix intérieure.
  Implications hors v4 : `player_experience.md` et GDD à mettre à jour.

### Minor

- **m1** — Phrase signature « Les menottes sont faites pour les criminels » absente → **REJETÉ**
  Motif : phrase abandonnée à l'écriture de v3. Fiche `jean_dubois.md` mise à jour.

- **m2** — Prolepse « Vous l'apprendrez à vos dépens » (`Reponse_Savoir`) → **MODIFIÉ**
  Orientation : reformuler pour menacer sans annoncer. Proposition à valider avant intégration.

- **m3** — Noms propres en `XXX` → **REJETÉ**
  Motif : à traiter plus tard, hors v4.

- **m4** — Densité visuelle → **RETENU**
  Orientation : aérer avec quelques didascalies supplémentaires.

### Remarques de relecture auteur (issues non listées par le rapport)

- **r1** (l. 95) — Reformulation réplique sur le dossier du garde → **RETENU**
  Application directe : « Un homme qui sait que l'on a un dossier sur lui est toujours très coopératif ».

- **r2** (l. 102-104) — Reformulation Le_garde → **RETENU**
  Orientation : « rien de mal, ça dépendra de lui » ou variante à valider.

- **r3** (l. 115) — « vous avez insisté » → « et pourtant vous êtes là » → **RETENU**
  Application directe : retour à la formulation v1.

- **r4** (l. 151) — « une seule personne » → « quelqu'un » → **RETENU**
  Application directe : « jusque-là pour quelqu'un... »

- **r5** (l. 172-174) — `Reponse_Silence`, refonte complète → **RETENU**
  Orientation : « Vous êtes prudent, Monsieur {player_name}. C'est rare et précieux. N'en abusez pas trop. » ou variante à valider.

---

## 2. Changelog

### Issues retenues / modifiées

- **C1** → emplacement : knot `Fin_Interrogatoire`, fin du knot → modification appliquée : ajout d'une seconde branche `* [Sortir en silence]` à côté de `* [Le remercier]`. Branche `[Le remercier]` strictement identique à v3. Nouvelle branche : le joueur se lève sans rien dire (didascalie), le fonctionnaire répond « Bonne chance, Monsieur {player_name}. », pause (didascalie), puis « Après tout... je vous envoie vers une mort certaine. Je vous dis adieu. ». Les deux branches convergent vers `-> END` mais avec deux rythmes de cruauté distincts (coupure vs politesse renversée).

- **C2** → emplacement : tête de fichier → modification appliquée : ajout de `INCLUDE global.ink` en première ligne. Suppression des déclarations locales `VAR player_name = ""` et `VAR motivation = ""`. Suppression du commentaire `// initialisée par Unity` (déjà documenté dans `global.ink`).

- **M1** → emplacement : knots `Pourquoi_traitement` et `Comment_ca` → modification appliquée : fusion en un seul knot `Pourquoi_traitement`. La transition par la réplique JOUEUR « Utile ? » est conservée au sein du knot fusionné, sans bracket. La didascalie du tiroir et la réplique sur le dossier suivent directement. Retour à `Questions` à la fin. Le knot `Comment_ca` est supprimé.

- **M3** → emplacement : répliques JOUEUR de `Choix_Motivation` → modification appliquée : « Je veux voir ce que les autres refusent de regarder. » devient « J'ai besoin de comprendre. » (plus court, plus sobre). « Quelqu'un m'attend peut-être encore là-bas. » devient « Quelqu'un m'y attend peut-être encore. » (plus naturel). Les autres répliques JOUEUR étaient déjà suffisamment sobres et restent inchangées.

- **m2** → emplacement : knot `Reponse_Savoir` → modification appliquée : « Vous l'apprendrez à vos dépens. » devient « C'est un défaut auquel je ne peux que vous souhaiter de survivre. ». La menace reste mais ne désigne plus d'événement futur. Cf. section Signalements (à valider).

- **m4** → emplacement : `Choix_Motivation` et `Fin_Interrogatoire` → modification appliquée : ajout de deux didascalies. Dans `Choix_Motivation`, ajout de `[Le fonctionnaire l'observe un instant.]` entre la deuxième et la troisième réplique. Dans `Fin_Interrogatoire`, ajout de `[Le fonctionnaire prend une note dans le dossier.]` entre la deuxième et la troisième réplique.

- **r1** → emplacement : knot fusionné `Pourquoi_traitement` (anciennement `Comment_ca`) → modification appliquée : « Un homme qui sait qu'on a un dossier sur lui devient remarquablement coopératif. » devient « Un homme qui sait que l'on a un dossier sur lui est toujours très coopératif. ». Reformulation auteur intégrée telle quelle.

- **r2** → emplacement : knot `Le_garde` → modification appliquée : « Je ne compte pas lui faire de mal. » devient « Rien de mal, je pense. Ça dépendra de lui. ». La phrase précédente « Il m'est utile. » est conservée. Cf. section Signalements (à valider).

- **r3** → emplacement : knot `Choix_Motivation`, troisième réplique du fonctionnaire → modification appliquée : « Et pourtant, vous avez insisté. » devient « Et pourtant vous êtes là. ».

- **r4** → emplacement : knot `Reponse_Quete`, première réplique → modification appliquée : « Vous êtes prêt à descendre jusque-là pour une seule personne... » devient « Vous êtes prêt à descendre jusque-là pour quelqu'un... ».

- **r5** → emplacement : knot `Reponse_Silence` → modification appliquée : refonte complète. « Le silence est la plus prudente des réponses, Monsieur {player_name}. / Mais il n'a jamais épargné personne du jugement. » devient « Vous êtes prudent, Monsieur {player_name}. / C'est rare et précieux. N'en abusez pas trop. ». Cf. section Signalements (à valider).

### Issues rejetées (rappel pour traçabilité)

- **M2** — non appliqué, motif transmis par l'auteur : pattern de maxime invisible en jeu, assumé.
- **m1** — non appliqué, motif transmis par l'auteur : phrase signature abandonnée à l'écriture de v3.
- **m3** — non appliqué, motif transmis par l'auteur : à traiter plus tard, hors v4.

### Auto-fixes hors triage (conformité technique)

- Aucun préfixe locuteur manquant détecté dans v3 ; v4 conserve l'ensemble des préfixes.
- Aucune variable orpheline détectée dans v4.
- Convention de nommage de knots respectée (Snake_Case_Avec_Majuscules).

### Signalements

- **À valider avant push final** : trois reformulations produites par Claude où l'auteur a explicitement demandé validation avant intégration.
  - **m2 — Reponse_Savoir** : « C'est un défaut auquel je ne peux que vous souhaiter de survivre. » (en remplacement de « Vous l'apprendrez à vos dépens. »)
  - **r2 — Le_garde** : « Rien de mal, je pense. Ça dépendra de lui. » (en remplacement de « Je ne compte pas lui faire de mal. »)
  - **r5 — Reponse_Silence** : « N'en abusez pas trop. » (seconde phrase, après « C'est rare et précieux. »)

- **Décision structurelle M3 à propager hors v4** : la suppression de la voix intérieure doit être reflétée dans `player_experience.md` (section « Principes d'écriture pour la voix du joueur » et titre « Interface dialogue type Mass Effect 2/3 + modèle 2 Disco Elysium ») et dans le GDD (section identité du joueur, mentions de « modèle 2 » et « Contenu narratif type Disco Elysium »). À faire avant le triage de la prochaine scène pour éviter que les référentiels divergent.

- **Mode de révision** : ce cycle a été produit en mode révision intégrée (Claude assistant dans la conversation principale, sans agent réviseur isolé). Garde-fou appliqué : seul ce qui a été acté explicitement par l'auteur dans le triage a été modifié ; aucune réécriture hors triage n'a été effectuée. À surveiller à l'évaluation v4 : si v4 régresse sur des aspects non couverts par le triage, cela signifierait que la révision intégrée introduit des dérives invisibles.
