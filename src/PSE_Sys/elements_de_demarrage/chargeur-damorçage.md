## Éléments de démarrage

### Chargeur d'amorçage

Un chargeur d'amorçage est un logiciel démarré par le microgiciel (BIOS ou UEFI). Il est responsable du chargement du noyau avec
les paramètres recommandés et du disque RAM initial (initrd) selon  des fichiers de configuration. Dans le cas de l'UEFI, le
noyau lui-même peut directement être lancé par l'EFI boot stub qui permet au microgiciel EFI un chargement du noyau en tant
qu'exécutable EFI. Un chargeur d'amorçage séparé ou gestionnaire de démarrage peut toujours être utilisé afin d'éditer les
paramètres du noyau avant le démarrage.

Un chargeur d'amorçage doit pouvoir accéder au images du noyau et de l'initramfs, autrement le système ne pourra pas démarrer.
Par conséquent, il doit typiquement pouvoir accéder à **/boot**. C'est à dire, qu'il doit pouvoir supporter un ensemble allant
des périphériques de blocs, aux périphériques de blocs empilés (LVM, RAID, dm-crypt; LUKS, etc.) jusqu'au système de fichier sur
lequel réside les images du(des) noyau(x) et de(des) initramfs.

Le chargement du disque RAM initial peut également inclure un microcode processeur du fabricant qui fournit des mises à jours de
sécurité et de stabilité.

Les mises à jour du microcode sont généralement incluses dans le microgiciel de la carte mère et appliquées durant
l'initialisation du microgiciel. Du fait que les fabricants des équipements d'origine ne mettaient pas forcément à jour leur
microgiciel de manière régulière et que les vieux système ne bénéficiaient d'aucune mise à jour, la possibilité d'appliquer ses
mises à jour du microcode processeur a été ajouté au moment du démarrage pour le noyau Linux.
