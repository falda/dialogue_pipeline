# Player Experience

## Identité de surface (v0.4, révisée v0.13)
- **Genre** : homme
- **Âge** : 28-38 ans (adulte)
- **Voix narrative** : choix de répliques détaillés, sans voix intérieure
- **Interface dialogue** : roue de dialogue type Mass Effect 2/3, sans Paragon/Renegade

## Postulat de départ
Le joueur descend volontairement dans l'abîme. Il a payé / soudoyé pour intégrer un convoi de condamnés. Il cherche quelque chose, défini par sa motivation initiale.

## Modèle de personnage — Projection
Le joueur ne joue pas un personnage prédéfini. Il crée le sien en répondant à une question dans la scène 1 (interrogatoire à la surface).

## Les 4 motivations
- **Le silencieux** — refuse de se justifier
- **La quête personnelle** — il cherche quelqu'un
- **La quête de savoir** — il veut comprendre ce qu'il y a en bas
- **La fuite** — il échappe à quelque chose à la surface

Chaque motivation déclenche un avertissement différent du fonctionnaire en fin de scène 1, et conditionne quatre versions du dialogue de l'entité en mission 10 (Acte III).

## Secret du joueur — modèle mixte
La **descente volontaire** reste cachée jusqu'à un moment scripté du récit. La **motivation précise** peut être révélée plus librement aux PNJs proches via choix de dialogue.

## État psychologique initial du protagoniste (v0.7)
- épuisé
- détaché de la surface
- cherche une forme de sens

## Tendances
- observe avant de parler
- évite les conflits directs
- curiosité dangereuse

## Ce qu'il ne doit pas devenir
- héros d'action classique
- personnage cynique comique
- personnage bavard

---

## Parcours émotionnel attendu (par acte)

### Acte I — Émergence
Le joueur est étranger, observateur. Il subit ou suit (pas de tableau de contrats, missions du mentor ou événements ville). Il s'illustre par accident à la mission climactique. Reçoit le surnom "héros de la brèche".

Émotions visées : malaise, irréversibilité, vertige, curiosité contenue, premier deuil (mentor).

### Transition Acte I → II
Reconnaissance. Conseil de crise. Basculement vers la légitimité naissante.

### Acte II — Construction
Le joueur choisit. Ouverture du tableau du Conseil après être devenu Régent (mission 7). Construction du pouvoir, ambivalence du chemin choisi (César ou Médicis).

Émotions visées : agentivité progressive, tension morale, ambiguïté.

### Acte III — Crise
Point bas intérieur. Doute fondamental sur sa propre légitimité. Ce n'est pas "j'ai perdu" — c'est "je ne sais plus si je mérite". La résonance avec le mentor mort (qui a obéi) émerge ici.

L'entité parle directement au héros pour la première fois (mission 10).

Émotions visées : doute, vertige moral, isolement.

### Acte IV — Descente
Confrontation. Choix final. Plus de retour en ville, plus de gestion. Structure ME3 fin (alternance camp/mission).

Émotions visées : convergence, fatalisme partiel, lucidité, choix.

---

## Principes d'écriture pour la voix du joueur

- Le joueur observe avant de parler.
- Pas de monologue intérieur.
- Les répliques du joueur doivent porter son état émotionnel (épuisé, détaché, parfois curieux) par leur économie, leur registre et leur rythme — pas par verbalisation explicite de ce qu'il ressent.
- Les choix de dialogue doivent toujours représenter de vraies attitudes différentes (cf. dialogue_style_guide.md).
- La cohérence libellé/réplique parlée est définie dans dialogue_style_guide.md.

> **Note d'évolution (v0.13)** : la voix intérieure (inspiration Disco Elysium initialement prévue) a été abandonnée. L'écriture s'appuie désormais sur les seules répliques parlées du joueur et sur les didascalies, avec l'exigence que la voix du protagoniste soit lisible *à travers* ses choix et la sobriété de ses formulations.

---

## Interface dialogue type Mass Effect 2/3

- Roue de dialogue avec choix multiples.
- Pas de système Paragon/Renegade.
- Les choix peuvent être grisés (déjà explorés) mais rejouables.
- Distinction entre choix de lore (creuser un sujet, retour à la roue) et choix de progression (avance la scène).
- Les choix de progression peuvent être visiblement différents (couleur, position, marqueur).

Référence d'implémentation : voir la structure des dialogues de la scène 1 dans `/dialogues/missions/mission1/scenes/`.
