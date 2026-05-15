//Créer une variable qui permettent de faire le lien avec le Global.ink
//Créer une variable pour stocker le choix de motivation que va faire le joueur dans cette scène
//Créer une variable contenant les informations que va renseigner le joueur 

->Scene1
=== Scene1 ===

-> Interrogatoire
= Interrogatoire 

/*
    Le joueur est menotté, il entre dans une salle d'interrogatoire escorté par un garde.
    Quelqu'un l'attend dans la salle il est assis et feuillète tranquillement un document.
    C'est un fonctionnaire il doit avoir autour de la cinquantaine.
    Le garde attends avec vous à l'entrée de la porte il est un peu nerveux on sent qu'il préfèrerais ne pas avoir à entrer.
    Il interpèlle le joueur et le garde.
*/
Entrez! 
/* 
    Ils entrent
    Le fonctionnaire s'adresse au joueur
*/
J'étais justement en train de feuilleter le rapport vous concernant. Oh mais asseyez-vous ne restez pas debout.
/* 
    Le joueur s'assoit
    Le fonctionnaire s'adresse au joueur
*/
Alors comme ça c'est vous qui soudoyez mes gardes afin d'aller dans la faille ?
/*
    Le fonctionnaire, a un sourire amusé.
    Gros silence, le joueur n'ose rien dire.
    Le garde est terriblement mal à l'aise, il fuit du regard le fonctionnaire.
    Le fonctionnaire s'adresse au garde 
*/
Retirez lui donc ses menottes, notre invité mérite un meilleur traitement que cela. 
    // Le garde retire les menottes du joueur
Vous pouvez disposer, je m'occuperais de vous plus tard.
/*
    Le garde quitte la pièce il est terrifié.
    Le joueur et le fonctionnaire sont seuls, face à face, le fonctionnaire reprends la conversation. 
*/
J'ai mené ma petite enquête sur vous.
/*
    Il fait glisser un dossier vers nous.
    Une fenêtre s'ouvre le joueur peut personnaliser son personnage, son nom, son âge, etc.
    Il faudra renseigner les informations que rentre le joueur dans une variable en haut de ce fichier et peut être mettre en place une protection contre les injections de code pour pas qu'il puisse casser le jeu où faire le con
    Puis le dialogue reprend.
*/
Oh, mais que je suis malpoli, j'ai oublié de me présenter. 
Je suis xxx xxx, c'est moi qui suit en charge des prisonniers que l'on envoit dans la faille. 
/*
    J'imagine une roue de dialogue semblable à Mass effect avec à gauche des dialogues de lore qui permettent au joueur de creuser le choix s'il le souhaite.
    Les dialogues à gauche seront grisé après avoir étaientt choisit une fois, mais le joueur pourra rejouer le dialogue s'il le veut.
    D'abord les options de dialogue de lore du joueur.
*/

->Questions

= Questions 
*[Où suis-je?]Où m'avez vous emmenez ?->Ou_suis_je
*[Pourquoi ce traitement de faveur?]J'ai soudoyé un de vos gardes, je pensais être d'avantage maltraîté que cela.->Pourquoi_ce_traitement_de_faveur
*[Qu'allez vous faire au garde?]Que comptez vous faire au garde?->Le_garde
/*
    Dans cette roue il y aura 1 choix qui permettront de passer à la suite du dialogue où le joueur donnera sa motivation.
*/
*[Que comptez vous faire de moi?]-> Choix_Motivation

= Ou_suis_je
    //Réponse du fonctionnaire
Vous êtes dans mon bureau au sein de la prison de xxx. Ça n'a pas était simple de vous retrouver et de vous amenez ici.
J'espère que le voyage a étais agréable.
->Questions

= Pourquoi_ce_traitement_de_faveur
    //Réponse fonctionnaire
En effet la corruption est un crime, je devrais vous traiter en déliquant, mais vous n'avez rien fait qui porte préjudice à qui ce soit, c'est même plutôt l'inverse.
/*
    Dialogue dans le dialogue
    Ce dialogue ne s'affiche que si vous avez sélectionné le dialogue "Pourquoi ce traitement de faveur"
*/
    *[Comment ça]Je vous ais étais utile? Comment ça?->Comment_ca

= Comment_ca
    //Réponse fonctionnaire
Vous savez, dans mon travail, c'est toujours utile d'avoir un moyen de pression sur ses collègues . Lorsque j'aurais besoin d'un "service", le moment venu, je sais qu'on ne pourra rien me refuser. 
    //Réponse automatique joueur
De quel genre de "service" on parle?
    //Réponse fonctionnaire
Le genre de "service" qui permettent de faire disparaître des prisonniers génants et tous ceux qui peuvent poser problèmes au sein de cette prison.
->Questions

= Le_garde
    //Réponse fonctionnaire
Il m'est utile, je ne compte rien lui faire, enfin, rien de grave...
    //Petit sourire du fonctionnaire
->Questions


= Choix_Motivation
    //Réponse du fonctionnaire
C'est une bonne question, vous êtes un cas très particulier.
Je dois vous avouez que dans toute ma carrière je n'ai jamais croisé quelqu'un d'assez fou pour vouloir descendre dans cet enfer... 
Et pourtant vous voila, dîtes moi donc pourquoi voulez vous aller la bàs?
    //Réponse du joueur
* [Je veux partir d'ici] Il n'y a plus rien qui m'attende ici.-> Reponse_Fuite
* [Je dois retrouver quelqu'un]Je dois retrouver quelqu'un.-> Reponse_Quete
* [Je veux savoir]Je veux savoir ce qu'il y a là-bas-> Reponse_Savoir
* [Garder le silence]...-> Reponse_Silence
    //Mettre le choix dans la variable déclaré au début du fichier

= Reponse_Fuite
    //Reponse fonctionnaire
Vous pouvez fuir aussi loin que vous le voulez, il n'y a aucun endroit sur cette terre où l'on peut échapper aux conséquences de ces actes, Mrxxx//variable nom du personnage renseigné plus tôt par le joueur.
-> Fin_Interrogatoire

= Reponse_Quete
    //Reponse fonctionnaire
Vous êtes prêts à un grands sacrifice pour cela, c'est tout à votre honneur! Mais cette personne veut-elle seulement vous revoir Mrxxx?

-> Fin_Interrogatoire

= Reponse_Savoir
    //Reponse fonctionnaire
Je sais que je ne sais rien, c'est le premier pas vers la connaissance, mais la curiositée est un villain défauts, vous l'apprendrez à vos dépends Mrxxx.

-> Fin_Interrogatoire

= Reponse_Silence
    //Reponse fonctionnaire
Et bien je ne sais pas ce que vous recherchez, mais tout ce qu'on trouve en bas ce sont les larmes et les grincements de dents Mrxxx.
-> Fin_Interrogatoire

= Fin_Interrogatoire
Dans tous les cas j'admire votre détermination, je ne vois pas de raison de vous empêcher d'aller là-bas. Vous comprendrez que je vous fasse remettre les menottes et renvoyer en cellules? Je ne veux pas que vous attiriez trop l'attention.
Le prochain envoit de prisonniers a justement lieu la semaine prochaine, vous en ferez partie.
Ne me remerciez pas, je vous envoit à une mort certaine après tout, je vous dit adieu.

-> END






































