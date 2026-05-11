VAR player_name = ""
VAR player_age = 0
VAR motivation = ""

=== Scene1 ===

Le garde pousse la porte de la salle d’interrogatoire.

Entrez.

Le fonctionnaire ne lève pas immédiatement les yeux de son dossier.

J’étais justement en train de lire votre rapport.  
Asseyez-vous donc.

Le joueur s’assoit.

Alors comme ça, c’est vous qui tentez de soudoyer mes gardes pour accéder à la faille ?

Le garde évite soigneusement son regard.

Retirez-lui ses menottes.  
Notre invité mérite mieux que ça.

Le garde retire les menottes.

Vous pouvez disposer.  
Je m’occuperai de votre cas plus tard.

Le garde quitte rapidement la pièce.

Le fonctionnaire ouvre le dossier devant lui.

J’ai mené quelques recherches à votre sujet.

// Ouverture de l'interface de création du personnage dans Unity

Oh... mais je manque à tous mes devoirs.

Je suis XXX XXX.  
Je supervise les détenus envoyés dans la faille.

->Questions


=== Questions ===

+ [Où suis-je ?]
    Où m’avez-vous emmené ?
    ->Ou_suis_je

+ [Pourquoi ce traitement ?]
    Je pensais recevoir un accueil moins... cordial.
    ->Pourquoi_traitement

+ [Le garde]
    Que comptez-vous faire au garde ?
    ->Le_garde

+ [Pourquoi suis-je ici ?]
    ->Choix_Motivation


=== Ou_suis_je ===

Vous êtes dans la prison de XXX.  
Dans mon bureau, pour être exact.

Ça n’a pas été simple de vous retrouver.

J’espère au moins que le voyage n’a pas été trop désagréable.

->Questions


=== Pourquoi_traitement ===

La corruption reste un crime.

Mais dans votre cas... personne n’a réellement été lésé.

À vrai dire, cette situation pourrait même m’être utile.

+ [Utile ?]
    Comment ça ?
    ->Comment_ca


=== Comment_ca ===

Dans ce métier, disposer de quelques dettes à rappeler peut s’avérer précieux.

Quand j’aurai besoin d’un service... certains collègues auront tout intérêt à coopérer.

De quel genre de service ?

Le genre de service qui permet de transférer discrètement certains détenus... ou de faire taire ceux qui deviennent gênants.

->Questions


=== Le_garde ===

Il m’est utile.

Je ne compte pas lui faire de mal.

Enfin... rien qu’il ne puisse supporter.

->Questions


=== Choix_Motivation ===

Vous êtes un cas inhabituel.

En toute honnêteté, je n’avais encore jamais rencontré quelqu’un cherchant volontairement à descendre là-bas.

Et pourtant, vous avez insisté.

Pourquoi ?

* [Je veux quitter cet endroit]
    Il n’y a plus rien pour moi ici.
    ~ motivation = "fuite"
    ->Reponse_Fuite

* [Je dois retrouver quelqu’un]
    Quelqu’un m’attend peut-être encore là-bas.
    ~ motivation = "quete"
    ->Reponse_Quete

* [Je veux savoir ce qu’il y a au fond]
    Je veux voir ce que les autres refusent de regarder.
    ~ motivation = "savoir"
    ->Reponse_Savoir

* [Garder le silence]
    ...
    ~ motivation = "silence"
    ->Reponse_Silence


=== Reponse_Fuite ===

Vous pouvez fuir aussi loin que vous le souhaitez, Monsieur {player_name}.

Il n’existe aucun endroit où l’on échappe aux conséquences de ses actes.

->Fin_Interrogatoire


=== Reponse_Quete ===

Vous êtes prêt à descendre jusque-là pour une seule personne...

C’est admirable.

Mais dites-moi, Monsieur {player_name}...  
Cette personne souhaite-t-elle réellement vous revoir ?

->Fin_Interrogatoire


=== Reponse_Savoir ===

La curiosité est un vilain défaut, Monsieur {player_name}.

Je crains qu’il n’y ait rien en bas que vous ne sachiez déjà.

->Fin_Interrogatoire


=== Reponse_Silence ===

J’ai tout de même ma petite idée sur ce que vous cherchez, Monsieur {player_name}.

Mais je crains que vous ne trouviez rien que la mort la-bàs.

->Fin_Interrogatoire


=== Fin_Interrogatoire ===

Quoi qu’il en soit, j’admire votre détermination.

Je ne vois aucune raison de vous empêcher de descendre dans la faille.

Le prochain transfert aura lieu la semaine prochaine.  
Vous en ferez partie.

En attendant, je vais devoir vous faire reconduire en cellule.

Évitez simplement d’attirer davantage l’attention.

Le fonctionnaire referme lentement le dossier.

* [Le remercier]
    Merci, Monsie—

    Non.

    Ne me remerciez pas.

    Après tout... je vous envoie vers une mort certaine.

    Un léger sourire apparaît sur son visage.

    Je vous dis adieu, Monsieur {player_name}.

    -> END