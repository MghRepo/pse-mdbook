## Éléments de démarrage

### Partitionnement de la mémoire

Le partitionnement de la mémoire est la création d'une ou plusieurs régions dans la mémoire secondaire, telle que chaque région
puisse être gérée séparément. Ces régions sont appelées partitions. C'est généralement la première chose à faire sur un nouveau
disque installé, avant qu'un système de fichier soit créé. Le disque stocke l'information sur le positionnement et la taille des
partitions dans une aire appelée table de partition que le système d'exploitation lit avant toute autre région du disque. Chaque
partition apparait alors comme un disque "logique" du point de vue du système d'exploitation qui fait usage d'une partie du
disque réel. Les administrateurs systèmes utilisent alors un programme appelé éditeur de partitions pour créer, retailler,
supprimer et manipuler les partitions. Le partitionnement permet l'usage de différents systèmes de fichiers afin de stocker tout
types de fichiers. Séparer les données utilisateur des données système permet d'empêcher que la partition système soit pleine ce
qui rendrait le système inutilisable. Le partitionnement permet aussi de simplifier la sauvegarde. Un désavantage du
partitionnement est qu'il peut être difficile d'allouer la taille adéquate à chacune des partitions, ce qui peut avoir pour
conséquence de laisser une partition avec énormément d'espace libre et une autre totalement saturée.
