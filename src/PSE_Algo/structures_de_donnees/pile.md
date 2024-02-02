## Structures de données

### Pile

Une pile est une structure de données fondée sur le principe "dernier entré, premier sorti" (LIFO),
ce qui veut dire qu'en général, le dernier élément ajouté à la pile, sera le premier à en sortir.

La plupart des microprocesseurs gèrent nativement une pile. Elle correspond alors à une zone de la
mémoire, et le processeur retient l'adresse du dernier élément.

Voici les primitives communément utilisées pour manipuler les piles. Il n'existe pas de
normalisation pour les primitives de manipulation de pile. Leurs noms sont donc indiqués de manière
informelle. Seules les trois premières sont réellement indispensables, les autres pouvant s'en
déduire :

* Empiler (*Push*) : ajoute un élément sur la pile.
* Dépiler (*Pull*) : enlève un élément de la pile et le renvoie.
* "La pile est-elle vide ?" (*IsNull*) : renvoie vrai si la pile est vide, faux sinon.
* "Nombre d'éléments de la pile" (*Length*): renvoie le nombre d'élément de la pile.
* "Quel est l'élément de tête ?" (*Peek* ou *Top*) : renvoie l'élément de tête sans le dépiler.
* "Vider la liste" (*Clear*) : dépiler tous les éléments.
