## Éléments de démarrage

### GPT

La **table de partition GUID (GPT)** est un standard pour la disposition de tables de partitions sur
un appareil de stockage informatique, tels que les disques durs ou les SSDs, en utilisant des
identifiants uniques universels, aussi connus en tant qu'identifiants uniques globaux (GUIDs). Ce
standard fait parti des standards d'interface microgicielle extensible unifiée (UEFI), il peut
néanmoins être utilisé pour des systèmes BIOS, du fait des limitations des tables de partitions MBR.

Tous les systèmes d'exploitation récents supportent GPT.

De la même façon que MBR, GPT utilise un adressage de blocs logique (LBA) à la place de l'adressage
historique cylindre-tête-secteur (CHS). Le MBR est stocké au niveau de LBA 0, l'entête GPT à LBA 1.
L'entête GPT contient un pointeur vers la table de partition (typiquement situé à LBA 2). Chaque
entrée dans la table de partition a une taille de 128 octets. Les spécifications UEFI stipulent
qu'un minimum de 16 384 octets, soit attribué à la table de partition. Ainsi, sur un disque avec des
secteurs de 512 octets, au moins 32 secteurs sont utilisés pour la table de partition, et le premier
bloc utilisable est le LBA 34 ou supérieur.
