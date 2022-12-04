## Processus et mécanismes de communication

### Tube anonyme

Un tube anonyme est un mécanisme de gestion de flux de donnée. Ce mécanisme inventé pour UNIX est principalement utilisé dans la
communication inter-processus. Ouvrir un tube anonyme permet de créer un flux de donnée unidirectionnel FIFO entre un processus
et un autre. Ces tubes sont détruits lorsque le processus qui les a créés disparaît, contrairement aux tubes nommés qui sont
liés au système d'exploitation et qui doivent être explicitement détruits.

Ce mécanisme permet la création de filtres.

Pour les système d'exploitation de type Unix, un tube anonyme est créé grâce à un appel système qui retourne un descripteur de
fichier à la suite de la création d'un Fork qui permet d'assigner à chacun des processus son rôle de récepteur ou d'émetteur.
