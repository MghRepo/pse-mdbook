## Éléments de démarrage

### Cgroups

Les cgroups sont une fonctionnalité du noyau Linux qui limite, compte et isole l'utilisation des ressources (CPU, mémoire,
entrée/sortie, réseau, etc.) d'une collection de processus.

Ces groupes de contrôle peuvent être utilisés de multiples façons :

* En accédant le système de fichier virtuel du cgroup manuellement.
* En créant et gérant des groupes à la volée en utilisant des outils tels que *cgcreate*, *cgexec* et *cgclassify*
(*libcgroup*).
* A travers le "daemon moteur de règles" qui peut déplacer les processus de certains utilisateurs, groupes de manière
automatique ou commander aux cgroups comme cela a été spécifié dans sa configuration.
* Indirectement à travers d'autres logiciels utilisant les cgroups, tels que Docker, LXC, libvirt, systemd, etc.
