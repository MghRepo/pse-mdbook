## Virtualisation et conteneurisation

### Conteneurisation LXC

LXC est une méthode de virtualisation au niveau du système d'exploitation permettant d'exécuter plusieurs systèmes isolés Linux
sur un système hôte de contrôle en utilisant un unique noyau Linux.

Le noyau Linux fournit la fonctionnalité des cgroups qui permet une limitation et une priorisation des ressources (CPU, mémoire,
entrées/sorties, réseau, etc.) sans besoin d'aucune machine virtuelle, ainsi que la fonction d'isolation par espace de noms qui
permet l'isolation complète d'une application du point de vue de l'environnement opérant, incluant l'arbre des processus, la
configuration réseau, les identifiants utilisateurs et les systèmes de fichiers montés.

LXC combine les cgroups du noyau et inclut l'isolation des espaces de nom pour fournir un environnement isolé à des
applications.

LXC permet d'exécuter des conteneurs en tant que simple utilisateur sur l'hôte à l'aide des conteneurs dits "non-privilégiés".
