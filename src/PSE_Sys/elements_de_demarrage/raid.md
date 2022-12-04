## Éléments de démarrage

### RAID

RAID est une technologie de stockage qui combine plusieurs composants de disques durs (typiquement des disques durs ou leurs
partitions) en une unité logique. Selon l'implémentation du RAID, cette unité logique peut être un système de fichier ou une
couche transparente additionnelle qui détient plusieurs partitions. Les données sont distribuées sur les disques d'une ou
plusieurs manières appelés niveaux de RAID. Le niveau de RAID choisit peut ainsi empêcher des pertes de données dans le cas
d'une perte de disque dur, améliorer la performance ou une combinaison des deux.

Il existe de nombreux niveaux de RAID différents ; ceux listés ci-dessous sont les plus communs :

* **RAID 0** : Entrelacement de disques. Augmente la vitesse de lecture et d'écriture sans redondance.
* **RAID 1** : Disques en miroir.
* **RAID 5** : Nécessite au minimum 3 disques et combine la redondance du RAID 1 et les bénéfices de vitesse du RAID 0.
* **RAID 6** : Nécessite au minimum 4 disques fournit les bénéfices du RAID 5 mais avec la sécurité contre la perte de deux
disques.
* **RAID 1+0** : RAID imbriqué qui combine deux niveaux standards du RAID pour gagner en performance et redondance
additionnelle.

Les périphériques de RAID peuvent être gérés de plusieurs façons :

* **RAID Logiciel** : La grappe est gérée par le système d'exploitation soit par :
    - Une couche d'abstraction (mdadm);
    - Un gestionnaire de volume logique (LVM);
    - Un composant du système de fichier (ZFS, Btrfs);
* **RAID Matériel** : La grappe est directement gérée par une carte matérielle dédiée installée dans le PC auxquels les disques
sont directement connectés. La logique RAID s'exécute sur un processeur embarqué indépendamment du processeur hôte (CPU). Bien
que cette solution soit indépendante du système d'exploitation, cette dernière nécessite un pilote pour fonctionner correctement
avec le contrôleur de RAID matériel. La grappe de RAID peut soit être configurée via une interface microgicielle ou, selon le
fabricant, à l'aide d'application dédiées après installation du système d'exploitation. La configuration est transparente pour
le noyau Linux : il ne voit pas les disques séparément.
* **FakeRAID** : Ce type de raid est correctement appelé RAID microgiciel. La grappe est gérée par un pseudo contrôleur RAID où
la logique RAID est implémentée dans une partie microgicielle , mais sans toutes les capacité des contrôleurs RAID matériels.
