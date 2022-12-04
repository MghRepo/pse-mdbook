## Virtualisation et conteneurisation

### Chroot

Chroot est une opération qui modifie le répertoire racine apparent pour le processus en cours d'exécution et pour ses enfants.
Un programme qui s'exécute dans ce genre d'environnement modifié ne peut pas accéder les fichiers et les commandes en dehors de
cet arbre de répertoire environnemental. Cet environnement modifié s'appelle une *prison chroot*.
