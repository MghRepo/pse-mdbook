## Structures de données

### Arbre rouge-noir

Un **arbre bicolore**, ou **arbre rouge-noir** ou **arbre rouge et noir** est un type particulier d'arbre binaire de recherche
équilibré. Chaque noeud de l'arbre possède en plus de ses données propres un attribut binaire qui est souvent interprété comme
sa "couleur" (rouge ou noir). Cet attribut permet de garantir l'équilibre de l'arbre : lors de l'insertion ou de la suppression
d'éléments, certaines propriétés sur les relations entre les noeuds et les couleurs doivent être maintenues, ce qui empêche
l'arbre de devenir trop déséquilibré, y compris dans le pire des cas. Durant une insertion ou une suppression, les noeuds sont
parfois réarrangés ou changent leur couleur afin que ces propriétés soient conservées.

Le principal intérêt des arbres bicolores réside dans le fait que malgré les potentiels réarrangements ou coloriages des noeuds,
la complexité (en le nombre d'éléments) des opérations d'insertion, de recherche et de suppression est logarithmique. De plus,
cette structure est économe en mémoire puisqu'elle ne requiert qu'un bit supplémentaire d'information par élément par rapport à
un arbre binaire classique.

Un arbre bicolore est un cas particulier d'arbre binaire, une structure de donnée couramment utilisée en informatique pour
organiser des données pouvant être comparées, par exemple des nombres ou des chaines de caractères.

Les feuilles de l'arbre, c'est-à-dire les noeuds terminaux, ne contiennent aucune donnée. Elles peuvent être simplement
représentées sans coût mémoire par des éléments nuls (pointeurs nul en C, valeur NIL, etc.) dans le noeud parent (indiquant que
le noeud enfant est une feuille). Il peut être toutefois utile pour simplifier la mise en oeuvre de certains algorithmes que les
feuilles soient explicitement représentées soit en les instanciant séparément, soit en utilisant une sentinelle (valeur
signifiant la fin de la donnée).

Comme tous les arbres binaires de recherche, les arbres bicolores peuvent être parcourus très efficacement en ordre infixe (ou
ordre gauche - racine - droite), ce qui permet de lister les éléments dans l'ordre. La recherche d'un élément se fait en temps
logarithmique *O(log n)*, *n* étant le nombre d'éléments de l'arbre, y compris dans le pire des cas.

Un arbre bicolore est un arbre binaire de recherche dans lequel chaque noeud a un attribut supplémentaire : sa couleur, qui est
soit **rouge** soit **noire**. En plus des restrictions imposées aux arbres binaires de recherche, les règles suivantes sont
utilisées :

1. Un noeud est soit rouge soit noir ;
2. La racine est noire ;
3. Les enfants d'un noeud rouge sont noirs ;
4. Tous les noeuds ont 2 enfants. Ce sont d'autres noeuds ou des feuilles **NIL**, qui ne possèdent pas de valeurs et qui sont
les seuls noeuds sans enfants. Leur couleur est toujours **noire** et rentre donc en compte lors du calcul de la hauteur noire.
5. Le chemin de la racine à n'importe quelle feuille (**NIL**) contient le même nombre de noeuds noirs. On peut appeler ce
nombre de noeuds noirs la **hauteur noire**.

Ces contraintes impliquent une propriété importante des arbres bicolores : le chemin le plus long possible d'une racine à une
feuille (sa hauteur) ne peut être que deux fois plus long que le plus petit possible : dans le cas le plus déséquilibré, le plus
court des chemins ne comporte que des noeuds noirs, et le plus long alterne les noeuds rouges et noirs. Un arbre vérifiant ces
propriétés est ainsi presque équilibré. Comme les opérations d'insertion, de recherche et de suppression requièrent dans le pire
des cas un temps proportionnel à la hauteur de l'arbre, les arbres bicolores restent efficaces, contrairement aux arbres
binaires de recherche ordinaires.

Pour comprendre comment ces contraintes garantissent la propriété ci-dessus, il suffit de s'apercevoir qu'aucun chemin ne peut
avoir deux noeuds rouges consécutifs à cause de la propriété 3. Le plus petit chemin théorique de la racine à une feuille ne
contient alors que des noeuds noirs tandis que le plus grand alterne entre les noeuds rouges et noirs. Et comme d'après la
propriété chacun de ces chemins contient le même nombre de noeuds noirs, le plus grand chemin ne peut être deux fois plus grand
que le plus petit.

La propriété 2 n'est pas nécessaire. Les seuls cas où la racine pourrait devenir rouge étant les deux cas où sa couleur n'a pas
d'importance : soit la racine est le seul noeud, soit elle possède deux fils noirs. Cette propriété est ajouté uniquement pour
visualiser plus rapidement l'isomorphisme avec les arbres 2-3-4 : chaque noeud noir et ses éventuels fils rouges représente un
noeud d'arbre 2-3-4.

Les arbres bicolores, offrent la meilleure garantie sur le temps d'insertion, de suppression et de recherche dans les cas
défavorables. Ceci leur permet non seulement d'être alors utilisables dans des applications en temps réel, mais aussi de servir
comme fondement d'autres structures de données à temps d'exécution garanti dans les cas défavorables, par exemple en géométrie
algorithmique. L'ordonnanceur du noyau Linux, le Completely Fair Scheduler utilise également un arbre rouge-noir.

Les arbres rouge-noir sont également très utile en programmation fonctionnelle : c'est l'exemple le plus couramment utilisé de
structure de données persistante qui peut être utilisée pour construire des tableaux associatifs capables de garder en mémoires
les versions précédentes après un changement. Les versions persistantes des arbres rouge-noir requièrent *O(log n)* en mémoire
supplémentaire pour chaque insertion ou suppressions.

La recherche sur un arbre bicolore s'effectue exactement comme dans les arbres binaires de recherche. Cependant, après une
insertion ou une suppression, les propriétés de l'arbre bicolore peuvent être violées. La restauration de ces propriétés
requiert un petit nombre *O(log n)* de modifications des couleurs (qui sont très rapides en pratique) et pas plus de trois
rotations (deux pour l'insertion). Ceci permet d'avoir une insertion et une suppression en *O(log n)* mais rend l'implémentation
plus complexe à cause du grand nombre de cas particuliers à traiter.

La recherche d'un élément se déroule de la même façon que pour un arbre binaire de recherche : en partant de la racine, on
compare la valeur recherchée à celle du noeud courant de l'arbre. Si ces valeurs sont égales, la recherche est terminée et on
renvoie le noeud courant. Sinon, on choisit de descendre vers le noeud enfant gauche ou droit selon que la valeur recherchée est
inférieure ou supérieure. Si une feuille est atteinte, la valeur recherchée ne se trouve pas dans l'arbre.

La couleur des noeuds de l'arbre n'intervient pas directement dans la recherche. Toutefois à la différence d'un arbre binaire de
recherche normal, les arbres rouge-noir garantissent par construction un temps d'exécution de la recherche en *O(log n)* y
compris dans le pire des cas. En effet, un arbre binaire de recherche peut devenir déséquilibré dans les cas défavorables (par
exemple si les éléments sont insérés dans l'ordre croissant, l'arbre binaire de recherche dégénère en une liste chainée. La
complexité de l'opération dans le pire des cas est donc *O(n)* pour un arbre binaire potentiellement non équilibré. Au
contraire, pour l'arbre rouge-noir, les propriétés bicolores vues ci-dessus garantissent que l'on atteindra un noeud en au plus
*2.log n* comparaisons, donc en *O(log n)* opérations.

L'insertion commence de la même manière que sur un arbre binaire classique : en partant de la racine, on compare la valeur
insérée à celle d'un noeud courant de l'arbre, et on choisit de descendre vers le noeud enfant gauche ou droit selon que la
valeur insérée est inférieure ou supérieure. Le nouveau noeud est inséré lorsque l'on ne peut plus descendre, c'est-à-dire quand
le noeud courant est une feuille de l'arbre. Cette feuille est remplacée par le nouveau noeud.

Une fois le nouveau noeud ajouté à l'arbre, il faut vérifier que les propriétés de l'arbre bicolore sont bien respectées et,
dans le cas contraire, effectuer des opérations de changement de couleur et des rotations pour les établir. Le noeud inséré est
initialement colorié en *rouge*. Il y a ensuite plusieurs cas possibles pour rétablir les propriétés de l'arbre, à partir du
noeud inséré.

1. Le noeud inséré n'a pas de parent : il est en fait à la racine de l'arbre. La seule correction à apporter consiste à le
colorier en **noir** pour respecter la propriété 2.
2. Le noeud du parent inséré est **noir**, alors, l'arbre est valide : la propriété 3 et vérifiée, et la hauteur-noire de
l'arbre est inchangée puisque le nouveau noeud est **rouge**. Il n'y a donc rien d'autre à faire.
3. Le parent du noeud inséré est **rouge**, alors la propriété 3 est invalide. L'action à effectuer dépend de la couleur de
*l'oncle* du noeud inséré, c'est à dire le "frère" du parent du noeud inséré. En d'autres termes : en partant du noeud inséré
(N), on considère son noeud parent (P), puis le noeud parent de P, ou grand parent (G), et enfin l'oncle (U) qui est le fils de
G qui n'est pas P. Si l'oncle est **rouge**, alors le parent et l'oncle sont coloriés en **noir**, et le grand parent (qui était
nécessairement noir) est colorié en **rouge**. Ce changement de couleur a pu toutefois créer une nouvelle violation des
propriétés bicolores plus haut dans l'arbre. Il faut maintenant recommencer la même analyse de cas mais cette fois *en partant
du noeud grand parent ainsi colorié en rouge*.
4. Dans le cas où l'oncle est **noir**, il faut effectuer des rotations qui dépendent de la configuration du noeud inséré autour
de son parent et de son grand parent, afin de ramener l'équilibre dans l'arbre. Le parent vient prendre la place du grand
parent, et le grand parent celle de l'oncle. Le parent devient **noir** et le grand parent **rouge** et l'arbre respecte alors
les propriétés bicolores.

Le seul cas où la correction ne se termine pas immédiatement est le cas 3, dans lequel on change le grand parent de noir à
rouge, ce qui oblige à effectuer une nouvelle vérification du grand parent. Cependant, il est aisé de vérifier que la fonction
se termine toujours. Puisque le noeud à vérifier est toujours strictement plus haut que le précédent, on finira inévitablement
par se retrouver dans l'un des cas non récursifs (dans le pire des cas, on remontera jusqu'à atteindre la racine de l'arbre,
c'est à dire le cas 1). Il y aura donc au plus deux rotations, et un nombre de changements de couleurs inférieur à la moitié de
la hauteur de l'arbre, c'est à dire en *O(log n)*. En pratique la probabilité de tomber plusieurs fois de suite sur le cas 3 est
exponentiellement décroissante ; en moyenne le coût de la correction des propriétés est donc presque constant.
