## Éléments de démarrage

### Initramfs

Une fois que le chargeur d'amorçage a chargé le noyau et les possibles fichiers initramfs et exécute le noyau, le noyau extrait
l'initramfs (système de fichier RAM initial) dans le rootfs (système de fichier racine initial, spécifiquement un ramfs ou
tmpfs) qui était vide jusqu'alors. La premier initramfs extrait a été inclus dans le binaire du noyau lors de la construction de
celui-ci, ensuite de possibles fichiers initramfs externes sont extraits. Par conséquent les initramfs externes surchargent des
fichiers portant le même nom dans l'initramfs inclus. Le noyau execute alors **init** (dans le rootfs) en tant que premier
processus. Les prémisses de l'espace utilisateur démarrent.

Les images externes initramfs peuvent être générées à l'aide de **mkinitcpio**, **dracut** ou **booster**.

Le but de l'initramfs est d'amener le système jusqu'au point où il accède au système de fichier racine. Cela signifie que tout
module requis pour des périphériques tels qu'IDE, SCSI, SATA, USB/FW (si démarrage depuis un disque externe) doit pouvoir être
chargé depuis l'initramfs si il n'est pas inclus dans le noyau ; une fois que les modules sont chargés (soit explicitement via
un programme ou un script, ou implicitement via udev), le processus de démarrage continue. Pour cette raison, l'initramfs a
uniquement besoin des modules nécessaires à l'accès au système de fichier racine. La majorité des modules sera chargé à
postériori par udev, durant le processus d'init (systemd).
