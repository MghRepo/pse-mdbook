## Structures de données

### Arbre B

Un arbre B est une structure de données en arbre équilibré. Les arbres B sont principalement mis en oeuvre dans les mécanismes
de gestion de bases de données et de systèmes de fichiers. Ils stockent les données sous une forme triée et permettent une
exécution des opérations d'insertion et de suppression en temps toujours logarithmique.

Le principe est de permettre aux noeuds parents de posséder plus de deux noeuds enfants : c'est une généralisation de l'arbre
binaire de recherche. Ce principe minimise la taille de l'arbre et réduit le nombre d'opérations d'équilibrage. De plus un
B-arbre grandit à partir de la racine, contrairement à un arbre binaire de recherche qui croît à partir des feuilles.

Un *arbre étiqueté* est un arbre tel qu'à chaque noeud on associe une étiquette ou clé (ou bien plusieurs étiquettes ou clés
dans le cas des arbres B) prise(s) dans un ensemble donné. Donc formellement un arbre étiqueté est un couple formé d'un graphe
orienté, acyclique et connexe et d'une fonction d'étiquetage des arbres qui attribue à chaque noeud une étiquette ou une clé.
Parmi les arbres étiquetés, un *arbre B* possède quelques propriétés spécifiques supplémentaires.

Soit *L* et *U* deux entiers naturels non nuls tels que *L&#8804;U*. En toute généralité, on définit alors un *L-U arbre B* de
la manière suivante : chaque noeud, sauf la racine, possède un minimum de *L-1* clés (appelées aussi éléments), un maximum de
*U-1* clés et au plus *U* fils. Pour chaque noeud interne -- noeud qui n'est pas une feuille --, le nombre de fils est toujours
égal au nombre de clés augmenté d'une unité. Si *n* est le nombre de fils, alors on parle de *n*-noeud. Un *L-U* arbre B ne
contient que des *n*-noeuds avec L&#8804;n&#8804;U. Souvent on choisit la configuration *L=t* et *U=2.t* : *t* est appelé le
*degré minimal* de l'arbre B.

De plus, la construction des arbres B garantit qu'un arbre B est toujours équilibré. Chaque clé d'un noeud interne est en fait
une borne qui distingue les sous-arbres de ce noeud.

Un arbre B est implémenté par un arbre enraciné. Un noeud *x* est étiqueté par :

* Un entier *n* qui correspond au nombre de clefs contenues dans e noeud *x*
* *n* clefs notées *c&#8321;,...,c&#8345;*.
* Un booléen indiquant si *x* est une feuille ou non.
* *n+1* pointeurs notés *p&#8321;,...,p&#8345;&#8330;&#8321;* associés aux fils *f&#8321;,...,f&#8345;&#8330;&#8321;* de *x*.
Une feuille ne contient pas de pointeurs.

De plus, un arbre B vérifie ces propriétés :

* Toutes les feuilles ont la même profondeur, à savoir la hauteur *h* de l'arbre.
* Si *x* n'est pas une feuille :
    + pour *2&#8804;i&#8804;n*, pour toute clef *k* du fils *f&#7522;* : *c&#7522;&#8331;&#8321;&#8804;k&#8804;c&#7522;*.
    + pour toute clef *k* du fils *f&#8321;* : *k&#8804;c&#8321;*.
    + pour toute clef *k* du fils *f&#8345;&#8330;&#8321;* : *c&#8345;&#8804;k*.

* Si *x* n'est ni une feuille, ni la racine, *n* est compris entre L-1 et U-1.

La plupart du temps, la configuration est telle que *U = 2L*. On parle alors d'arbre B d'ordre *L*.
Un arbre B d'ordre *t* est défini alors plus simplement par un arbre qui satisfait les propriétés suivantes :

* Chaque noeud a au plus *2t-1* clés.
* Chaque noeud qui n'est ni racine ni feuille possède au moins *t-1* clés.
* Si l'arbre est non vide, la racine est aussi non vide.
* Un noeud qui possède *k* fils contient *k-1* clefs.
* Toutes les feuilles se situent à la même hauteur.

Comme on le verra par la suite, la hauteur d'un B-arbre est logarithmique en le nombre d'éléments. Ainsi, les opérations de
recherche, insertion et suppression sont implémentables en *O(log n)* dans le pire des cas, où *n* est le nombre d'éléments.

La recherche est effectué de la même manière que dans un arbre binaire de recherche. Partant de la racine, on parcourt
récursivement l'arbre ; à chaque noeud, on choisit le sous-arbre fils dont les clés sont comprises entre les même bornes que
celles de la clé recherchée grâce à une recherche dichotomique.

L'insertion nécessite tout d'abord de chercher le noeud où la nouvelle clé devrait être insérée, et l'insérer. La suite se
déroule récursivement, selon qu'un noeud ait ou non trop de clés : s'il possède un nombre acceptable de clés, on ne fait rien ;
autrement on le transforme en deux noeuds, chacun possédant un nombre minimum de clés, puis on fait "remonter" la clé du milieu
qui est alors insérée dans le noeud père. Ce dernier peut du coup se retrouver avec un nombre excessif de fils ; le procédé se
poursuit ainsi jusqu'à ce qu'on atteigne la racine. Si celle-ci doit être divisée, on fait "remonter" la clé du milieu dans une
nouvelle racine, laquelle génèrera comme noeuds fils les deux noeuds créés à partir de l'ancienne racine, à l'instar de l'étape
précédente. Pour que l'opération soit possible, on remarque qu'il faut que U &#8805; 2L ; sinon les nouveaux noeuds ne
possèderont pas suffisamment de clés.

