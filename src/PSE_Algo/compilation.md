## Compilation

Un compilateur est un programme qui transforme un code *source* en code *objet*. Généralement, le code source est écrit dans un
langage de programmation (le langage source), il est de haut niveau d'abstraction, et facilement compréhensible par l'humain. Le
code objet est généralement écrit en langage de plus bas niveau (appelé langage cible), par exemple un langage d'assemblage ou
langage machine, afin de créer un programme exécutable par une machine.

Un compilateur effectue les opérations suivantes : analyse lexicale, pré traitement (préprocesseur), analyse syntaxique
(parsing), analyse sémantique, et génération de code optimisé. La compilation est souvent suivie d'une étape d'édition de liens,
pour générer un fichier exécutable.

On distingue deux options de compilation :

* Ahead-of-time (AOT), où il faut compiler le programme avant de lancer l'application : la situation traditionnelle.
* Compilation à la volée (just-in-time, en abrégé JIT) : cette faculté est apparue dans les années 1980 (par exemple Tcl/Tk)

La tache principale d'un compilateur est de produire un code objet correct qui s'exécutera sur un ordinateur. La plupart des
compilateurs permettent d'optimiser le code, c'est-à-dire qu'ils vont chercher à améliorer la vitesse d'exécution, ou réduire
l'occupation mémoire du programme.

Un compilateur fonctionne par analyse-synthèse : au lieu de remplacer chaque construction du langage source par une suite
équivalente de constructions du langage cible, il commence par analyser le texte source pour en construire une *représentation
intermédiaire* qu'il traduit à son tour en langage cible.

On sépare le compilateur en au moins deux parties : une partie avant (ou frontale), parfois appelée "souche", qui lit le texte
source et produit la représentation intermédiaire ; et la partie arrière (ou finale), qui parcours cette représentation pour
produire le texte cible. Dans un compilateur idéal, la partie avant est indépendante du langage cible, tandis que la partie
arrière est indépendante du langage source (voir *Low Level Virtual Machine*).

L'implémentation d'un langage de programmation peut être interprétée ou compilée. Cette réalisation est un compilateur ou un
interpréteur, et un langage de programmation peut avoir une implémentation compilée, et une autre interprétée.

On parle de compilation si la traduction est faite avant l'exécution, et d'interprétation si la traduction est finie pas à pas,
durant l'exécution.

Les premiers compilateurs ont été écrits directement en langage assembleur, un langage symbolique élémentaire correspondant aux
instructions du processeur cible et quelques structures de contrôle légèrement plus évoluées. Ce langage symbolique doit être
assemblé (et non compilé) et lié pour obtenir une version exécutable. En raison de sa simplicité, un programme simple suffit à
le convertir en instruction machines.

Les compilateurs actuels sont généralement écrits dans le langage qu'ils doivent compiler : il ne dépend alors plus d'un autre
langage pour être produit.

Dans ce cas, il est complexe de détecter un bogue de compilateur. Le *bootstrap* oblige donc les programmeurs de compilateurs à
contourner les bugs des compilateurs existants.
