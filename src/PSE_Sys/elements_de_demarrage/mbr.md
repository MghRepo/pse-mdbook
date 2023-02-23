## Éléments de démarrage

### MBR

Un **enregistrement de démarrage maître (MBR)** est type spécial de secteur de démarrage situé au
commencement d'un périphérique de stockage informatique partitionné tel qu'un disque dur.

Le MBR contient l'information du comment les partitions logiques, contenant le système de fichiers,
sont organisées sur ce périphérique. Le MBR contient également du code exécutable pour fonctionner
comme chargeur pour un système d'exploitation installé généralement en laissant la main au second
étage du chargeur, ou en conjonction avec chacun des enregistrements de démarrage de volume (VBR).
Ce code MBR est généralement désigné comme un chargeur d'amorçage.

L'organisation de la table de partition au niveau du MBR limite le maximum d'espace de stockage
adressable d'un disque partitionné à 2To. Par conséquent, le schema de partitionnement MBR est
progressivement remplacé par le schema de table de partitionnement GUID (GPT).

Le MBR consiste généralement à 512 octets situés sur le premier secteur du disque.

Il peut contenir un(e) ou plusieurs :

* Table de partition décrivant les partitions sur un périphérique de stockage. Dans ce contexte, le
  secteur de démarrage peut également être appelé secteur de partitionnement.
* Code de bootstrap : Instructions permettant d'identifier la partition de démarrage configurée,
  puis charge et exécute son volume d'enregistrement de démarrage (VBR) en tant que chargeur chaîné.
* Horodatage disque 32-bits optionnel
* Signature disque 32-bits optionnel
