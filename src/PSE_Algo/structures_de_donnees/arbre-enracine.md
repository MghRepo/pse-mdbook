## Structures de données

### Arbre enraciné

En théorie de graphes, un arbre enraciné ou une arborescence est un graphe acyclique orienté possédant une unique racine, et tel
que tous les noeuds sauf la racine ont un unique parent.

Dans un arbre, on distingue deux catégories d'éléments :

* les *feuilles* (ou noeuds externes), éléments ne possédant pas de fils dans l'arbre ;
* les *noeuds* interne, éléments possédant des fils (sous-branches).

La *racine* de l'arbre est l'unique noeud ne possédant pas de parent. Les noeuds (les pères avec leurs fils) sont reliés entre
eux par une *arête*. Selon le contexte, un noeud peut désigner un noeud interne ou externe (feuille) de l'arbre.

La *profondeur* d'un noeud est la distance, i.e. le nombre d'arêtes, de la racine au noeud. La *hauteur* d'une arbre est la plus
grande profondeur d'une feuille de l'arbre. La *taille* d'un arbre est son nombre de noeuds (en comptant les feuilles ou non),
la longueur de cheminement est la somme des profondeurs de chacune des feuilles.

Les arbres peuvent être étiquetés. Dans ce cas, chaque noeud possède une *étiquette*, qui est en quelque sorte le "contenu" du
noeud. L'étiquette peut être très simple : un nombre entier, par exemple. Elle peut également être aussi complexe que l'on veut
: un objet, une instance d'une structure de donnée, un pointeur, etc. Il est presque toujours obligatoire de pouvoir comparer
les étiquettes selon une relation d'ordre total, afin d'implanter les algorithmes sur les arbres.

Les fichiers et dossiers dans un système de fichiers sont généralement organisés sous forme arborescente.

Les arbres sont en fait rarement utilisés en tant que tels, mais de nombreux types d'arbres avec une structure plus restrictive
existent et sont couramment utilisés en algorithmique, notamment pour gérer des bases de données, ou pour l'indexation de
fichiers. Ils permettent alors des recherches rapides et efficaces. Par exemple :
* Les arbres binaires dont chaque noeud a au plus deux fils : ils sont en fait utilisés sous forme d'arbres binaires de
recherche, de tas, ou encore d'arbres rouge-noir. Le dernier exemple est un cas particulier d'arbre équilibré, c'est à dire dont
les sous-branches ont presque la même hauteur.
* Les arbres n-aires qui sont une généralisation des arbres binaires : chaque noeud a au plus *n* fils. Les arbres 2-3-4 et les
arbres B en sont des exemples d'utilisation et sont eux aussi des arbres équilibrés.

Pour construire un arbre à partir de cases ne contenant que des informations, on peut procéder de l'une des trois façons
suivantes :

1. Créer une structure de données composée de :
    * l'étiquette (la valeur contenue dans le noeud),
    * un lien vers *chaque* noeud fils,
    * un arbre particulier, l'arbre vide, qui permet de caractériser les feuilles. Une feuille a pour fils des arbres vides
    uniquement.
2. Créer une structure de données composée de :
    * l'étiquette (la valeur contenue dans le noeud),
    * un lien vers le "premier" noeud fils (noeud fils gauche le cas échéant),
    * un autre lien vers le noeud frère (le "premier" noeud frère sur la droite le cas échéant).
3. Créer une structure de données composée de :
    * l'étiquette (la valeur contenue dans le noeud),
    * un lien vers le noeud père.

On note qu'il existe d'autres types de représentation propres à des cas particuliers d'arbres. Par exemple, le tas est
représenté par un tableau d'étiquettes.

Les parcours d'arbre sont des processus de visites des sommets d'un arbre, par exemple pour trouver une valeur.

Le **parcours en largeur** correspond à un parcours par niveau de noeuds de l'arbre. Un niveau est un ensemble de noeuds
internes ou de feuilles situés à la même profondeur - on parle aussi de noeud ou de feuille de même hauteur dans l'arbre
considéré. L'ordre de parcours d'un niveau donné est habituellement conféré, de manière récursive, par l'ordre de parcours des
noeuds parents - noeuds de niveau immédiatement supérieur.

Le **parcours en profondeur** est un parcours récursif sur un arbre. Dans le cas général, deux ordres sont possibles :

* Parcours en profondeur préfixe : dans ce mode de parcours, le noeud courant est traité avant ses descendants.
* Parcours en profondeur suffixe : dans ce mode de parcours, le noeud courant est traité après ses descendants.

Pour les arbres binaires, on peut également faire un *parcours infixe*, c'est à dire traiter le noeud courant entre les noeuds
gauche et droit.

*Parcours préfixe* :
```code,ignore
    visiterPréfixe(Arbre A) :
        visiter (A)
        Si nonVide (gauche(A))
            visiterPréfixe(gauche(A))
        Si nonVide (droite(A))
            visiterPréfixe(droite(A))
```
*Parcours suffixe* :
```code,ignore
    visiterSuffixe(Arbre A) :
        Si nonVide(gauche(A))
            visiterSuffixe(gauche(A))
        Si nonVide(droite(A))
            visiterSuffixe(droite(A))
        visiter(A)
```
*Parcours infixe* :
```code,ignore
    visiterInfixe(Arbre A) :
        Si nonVide(gauche(A))
            visiterInfixe(gauche(A))
        visiter(A)
        Si nonVide(droite(A))
            visiterInfixe(droite(A))
```
