## Virtualisation et conteneurisation

### Systemd-nspawn

Systemd-nspawn peut être utilisé pour exécuter une commande ou un OS dans un conteneur léger d'espace de noms. Il est plus
puissant que *chroot* puisqu'il virtualise la hiérarchie du système de fichiers, mais aussi l'arbre des processus, les
différents sous-systèmes IPC ainsi que le nom de l'hôte et du domaine.

Systemd-nspawn limite l'accès en lecture seule à différentes interfaces du noyau dans le conteneur, telles que **/sys**,
**/proc/sys** ou **/sys/fs/selinux**. Les interfaces réseaux et l'horloge système ne peuvent pas être modifiées depuis
l'intérieur du conteneur. Les fichiers spéciaux ou fichiers de périphérique ne peuvent  pas non plus être créés. Le système hôte
ne peut pas être redémarré et des modules du noyau ne peuvent pas être chargés depuis le conteneur.

Les conteneurs ainsi créés peuvent être gérés à l'aide de la commande *machinectl*.
