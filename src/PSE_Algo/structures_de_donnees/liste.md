## Structures de données

### Liste

Une liste est une structure de données permettant de regrouper des données de manière à pouvoir y accéder librement
(contrairement aux files et aux piles).

Voici les primitives communément utilisées pour manipuler des listes ; il n'existe pas de normalisation pour les primitives de
manipulation de listes, leurs noms respectifs sont donc indiqués de manière informelle.

Primitives de base :

* Insérer (*Add*) : ajoute un élément dans la liste ;
* Retirer (*Remove*) : retire un élément de la liste ;
* "La liste est-elle vide ?" (*IsNull*) : renvoie "vrai" si la liste est vide, "faux" sinon ;
* "Nombre d'éléments dans la liste" (*Length*) : renvoie le nombre d'éléments dans la liste.

Primitives auxiliaires fréquemment rencontrées :

* Premier (*First*) : retourne le premier élément dans la liste ;
* Dernier (*Last*) : retourne le dernier élément dans la liste ;
* Prochain (*Next*) : retourne le prochain élément dans la liste ;
* Précédent (*Previous*) : retourne l'élément qui précède dans la liste ;
* Cherche (*find*) : cherche si un élément précis est contenu dans la liste et retourne sa position.

Une liste est un conteneur d'éléments, où chaque élément contient la donnée, ainsi que d'autres informations permettant la
récupération des données au sein de la liste. La nature (les types) de ces informations caractérise un type différent de liste.

On peut distinguer, de manière générale, deux types de liste :

* les tableaux ;
* les listes chaînées.

Dans un tableau, l'accès à un élément se fait à l'aide d'un index qui représente l'emplacement de l'élément dans la structure.

Les données présentes dans un tableau sont contiguës en mémoire. Cela induit une taille de tableau fixe. Cependant certains
langages de haut niveau fournissent des tableaux qui modifient leur taille en fonction de leur utilisation : on parle alors de
tableau à taille dynamique. Mais leur implémentation utilise le principe des listes chaînées. Les tableaux peuvent également
avoir plusieurs dimensions, représentées par une séquence d'indices.

Contrairement à un tableau, la taille d'une liste chaînée n'a pas de limite autre que celle de la mémoire disponible. Cette
limitation est franchie par le fait que chaque élément peut pointer, suivant le type de liste chaînée, vers un ou plusieurs
éléments de la liste en utilisant une définition récursive. Ainsi, pour augmenter la taille d'une liste chaînée, il suffit de
créer un nouvel élément et de faire pointer certains éléments, déjà présents au sein de la liste, vers le nouvel élément.

Il existe deux grand types de liste chainée :

* **les listes simplement chaînées** : chaque élément dispose d'un pointeur sur l'élément suivant (ou successeur) de la liste. Le
parcours se fait dans un seul sens ;
* **les listes doublement chaînées** : chaque élément dispose de deux pointeurs, respectivement sur l'élément suivant (ou
successeur) et sur l'élément précédent (ou prédécesseur). Le parcours peut alors se faire dans deux sens, mutuellement opposés :
de successeur en successeur, ou de prédécesseur en prédécesseur.

A cela on peut ajouter une propriété : le cycle. Cette fois ci, la liste chaînée forme une boucle. Dès qu'on atteint la "fin" de
la liste et qu'on désire continuer, on se retrouve sur le "premier" élément de la liste. Dans ce cas, la notion de début ou de
fin de chaîne n'a plus de raison d'être.
