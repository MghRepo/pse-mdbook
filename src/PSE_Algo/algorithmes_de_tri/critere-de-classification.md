## Algorithmes de tri

### Critère de classification

La classification des algorithmes de tri est très importante, car elle permet de choisir l'algorithme le plus adapté au problème
traité, tout en tenant compte des contraintes imposées par celui-ci. Les principales caractéristiques qui permettent de
différencier les algorithmes de tri, outre leur principe de fonctionnement, sont la complexité temporelle, la complexité
spatiale et le caractère stable.

La complexité temporelle (en moyenne ou dans le pire des cas) mesure le nombre d'opérations élémentaires effectuées pour trier
une collection d'éléments. C'est un critère majeur pour comparer les algorithmes de tri, puisque c'est une estimation directe du
temps d'exécution de l'algorithme. Dans le cas des algorithmes de tri par comparaison, la complexité en temps est le plus
souvent assimilable au nombre de comparaisons effectuées, la comparaison et l'échange éventuel de deux valeurs s'effectuant en
temps constant.

La complexité spatiale (en moyenne ou dans le pire des cas) représente, quant à elle, la quantité de mémoire dont va avoir
besoin l'algorithme pour s'exécuter. Celle-ci peut dépendre, comme le temps d'exécution, de la taille de l'entrée. Il est
fréquent que les complexités spatiales en moyenne et dans le pire des cas soient identiques. C'est souvent le cas lorsqu'une
complexité est donnée sans indication supplémentaire.

Un tri est dit *en place* s'il n'utilise qu'un nombre très limité de variables et qu'il modifie directement la structure qu'il
est en train de trier. Ceci nécessite l'utilisation d'une structure de donnée adaptée (un tableau par exemple). Ce caractère
peut être très important si on ne dispose pas de beaucoup de mémoire.

Toutefois, on ne déplace pas, en général, les données elles-mêmes, mais on modifie seulement des références (ou pointeurs) vers
ces dernières.

Un tri est dit *stable* s'il préserve l'ordonnancement initial des éléments que l'ordre considère comme égaux (tri à bulles, tri
par insertion et le tri par fusion).

Un tri *interne* s'effectue entièrement en mémoire centrale tandis qu'un tris *externe* utilise des fichiers sur une mémoire de
masse pour trier des volumes trop importants pour pouvoir tenir en mémoire centrale.

Certains algorithmes permettent d'exploiter les capacités multitâches de la machine. Notons également, que certains algorithmes,
notamment ceux qui fonctionnent par insertion, peuvent être lancés sans connaître l'intégralité des données à trier; on peut
alors trier et produire les données à trier en parallèle.

