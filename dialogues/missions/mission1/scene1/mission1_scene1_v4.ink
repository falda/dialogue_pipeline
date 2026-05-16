INCLUDE global.ink

=== Scene1 ===

[Le garde pousse la porte de la salle d'interrogatoire.]

[Le fonctionnaire ne lève pas les yeux de son dossier.]

FONCTIONNAIRE: Entrez.

FONCTIONNAIRE: J'étais justement en train de lire votre rapport.
FONCTIONNAIRE: Asseyez-vous donc.

[Le joueur s'assoit.]

FONCTIONNAIRE: Alors comme ça, c'est vous qui tentez de soudoyer mes gardes pour accéder à l'abîme ?

[Le garde évite soigneusement son regard.]

FONCTIONNAIRE: Retirez-lui ses menottes.
FONCTIONNAIRE: Notre invité mérite mieux que ça.

[Le garde retire les menottes.]

FONCTIONNAIRE: Vous pouvez disposer.
FONCTIONNAIRE: Je m'occuperai de votre cas plus tard.

[Le garde quitte rapidement la pièce.]

[Le fonctionnaire ouvre le dossier devant lui.]

FONCTIONNAIRE: J'ai mené quelques recherches à votre sujet.

// Ouverture de l'interface de création du personnage dans Unity

FONCTIONNAIRE: Oh... mais je manque à tous mes devoirs.

FONCTIONNAIRE: Je suis XXX XXX.
FONCTIONNAIRE: Je supervise les détenus envoyés dans la faille.

->Questions


=== Questions ===

+ [Où suis-je ?]
    JOUEUR: Où m'avez-vous emmené ?
    ->Ou_suis_je

+ [Pourquoi ce traitement ?]
    JOUEUR: Je pensais recevoir un accueil moins... cordial.
    ->Pourquoi_traitement

+ [Le garde]
    JOUEUR: Que comptez-vous faire au garde ?
    ->Le_garde

+ [Pourquoi suis-je ici ?]
    ->Choix_Motivation


=== Ou_suis_je ===

FONCTIONNAIRE: Vous êtes dans la prison de XXX.
FONCTIONNAIRE: Dans mon bureau, pour être exact.

FONCTIONNAIRE: Ça n'a pas été simple de vous retrouver.

FONCTIONNAIRE: J'espère au moins que le voyage n'a pas été trop désagréable.

->Questions


=== Pourquoi_traitement ===

FONCTIONNAIRE: La corruption reste un crime.

FONCTIONNAIRE: Mais dans votre cas... personne n'a réellement été lésé.

FONCTIONNAIRE: À vrai dire, cette situation pourrait même m'être utile.

JOUEUR: Utile ?

[Le fonctionnaire pose la main sur un tiroir, sans l'ouvrir.]

FONCTIONNAIRE: J'ai aussi un dossier sur lui.

FONCTIONNAIRE: Un homme qui sait que l'on a un dossier sur lui est toujours très coopératif.

->Questions


=== Le_garde ===

FONCTIONNAIRE: Il m'est utile.

FONCTIONNAIRE: Rien de mal, je pense. Ça dépendra de lui.

->Questions


=== Choix_Motivation ===

FONCTIONNAIRE: Vous êtes un cas inhabituel.

FONCTIONNAIRE: En toute honnêteté, je n'avais encore jamais rencontré quelqu'un cherchant volontairement à descendre dans l'abîme.

[Le fonctionnaire l'observe un instant.]

FONCTIONNAIRE: Et pourtant vous êtes là.

FONCTIONNAIRE: Pourquoi ?

* [Je veux quitter cet endroit]
    JOUEUR: Il n'y a plus rien pour moi ici.
    ~ motivation = "fuite"
    ->Reponse_Fuite

* [Je dois retrouver quelqu'un]
    JOUEUR: J'espère retrouver quelqu'un.
    ~ motivation = "quete"
    ->Reponse_Quete

* [Je veux savoir ce qu'il y a au fond]
    JOUEUR: J'ai besoin de comprendre.
    ~ motivation = "savoir"
    ->Reponse_Savoir

* [Garder le silence]
    JOUEUR: ...
    ~ motivation = "silence"
    ->Reponse_Silence


=== Reponse_Fuite ===

FONCTIONNAIRE: Vous pouvez fuir aussi loin que vous le souhaitez, Monsieur {player_name}.

FONCTIONNAIRE: Il n'existe aucun endroit où l'on échappe aux conséquences de ses actes.

->Fin_Interrogatoire


=== Reponse_Quete ===

FONCTIONNAIRE: Vous êtes prêt à descendre là-bas pour la revoir...

FONCTIONNAIRE: C'est admirable.

FONCTIONNAIRE: Mais dites-moi, Monsieur {player_name}...
FONCTIONNAIRE: Cette personne souhaite-t-elle réellement vous revoir ?

->Fin_Interrogatoire


=== Reponse_Savoir ===

FONCTIONNAIRE: La curiosité est un vilain défaut, Monsieur {player_name}.

FONCTIONNAIRE: Qui sait jusqu'où elle vous emmenera.

->Fin_Interrogatoire


=== Reponse_Silence ===

FONCTIONNAIRE: Vous êtes prudent d'éviter de me répondre, Monsieur {player_name}.

FONCTIONNAIRE: Mais vous vous dirigez pourtant dans l'endroit le plus dangereux de cette terre.

->Fin_Interrogatoire


=== Fin_Interrogatoire ===

FONCTIONNAIRE: Quoi qu'il en soit, j'admire votre détermination.

FONCTIONNAIRE: Mon rôle n'a jamais était d'interdire qui que ce soit d'aller là-bas. 
FONCTIONNAIRE: Je ne vois donc aucune raison de vous empêcher de descendre dans l'abîme.

[Le fonctionnaire prend une note dans le dossier.]

FONCTIONNAIRE: Le prochain transfert aura lieu la semaine prochaine.
FONCTIONNAIRE: Vous en ferez partie.

FONCTIONNAIRE: En attendant, je vais devoir vous faire reconduire en cellule.

FONCTIONNAIRE: Évitez simplement d'attirer davantage l'attention.

[Le fonctionnaire referme lentement le dossier.]

* [Le remercier]
    JOUEUR: Merci, Monsie—

    FONCTIONNAIRE: Non.

    FONCTIONNAIRE: Ne me remerciez pas.

    FONCTIONNAIRE: Après tout... je vous envoie vers une mort certaine.

    FONCTIONNAIRE: Je vous dis adieu, Monsieur {player_name}.

    -> END

* [Sortir en silence]
    [Le joueur se lève sans rien dire.]

    FONCTIONNAIRE: Bonne chance, Monsieur {player_name}.

    [Le fonctionnaire marque une pause.]

    FONCTIONNAIRE: Après tout... je vous envoie vers une mort certaine.

    FONCTIONNAIRE: Je vous dis adieu.

    -> END
