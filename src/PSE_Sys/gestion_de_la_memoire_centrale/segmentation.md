## Gestion de la mémoire centrale

### Segmentation

La segmentation est une technique de découpage de la mémoire. Elle est gérée par l'unité de
segmentation de l'unité de gestion mémoire (*MMU*), utilisée sur les systèmes d'exploitation
modernes, qui divise la mémoire physique (dans le cas de la segmentation pure) ou la mémoire
virtuelle (dans le cas de la segmentation avec pagination) en segments caractérisés par leur adresse
de début et leur taille (*décalage*).

La segmentation permet la séparation des données du programme (entre autres segments) dans des
espaces logiquement indépendants facilitant alors la programmation, l'édition de liens et le partage
inter-processus. La segmentation permet également d'offrir une plus grande protection grâce au
niveau de privilège de chaque segment.

Lorsque l'unité de gestion mémoire (MMU) doit traduire une adresse logique en adresse linéaire,
l'unité de segmentation doit dans un premier temps utiliser la première partie de l'adresse, c'est à
dire le sélecteur de segment, pour retrouver les caractéristiques du segment (base, limit, DPL,
etc.) dans la table de descripteurs (GDT ou LDT). Puis il utilise la valeur de décalage qui
référence l'adresse à l'intérieur du segment.

Il existe sur la majorité des processeurs actuels, des registres de segments (CS, DS, SS, etc.) qui
contiennent le sélecteur de segment dernièrement utilisé par le processeur qui sont utilisés pour
accélérer l'accès à ces sélecteurs.

Sur les processeurs récents, il existe également des registres associés à chaque registre de segment
qui contiennent le descripteur de segment associé pour un accès plus rapide aux descripteurs.

Un segment mémoire est un espace d'adressage indépendant défini par deux valeurs :

* L'adresse où il commence (aussi appelée *base*, ou *adresse de base*)
* Sa taille ou son *décalage* (aussi appelée *limite* ou *offset*)

Un segment constitue donc dans la mémoire principale un plage d'adresse continue. Les segments se
chevauchent. On peut donc adresser la même zone mémoire avec plusieurs couples segment/offset.

Il existe différents types de segment :

* Les segments de données statiques
* Les segments de données globales
* Les segments de code
* Les segments d'état de tâche
