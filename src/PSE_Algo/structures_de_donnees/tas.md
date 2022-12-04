## Structures de données

### Tas

Un tas est une structure de données de type arbre tel que pour tous noeuds A et B de l'arbre tels que B soit un fils de A :
clé(A)&#8805;clé(B) (ou inversement). Les primitives du tas sont : enfiler et defiler.

Pour enfiler un élément, on le place comme feuille, puis on fait "remonter" l'élément pour maintenir la priorité du tas.
L'opération peut être réalisée en *O(log n)*.

Quand on défile un élément d'un tas, c'est toujours celui de priorité maximale. Il correspond donc à la racine du tas.
L'opération peut conserver la structure de tas, avec une complexité de *O(log n)* ; en effet, il ne reste alors qu'à réordonner
l'arbre privé de sa racine pour en faire un nouveau tas.
