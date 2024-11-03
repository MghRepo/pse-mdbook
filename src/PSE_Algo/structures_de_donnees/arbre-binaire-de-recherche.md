## Structures de données

### Arbre binaire de recherche

Un arbre binaire de recherche ou ABR (en anglais, binary search tree ou BST) est une structure de
données représentant un ensemble ou un tableau associatif dont les clefs appartiennent à un ensemble
totalement ordonné. Un arbre binaire de recherche permet des opérations rapides pour rechercher une
clé, insérer ou supprimer une clé.

Un arbre binaire de recherche est un arbre binaire dans lequel chaque noeud possède une clé, telle
que chaque noeud du sous-arbre *gauche* ait une clé inférieure ou égale à celle du noeud considéré,
et que chaque noeud du sous-arbre *droit* possède une clé supérieure ou égale à celle-ci - selon la
mise en oeuvre de l'ABR, on pourra interdire ou non des clés de valeur égale. Les noeuds que l'on
ajoute deviennent des feuilles de l'arbre.

La recherche dans un arbre binaire d'un noeud ayant une clé particulière est un procédé récursif. On
commence par examiner la racine. Si la clé est la clé recherchée, l'algorithme se termine et renvoie
la racine. Si elle est strictement inférieure, alors elle est dans le sous-arbre gauche, sur lequel
on effectue alors récursivement la recherche. De même si la clé recherchée est strictement
supérieure à la clé de la racine, la recherche continue dans le sous-arbre droit. Si on atteint une
feuille dont la clé n'est pas celle recherchée, on sait alors que la clé recherchée n'appartient à
aucun noeud, elle ne figure donc pas dans l'arbre de recherche. On peut comparer l'exploration d'un
arbre binaire de recherche avec la recherche par dichotomie qui procède à peu près de la même
manière sauf qu'elle accède directement à chaque élément d'un tableau au lieu de suivre les liens.
La différence entre les deux algorithmes est que, dans la recherche dichotomique, on suppose avoir
un critère de découpage de l'espace en deux parties que l'on n'a pas dans la recherche dans un
arbre.

Cette opération requiert un temps en *O(log n)* dans le cas moyen, mais *O(n)* dans le cas critique
où l'arbre est complètement déséquilibré et ressemble à une liste chaînée. Ce problème est écarté si
l'arbre est équilibré par rotation au fur et à mesure des insertions pouvant créer des listes trop
longues.

L'insertion d'un noeud commence par une recherche : on cherche la clé du noeud à insérer ; lorsqu'on
arrive à une feuille, on ajoute le noeud comme fils de la feuille en comparant sa clé à celle de la
feuille : si elle est inférieure, le nouveau noeud sera à gauche ; sinon il sera à droite.

Sa complexité est la même que pour la recherche.

Il est aussi possible d'écrire une procédure d'ajout d'élément à la racine d'un arbre binaire. Cette
opération requiert la même complexité mais est meilleure en terme d'accès aux éléments.

Pour la suppression, on commence par rechercher la clé du noeud à supprimer dans l'arbre. Plusieurs
cas sont à considérer, une fois que le noeud à supprimer a été trouvé à partir de sa clé :

* *Suppression d'une feuille* : Il suffit de l'enlever de l'arbre puisqu'elle n'a pas de fils.
* *Suppression de noeud avec un enfant* : Il faut l'enlever de l'arbre en le remplaçant par son
  fils.
* *Suppression d'un noeud avec deux enfants* : Supposons que le noeud à supprimer soit appelé N. On
  échange le noeud N avec son successeur le plus proche (le noeud le plus à gauche du sous-arbre
  droit) ou son plus proche prédécesseur (le noeud le plus à droite du sous-arbre gauche). Cela
  permet de garder à la fin de l'opération une structure d'arbre binaire de recherche. Puis on
  applique à nouveau la procédure de suppression à N, qui est maintenant une feuille ou un noeud
  avec un seul fils.

Ce choix d'implémentation peut contribuer à déséquilibrer l'arbre. En effet, puisque ce sont
toujours des feuilles du sous-arbre gauche qui sont supprimées, une utilisation fréquente de cette
fonction amènera à un arbre plus lourd à droite qu'à gauche. On peut remédier à cela en alternant
successivement la suppression du minimum du fils droit avec celle maximum du fils gauche, plutôt que
toujours choisir ce dernier. Il est par exemple possible d'utiliser un facteur aléatoire : le
programme aura une chance sur deux de choisir le fils droit et une chance sur deux de choisir le
fils gauche.

Dans tous les cas cette opération requiert de parcourir l'arbre de la racine jusqu'à une feuille :
le temps d'exécution est donc proportionnel à la profondeur de l'arbre qui vaut n dans le pire des
cas, d'où une complexité maximale *O(n)*.

On peut récupérer les clés d'un arbre binaire de recherche dans l'ordre croissant en réalisant un
parcours infixe. Il faut concaténer dans cet ordre la liste triée obtenue récursivement par parcours
du fils gauche à la racine puis à celle obtenue récursivement par parcours du fils droit. Il est
possible de le faire dans l'ordre inverse en commençant par le sous-arbre droit. Le parcours de
l'arbre se fait en temps linéaire, puisqu'il doit passer par chaque noeud une seule fois.

On peut dès lors créer un algorithme de tri simple mais peu efficace, en insérant toutes les clés
que l'on veut trier dans un nouvel arbre binaire de recherche puis en parcourant de manière ordonnée
cet arbre comme ci-dessus.

Les arbres binaires de recherche peuvent servir d'implémentation au type abstrait de file de
priorité. En effet, les opérations d'insertion d'une clé et de test au vide se font avec des
complexités avantageuses (respectivement en *O(log n)* et en *O(1)*). Pour l'opération de
suppression de la plus grande clé, il suffit de parcourir l'arbre depuis sa racine en choisissant le
fils droit de chaque noeud, et de supprimer la feuille terminale. Cela demande un nombre
d'opérations égal à la hauteur de l'arbre, donc une complexité logarithmique. L'avantage notoire de
cette représentation d'une file de priorité est qu'avec un processus similaire, on dispose d'une
opération de suppression de la plus petite clé en temps logarithmique également.

L'insertion et la suppression s'exécutent en *O(h)* où *h* est la hauteur de l'arbre. Cela s'avère
particulièrement coûteux quand l'arbre est très déséquilibré (un arbre peigne par exemple, dont la
hauteur est linéaire en le nombre de clés), et on gagne donc en efficacité à équilibrer les arbres
au cours de leur utilisation. Il existe des techniques pour obtenir des arbres équilibrés, c'est à
dire une hauteur logarithmique en nombre d'éléments :

* **les arbres rouge-noir**
* **les B-arbres**
