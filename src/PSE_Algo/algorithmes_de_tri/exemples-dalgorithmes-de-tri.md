## Algorithmes de tri

### Exemples d'algorithmes de tri

#### Algorithmes rapides *T(n)=O(n.log n)*

* **Tri fusion** (*merge sort*) : Pour une entrée donnée, l'algorithme la divise en deux parties de
  tailles similaires, trie chacune d'elles en utilisant le même algorithme, puis fusionne les deux
  parties triées. Il se prête aussi bien à des implémentations sur listes que sur tableaux.
* **Tri rapide** (*quick sort*) : Une valeur est choisie comme pivot et les éléments plus petits que
  le pivot sont dissociés, par échanges successifs, des éléments plus grands que le pivot ; chacun
  de ces deux sous-ensembles est ensuite trié de la même manière. On peut rendre la complexité
  quasiment indépendante des données en utilisant un pivot aléatoire ou en appliquant au tableau une
  permutation aléatoire avant de le trier.
* **Tri par tas** (*heap sort*) : Il s'agit d'une amélioration du tri par sélection. L'idée est la
  même (insérer les élément un à un dans une structure déjà triée) mais l'algorithme utilise une
  structure de tas, souvent implémentée au moyen d'un tableau.
* **Tri introspectif** (*Introspective sort*) : Il s'agit d'un hybride du tri rapide et du tri par
  tas. Par rapport au tri rapide, il présente l'avantage d'avoir une complexité *O(n.log n)* dans le
  pire cas.
* **Tri arborescent** (*tree sort*): L'idée est d'insérer les éléments un à un dans l'arbre binaire
  de recherche, puis de lire l'arbre selon un parcours en profondeur. Un arbre binaire de
  recherche(ABR) est un arbre binaire dans lequel chaque noeud possède une clé, telle que chaque
  noeud du sous-arbre *gauche* ait une clé inférieure ou égale à celle du noeud considéré, et que
  chaque noeud du sous-arbre *droit* possède une clé supérieure ou égale à celle-ci.
* **Tri doux** (*smoothsort*) : La première étape consiste à transformer le tableau en arbre
  binaire. Le premier élément est déjà trivialement bien ordonné, puis on ajoute un à un les
  éléments suivants. On réordonne chaque fois un peu les éléments si nécessaire pour qu'ils
  correspondent aux critères :
    + Chaque noeud ne peut être supérieur à son noeud parent.
    + Le premier noeud enfant ne peut être supérieur au deuxième noeud enfant.

La deuxième étape consiste à retransformer l'arbre binaire en tableau trié. Chaque élément en
partant de la droite est laissé tel quel car il s'agit de la racine de l'arbre qui est déjà le plus
grand élément, et l'arbre restant est réordonné si nécessaire. On fait ceci jusqu'à arriver à un
tableau trié.

#### Algorithmes moyennement rapides

* **Tri de Shell** (*shell sort*) : Ce tri repose sur le tri par insertion des sous-suites de
  l'entrée obtenues en prenant les éléments espacés d'un pas constant, pour une suite de pas
  prédéfinie. La complexité varie selon le choix de cette suite.
* **Tri à peigne** (*comb sort*) : Il s'agit d'une variante plus efficace du tri à bulles, ne
  comparant pas uniquement des éléments consécutifs. On peut dire qu'il est au tri à bulles ce que
  le tri de Shell est au tri par insertion.
* **Tri par insertion** (*insertion sort*): Ce tri souvent utilisé naturellement pour trier des
  cartes à jouer. Les valeurs sont insérées les unes après les autres dans une liste triée
  (initialement vide). C'est souvent le plus rapide et le plus utilisé pour trier les entrées de
  petite taille. Il est également efficace pour des entrées déjà presque triées.
* **Tri à bulles** (*bubble sort*) : L'algorithme consiste à parcourir l'entrée du début à la fin et
  pour chaque couple d'éléments consécutifs, à les intervertir s'ils sont mal ordonnés. Cette
  opération est répétée jusqu'à ce que la structure soit triée (aucune intervention lors du dernier
  passage). Cet algorithme est peu efficace et rarement utilisé en pratique ; son intérêt est
  principalement pédagogique.
* **Tri cocktail** (*cocktail sort*) : Il s'agit d'une variante du tri à bulles dans laquelle
  l'entrée est alternativement parcourue dans les deux sens. S'il permet de traiter de manière plus
  efficace quelques cas problématiques pour le tri à bulles, il reste essentiellement similaire à ce
  dernier et l'intérêt est encore une fois principalement pédagogique.
* **Tri pair-impair** (*odd-even sort*) : Il s'agit d'une variante du tri à bulles, qui procède en
  comparant successivement tous les éléments d'index pairs avec les éléments d'index impairs qui les
  suivent, puis inversement. On va ainsi commencer en comparant le premier élément au second, le
  troisième au quatrième, etc., puis l'on comparera le second élément au troisième, le quatrième au
  cinquième. L'opération est répétée jusqu'à ce que la structure soit triée.

#### Algorithmes lents

* **Tri par selection** (*selection sort*) : Sur un tableau de *n* éléments on recherche l'élément
  le plus petit du tableau et on l'échange avec l'élément d'indice 0. Puis on recherche le deuxième
  plus petit et on l'échange avec l'élément d'indice 1. L'opération est répétée jusqu'à ce que la
  structure soit triée.

