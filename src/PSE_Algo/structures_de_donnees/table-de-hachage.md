## Structures de données

### Table de hachage

Une table de hachage est une structure de données qui implémente un type abstrait de tableau
associatif. Une table de hachage utilise une fonction de hachage afin de calculer l'index d'un
tableau d'emplacements desquels la valeur attendue peut être trouvée. Pendant la recherche, la clef
est hachée et le hash résultant indique l'emplacement de la valeur correspondante.

Idéalement, la fonction de hachage assignera chaque clef à un réceptacle unique, mais la plupart des
tables de hachage utilisent des fonctions de hachages imparfaites, qui peuvent causer des collisions
quand la fonction de hachage attribue un même index pour plus d'une clef. Ces collisions sont alors
traitées de diverses manières.

Dans une table de hachage bien dimensionnée, le coût moyen (nombre d'instructions) pour chaque
recherche est indépendant du nombre d'élément stockés dans la table. Beaucoup de tables de hachages
permettent également des insertions et des suppressions arbitraires de paires clef-valeur, à un coût
(amorti) moyen constant par opération.

Dans de nombreuses situations, les tables de hachage sont en moyenne plus efficaces que des arbres
de recherche ou de n'importe quelle autre structure de table de recherche. C'est pour cette raison,
qu'elles sont largement utilisé dans un large panel de logiciels informatiques, particulièrement les
tableaux associatifs, l'indexation des bases de données, les caches, et les ensembles.

L'idée du hachage est de distribuer les entrées (paires clefs/valeurs) à travers un tableau de
réceptacles. Étant donné une clef, l'algorithme calcule un index qui suggère où l'entrée peut se
trouver :
```code,ignore
    index = f(clef, taille_tableau)
```
Souvent cette opération est réalisée en deux étapes :
```code,ignore
    hash = hashfunc(key) index = hash % array_size
```
Avec cette méthode, le hash est indépendant de la taille du tableau, et est réduit à postériori à un
index (un nombre entre *0* et *taille_tableau - 1*) à l'aide de l'opérateur modulo (*%*).

Dans le cas où la taille du tableau est une puissance de 2, l'opération de reste est réduite à un
masquage, ce qui améliore la performance, mais aussi fait croître le nombre de problèmes si la
fonction de hachage est mauvaise.

Une condition basique pour la fonction est de fournir une distribution uniforme des valeurs de hash.
Une distribution non-uniforme augmente le nombre de collision est le coût pour les résoudre.
L'uniformité est quelques fois difficile à garantir, mais elle peut être évaluée de manière
empirique via des tests statistiques.

La distribution doit être uniforme uniquement pour les tailles de tables de l'application. Si
l'application utilise un redimensionnement dynamique de la table avec un doublement ou une division
par deux de la taille, alors la fonction de hachage doit être uniforme uniquement lorsque la taille
est une puissance de deux. Ici l'index peut être calculé comme un intervalle de bits de la fonction
de hachage. D'un autre côté, des algorithmes de hachage préfèrent avoir une taille exprimé à l'aide
d'un nombre premier. L'opération modulo peut fournir un petit mélange additionnel ; ceci est
appréciable notamment pour une mauvaise fonction de hachage.

Pour les schémas d'adressage ouvert, la fonction de hachage doit également éviter le *clustering*,
l'adressage de deux ou de plusieurs clefs à des emplacements consécutifs. Un tel regroupement peut
être la cause d'une envolée du coût de recherche, même si le facteur de charge est bas et que les
collisions sont rares.

Les fonctions de hachages cryptographiques seraient capable de fournir de bonnes fonctions de
hachages quelque soit la taille de la table, soit par réduction modulo ou par masquage de bit. Elles
peuvent également être utiles si il existe un risque d'utilisateurs malveillants essayant de saboter
un service réseau en envoyant des requêtes destinées à générées un grand nombre de collisions dans
les tables de hachage du serveur. Néanmoins, le risque de sabotage peut également être évité par des
méthodes moins coûteuses (tels qu'appliquer un sel secret à la donnée, ou utiliser une fonction de
hachage universelle). Un inconvénient des fonctions de hachages cryptographiques est qu'elles sont
souvent plus lentes à être calculées, ce qui veut dire que dans certains cas où l'uniformité pour
n'importe quelle taille n'est pas nécessaire, une fonction de hachage non-cryptographique peut être
préférable.

Un hachage k-indépendant offre un moyen de prouver qu'une fonction de hachage n'a pas de mauvais
ensembles de clefs pour un type de table de hachage donné. De nombreux résultats de ce type sont
connus pour des schémas de résolution de collision.

Si toutes les clefs sont connues à l'avance, une fonction de hachage parfaite peut être utilisée
pour créer une table de hachage parfaite sans aucune collision. Si un hachage parfait minimal est
utilisé, chaque emplacement dans la table de hachage peut également être utilisé.

Un hachage parfait permet un temps de recherche constant dans tout les cas. Ceci se détache de la
majorité des méthodes de chaînage et d'adressage ouvert, où le temps de recherche est bas en
moyenne, mais peut être très grand, *O(n)*, par exemple lorsque toutes les clefs sont hachées vers
trop peu de valeurs.

Une statistique critique pour une table de hachage est le facteur de charge, défini comme :

Facteur de charge = n/k, où

* *n* est le nombre des entrées occupées dans la table de hachage,
* *k* est le nombre d'emplacements.

Quand le facteur de charge augmente, la table de hachage devient plus lente, et peut même cesser de
fonctionner (en fonction de la méthode utilisée). Le propriété attendue de temps constant pour une
table de hachage suppose que le facteur de charge soit gardé en deçà d'une certaine limite. Pour un
nombre d'emplacement fixe, le temps pour une recherche augmente avec le nombre d'entrées, par
conséquent, le temps constant désiré n'est pas atteint. Dans plusieurs implémentations, la solution
est de faire croître automatiquement (généralement, doubler) la taille de la table lorsque la limite
du facteur de charge est atteinte, forçant de fait, un nouveau hachage de l'ensemble des entrées.

Après le facteur de charge, on peut examiner la variance du nombre d'entrées par emplacement.

Un facteur de charge bas n'est pas forcément bénéfique. Quand le facteur de charge approche 0, la
proportion des aires inutilisées dans la table de hachage augmente, mais il n'y a pas nécessairement
une réduction dans le coût de recherche.

Les collision de hash sont pratiquement inévitables quand on hache un sous-ensemble aléatoire d'un
large ensemble de clefs possibles.

Par conséquent, presque toutes les implémentations de tables de hachages ont des stratégies de
résolution de collisions afin de gérer celles-ci. Toutes ces méthodes nécessitent que les clefs
soient stockées dans la table, ensemble avec leurs valeurs associées.