Une variante consiste à éclater préventivement chaque noeud "plein" (possédant un nombre maximal de clés) rencontré lors de la
recherche du noeud où se réalisera l'insertion. De cette manière on évite une remontée dans l'arbre, puisque l'on s'assure que
le père d'un noeud à scinder en deux peut accueillir une clé supplémentaire. La contrepartie en est une légère augmentation de
la hauteur moyenne de l'arbre.

Pour la suppression, on doit d'abord chercher la clé à supprimer et la supprimer du noeud qui la contient.

* Si le noeud est interne, on procède de manière similaire aux arbres binaires de recherche en cherchant la clé *k* la plus à
gauche dans le sous-arbre droit de la clé à supprimer ou la plus à droite dans le sous-arbre gauche. Cette clé *k* appartient à
une feuille. On peut la permuter avec la clé à supprimer, que l'on supprime ensuite. Comme elle appartient à une feuille, on se
ramène au cas suivant.
* Si le noeud est une feuille, soit il possède encore suffisamment de clés et l'algorithme se termine, soit il dispose de moins
de *L-1* clés et on se trouve dans l'une des deux situations suivantes :
    + soit un de ses frères à droite ou à gauche possède suffisamment de clés pour pouvoir en "passer" une à la feuille en
    question : dans ce cas cette clé remplace la clé qui sépare les deux sous-arbres dans l'arbre père, qui va elle-même dans la
    feuille en question ;
    + soit aucun de ses frères n'a suffisamment de clés : dans ce cas, le père fait passer une de ses clés dans un des deux (ou
    le seul) frère pour permettre à la feuille de fusionner avec celui-ci. Ceci peut cependant conduire le père à ne plus avoir
    suffisamment de clés. On réitère alors l'algorithme : si le noeud a un frère avec suffisamment de clés, la clé la plus
    proche va être échangée avec la clé du père, puis la clé du père et ses nouveaux descendants sont ramenés dans le noeud qui
    a besoin d'une clé ; sinon, on effectue une fusion à l'aide d'une clé du père et ainsi de suite. Si l'on arrive à la racine
    et qu'elle possède moins de L éléments, on fusionne ses deux fils pour donner une nouvelle racine.

Notamment après une suppression, l'arbre peut être rééquilibré. Cette opération consiste à répartir équitablement les valeurs
dans les différents noeuds de l'arbre et à rétablir les propriétés de remplissage minimum des noeuds.

Le rééquilibrage commence au niveau des feuilles et progresse vers la racine, jusqu'à celle-ci. La redistribution consiste à
transférer un élément d'un noeud voisin qui possède suffisamment de valeurs vers le noeud qui en manque. Cette redistribution
est appelée **rotation**. Si aucun voisin ne peut fournir de valeur sans être lui même sous la limite, le noeud déficient doit
être **fusionné** avec un voisin. Cette opération provoque la perte d'un séparateur dans le noeud parent, celui-ci peut alors
être en déficit et a besoin d'être équilibré. La fusion et redistribution se propage jusqu'à la racine, seul élément où la
déficience en valeurs est tolérée.

Un algorithme d'équilibrage simple consiste à :

* Si le noeud voisin gauche existe et dispose de suffisamment de valeurs pour pouvoir en offrir une, réaliser une rotation
gauche.
* Sinon, si le noeud voisin droite existe et dispose de suffisamment d'éléments, réaliser une rotation droite.
* Sinon, le noeud déficient doit être fusionné avec un de ses voisins tel que la somme du nombre de leurs clés plus *1* soit
inférieure ou égale à la capacité maximale (*taille_gauche*+*taille_droite*+1&#8804;*U-1*). La valeur supplémentaire correspond
au séparateur présent dans le parent. Cette opération est toujours possible si *U-1*&#8805;*2L* avec *taille_gauche*=*L-2* et
*taille_droite*=*L-1* ou le contraire, soit un noeud immédiatement sous la limite de *L-1* clés et un noeud exactement à la
limite.

1. Copier le séparateur à la fin du noeud de gauche.
2. Ajouter tous les éléments du noeud de droite à la fin du noeud de gauche.
3. Effacer le noeud de droite et effacer le séparateur du parent puis vérifier qu'il contient assez d'éléments. Si ce n'est pas
le cas, rééquilibrer le parent avec ses voisins.

La rotation à gauche d'un cran entre deux noeuds voisins se fait en :

1. déplaçant le séparateur, présent dans le parent, à la fin du noeud gauche.
2. déplaçant le premier élément du noeud de droite en tant que séparateur dans le parent.

Ce genre d'opération peut être également utilisé pour compresser l'arbre : un arbre destiné à la lecture seule peut être vidé
d'un maximum de cases mémoires inutilisées en remplissant au maximum un minimum de noeuds.
