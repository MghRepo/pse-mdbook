## Gestion de la mémoire centrale

### Pagination

Les adresses mémoires émises par le processeur sont des adresses virtuelles, indiquant la position
d'un mot dans la mémoire virtuelle. Cette mémoire virtuelle est formée de zones de même taille,
appelées pages. Une adresse virtuelle est donc un couple (numéro de page, déplacement dans la page).
La taille des pages est une puissance entière de deux, de façon à déterminer sans calcul le
déplacement (10 bits de poids faible de l'adresse virtuelle pour des pages de 1024 mots), et le
numéro de page (les autres bits). La mémoire vive est également composées de zones de même taille,
appelées cadres (*frames*), dans lesquelles prennent place les pages (un cadre contient une page :
taille d'un cadre = taille d'une page). La taille de l'ensemble des cadres en mémoire vive utilisés
par un processus est appelé *Resident set size*. Un mécanisme de traduction (*translation*) assure
la conversion des adresses virtuelles en adresses physiques, en consultant une table des pages
(*page table*) pour connaître le numéro du cadre qui contient la page recherchée. L'adresse physique
obtenue est le couple (numéro de cadre, déplacement). Il peut y avoir plus de pages que de cadres
(c'est là tout l'intérêt) : les pages qui ne sont pas en mémoire sont stockées sur un autre support
(disque), elle seront ramenées dans un cadre quand on en aura besoin.

La table des pages est indexée par le numéro de page. Chaque ligne est appelée "entrée dans la table
des pages (*pages table entry* PTE), et contient le numéro de cadre. La table des pages pouvant être
située n'importe où en mémoire, un registre spécial (PTBR pour *Page Table Base Register*) conserve
son adresse.

En pratique, le mécanisme de traduction fait partie d'un circuit électronique appelé MMU (*memory
management unit*) qui contient également une partie de la table des pages, stockée dans une mémoire
associative formée de registres rapides. Ceci évite d'avoir à consulter la table des pages (en
mémoire) pour chaque accès mémoire.
