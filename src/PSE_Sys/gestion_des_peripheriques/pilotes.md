## Gestion des périphériques

### Pilotes

Un pilote est un programme qui opère et contrôle un périphérique. Un pilote fournit une interface logicielle au matériel,
permettant au système d'exploitation et aux autres programmes d'accéder aux fonctions matérielles sans avoir besoin de connaître
en détail le périphérique à utiliser.

Le pilote communique avec le périphérique via le bus informatique auquel celui-ci est connecté. Lorsqu'un programme appelant
invoque une routine du pilote, celui-ci va envoyer une commande au périphérique. Une fois que le périphérique renvoie des
données au pilote, le pilote peut invoquer des routines du programme à l'origine de l'appel.

Les pilotes sont dépendant du matériel et spécifiques au système d'exploitation. Il fournissent généralement la gestion des
interruptions à n'importe quelle interface matérielle asynchrone nécessaire.
