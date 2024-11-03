## Processus et mécanismes de communication

### Socket Netlink

La famille de socket Netlink est une interface du noyau Linux utilisée pour des communications
inter-processus entre les processus de l'espace utilisateur et du noyau et entre différents
processus utilisateurs. La différence entre les sockets Netlink et les socket IPC et qu'au lieu
d'utiliser l'espace de noms du système de fichiers, les processus Netlink sont généralement désignés
par leurs PIDs.

Netlink fournit une interface socket standard pour les processus utilisateurs, et une API côté noyau
pour un usage interne par les modules du noyau.
