## Éléments de démarrage

### LVM

La gestion de volumes logiques (LVM) utilise la fonctionnalité du composant *device-mapper* du noyau
linux pour fournir un système de partitions indépendant de l'arrangement des disques sous-jacents.
Avec LVM on obtient des **partitions virtuelles**. Cette abstraction facilite la gestion des volumes
de stockage (potentiellement toujours sujette aux limitations du système de fichier).

Ces partitions virtuelles permettent l'ajout et la suppression sans avoir à ce soucier si l'espace
contigu est suffisant sur un disque en particulier, sans se faire avoir en essayant de formater un
disque en cours d'utilisation (et se demander si le noyau utilise l'ancienne ou la nouvelle table de
partition), ou , avoir à déplacer des partitions pour en agrandir une. 

Les composants basiques de LVM sont les :

* **Volumes physiques (PV)** : Un noeud de périphérique de bloc Unix, utilisable pour du stockage
  par LVM. Il accueille une entête LVM.
* **Groupes de volumes (VG)** : Groupe de volumes physiques (PVs) qui sert de contenant aux volumes
  logiques (LVs). Les extensions physiques (PEs) sont allouées depuis un groupe de volume (VG) pour
  un volume logique (LV).
* **Volumes Logiques (LV)** : "Partition virtuelle/logique" résidant dans un groupe de volume (VG)
  et composé d'extensions physiques (PEs). Les Volumes logiques (LVs) sont des périphériques de
  blocs Unix analogues à des partitions physiques, c'est à dire qu'elles peuvent être directement
  formatées à l'aide d'un système de fichier.
* **Extentions physiques (PE)** : La plus petite extension contigüe (par défaut 4MiB) dans le volume
  physique (PV) qui peut être assigné à un volume logique (LV).

LVM permet une plus grande flexibilité comparé à l'utilisation d'une partition de disque dur
classique :

* Utiliser plusieurs disques comme un seul gros disque.
* Avoir des volumes logiques étendus sur plusieurs disques.
* Créer de petits volumes logiques et les retailler "dynamiquement" quand ils se remplissent.
* Redimensionner des volumes logiques quelque soit leur ordre sur le disque.
* Capturer une sauvegarde d'une copie gelée du système de fichier, en gardant une forte
  disponibilité.
* Supporter différentes cibles de *device-mapper*, incluant le chiffrement de systèmes de fichier
  transparent et la mise en cache de données fréquemment utilisées. Ceci permet de créer un système
  avec un ou plusieurs disques physiques (chiffrés avec LUKS) et LVM par dessus pour permettre de
  redimensionner et de gérer les volumes séparés sans avoir à entrer une clef de nombreuses fois au
  démarrage.

Les désavantages étant :

* Des étapes supplémentaire lors de l'installation du système. Nécessite l'exécution d'un certain
  nombre de daemons.
* Le dual booting avec des SE ne supportant pas LVM (Windows).
* Dans le cas de volumes physique qui ne sont pas en RAID-1, RAID-5 ou RAID-6 perdre un disque peut
  signifier perdre un ou plusieurs volumes logiques si on étale (ou étend) des volumes logiques sur
  un ensemble de disques non redondants.
