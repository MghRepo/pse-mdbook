## Gestion des périphériques

### Udev

Udev est un gestionnaire de périphérique pour le noyau Linux. Udev gère principalement des noeuds
périphériques dans le répertoire */dev/*. Udev traite également tous les événements dans l'espace
utilisateurs lors de l'ajout ou de la suppression d'un périphérique, ainsi que du chargement des
microgiciels.

Les pilotes font parti du noyau Linux, dans le sens où leurs fonctions principales incluent la
découverte de périphérique, la détection des changements d'états, et autres fonctions matérielles
similaires de bas niveau. Après chargement du pilote de périphérique en mémoire depuis le noyau, les
événements détectés sont envoyés au daemon de l'espace utilisateur *udevd*. C'est le gestionnaire de
périphérique, *udevd*, qui récupère tout ces événements et qui ensuite décide de la suite à donner.
A cette fin, *udevd* dispose d'un ensemble de fichiers de configurations, pouvant être ajustés par
l'administrateur suivant ses besoins.

* Dans le cas d'un nouvel appareil de stockage USB, *udevd* est notifié par le noyau qui lui-même
  notifie le udisksd-daemon. Ce daemon pourra alors monter le système de fichiers.
* Dans le cas d'une nouvelle connexion de câble Ethernet à la carte d'interface réseau Ethernet
  (NIC), *udevd* est notifié par le noyau qui lui-même notifie le NetworkManager-daemon. Le
  NetworkManager-daemon pourra alors démarrer le daemon client dhcp pour cette NIC, ou bien
  configurer la connexion à l'aide d'une configuration manuelle quelconque.

Contrairement aux systèmes traditionnels UNIX, ou les noeuds périphériques contenus dans le
répertoire */dev* était un ensemble de fichiers statique, le gestionnaire de périphérique Linux udev
fournit dynamiquement, uniquement les noeuds des périphériques actuellement disponibles au système :

* udev fournit un nommage de périphérique persistant, qui ne dépend pas de, par exemple, l'ordre de
  connexion des appareils au système.
* udev s'exécute entièrement en espace utilisateur. Une conséquence est que udev peut exécuter des
  programmes arbitraires pour composer un nom pour le périphérique fonction de ses propriétés, avant
  que le noeud soit créé; d'ailleurs, l'ensemble du processus de nommage est également interruptible
  et s'exécute avec une priorité basse.

Udev est divisé en trois parties :

* La bibliothèque *libudev* qui permet l'accès aux informations des périphériques; qui est
  maintenant inclue dans *systemd*.
* Le daemon de l'espace utilisateur *udevd* qui gère */dev* virtuel.
* L'utilitaire d'administration en ligne de commande *udevadm* pour des diagnostics.

Le système reçoit des appels depuis le noyau via des sockets Netlink.
