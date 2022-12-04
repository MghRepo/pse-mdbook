## Processus et mécanismes de communication

### Socket IPC

Un socket de domaine Unix ou socket IPC (*inter-process communication*) et un point d'arrivée des données de communications qui
permet d'échanger des données entre des processus s'exécutant sur le même système d'exploitation hôte. Les types de socket
valides dans le domaine UNIX sont :

* **SOCK_STREAM** (à comparer au TCP) - pour un socket orienté flux
* **SOCK_DGRAM** (à comparer à UDP) - pour un socket orienté datagramme qui préserve les limites des messages (comme la plupart
des implémentations UNIX, les socket de domaine UNIX datagram sont toujours fiables et ne réordonnent pas les datagrammes)
* **SOCK_SEQPACKET** (à comparer à SCTP) - pour un socket à paquets séquencés orienté connexion, qui préserve les limites des
messages, et livre les paquets dans l'ordre d'envoi.

Les sockets de domaine Unix sont une composante standard des systèmes d'exploitation POSIX.

Les interfaces de programmation (API) pour les sockets de domaine Unix sont similaires à celles des sockets internet, mais au
lieu d'utiliser un protocole réseau sous-jacent, toutes les communications se placent à l'intérieur du noyau du système
d'exploitation. Les socket de domaine Unix peuvent utiliser le système de fichiers comme adresse d'espace de noms. (Certains
systèmes d'exploitation, comme Linux, offrent des espaces de noms additionnels.) Les processus référencent les sockets de
domaine Unix comme des inodes du système de fichier, ainsi 2 processus peuvent communiquer en ouvrant la même socket.

En plus de permettre l'envoi de données, les processus peuvent envoyer des descripteurs de fichiers à travers une connexion de
socket de domaine Unix en utilisant les appels systèmes sendmsg() et recvmsg(). Ceci permet au processus qui envoie d'autoriser
le processus qui reçoit à accéder au descripteur de fichier auquel autrement le processus qui reçoit n'a pas accès. Ceci permet
d'implémenter une forme rudimentaire de sécurité basée sur l'accessibilité.
