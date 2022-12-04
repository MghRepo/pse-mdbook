## Bases de données

### ACID

**Atomicité Consistence Isolation Durabilité (ACID)** est un ensemble de propriétés des transactions de bases de données devant
permettre de garantir une validité de données malgré les erreurs, pertes d'électricité et autres mésaventures. Dans le contexte
des bases de données, une séquence d'opération répondant aux propriétés ACID est appelé transaction.

Les caractéristiques de ces quatre propriétés sont les suivantes :

* **Atomicité** : Les transactions sont souvent composées de déclarations multiples. L'atomicité garantit que chaque transaction
est traitée en tant qu'unité, qui soit réussit totalement, soit échoue totalement : si la moindre déclaration constituante
échoue, la transaction échoue, la transaction dans son ensemble échoue et la base de donnée reste inchangée. Un système atomique
doit garantir l'atomicité dans chaque situation. Par conséquent, une transaction ne peut pas être observée comme étant en
progrès par un autre client de la base de données.
* **Consistence (validité)** : La consistence s'assure qu'une transaction peut uniquement amener la base de données d'un état
correct vers un autre, en gardant les invariants de la base de données : toute donnée rentrée en base doit être valide selon
toutes les règles définies, cela inclut les contraintes, les cascades, les déclenchements, et leurs combinaisons. Cela empêche
une corruption de la base de données mais ne garantit pas qu'une transaction soit correcte. L'intégrité référentielle garantit
la relation clef primaire - clef étrangère.
* **Isolation** : Les transactions sont souvent exécutées de façon concurrente. L'isolation garantit que l'exécution concurrente
de transactions laisse la base de données dans le même état que si ces transactions avaient été exécutées de façon séquentielle.
* **Durabilité** : La durabilité garantit qu'une fois l'exécution de la transaction finie, elle sera toujours enregistrée même
dans le cas d'une panne. Cela signifie généralement que les transactions complétées sont enregistrées dans une mémoire non
volatile.
