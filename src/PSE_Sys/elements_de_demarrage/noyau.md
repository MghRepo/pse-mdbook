## Éléments de démarrage

### Noyau

Le noyau est un programme informatique au cœur d'un système d'exploitation informatique et a un contrôle complet sur l'ensemble
du système. Il s'agit de la partie du code du système d'exploitation qui réside en permanence en mémoire, et facilite les
interactions entre composants matériels et logiciels. Un noyau complet contrôle l'ensemble des ressources matérielles (ex. E/S,
mémoire, cryptographie) via des pilotes, arbitre les conflit entre processus a propos de ces ressources, et optimise
l'utilisation des ressources communes ex. CPU & utilisation des caches, systèmes de fichiers, et sockets réseaux. Sur la
majorité des systèmes, le noyau est le premier programme chargé au démarrage (après le chargeur d'amorçage). Il gère le reste du
processus de démarrage ainsi que la mémoire, les périphériques, les requêtes d'entrées/sorties (E/S) du logiciel, en les
traduisant en instructions de traitements de données pour le processeur.

Le code critique du noyau est généralement chargé dans une aire de la mémoire séparée, qui est protégée des accès via les
applications logicielles ou d'autres parties moins critiques d'un système d'exploitation. Le noyau effectue des tâches telles
que, l'exécution de processus, la gestions de périphériques matériels tels que le disque dur, et la gestion des interruptions,
dans l'espace noyau protégé. Par contraste, des programmes applicatifs tels que des navigateurs, des traitements de texte, ou
des lecteurs audio ou vidéo utilisent une aire séparée de la mémoire, l'espace utilisateur. Cette séparation empêche les données
utilisateurs et les données noyau d'interférer l'une avec l'autre causant instabilité et lenteurs, empêchant également des
applications défectueuses d'affecter d'autres applications ou même le système d'exploitation dans son ensemble.

L'interface noyau est une couche d'abstraction de bas niveau. Quand un processus demande un service au noyau, il doit invoquer
un appel système, généralement à travers une fonction englobante.

Il existe différentes architectures de noyau. Les noyaux monolithiques s'exécutent entièrement dans un espace d'adressage unique
avec le processeur en mode supervision, principalement pour des questions de rapidité. Les micro-noyaux exécutent la plupart de
leurs services dans l'espace utilisateur, de la même manière que les processus utilisateurs, principalement pour des
considérations de résilience et de modularité. Le noyau Linux est monolithique, bien qu'également modulaire, puisqu'il peut
insérer et supprimer des module noyaux chargeable à l'exécution.
