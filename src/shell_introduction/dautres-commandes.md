## D'autres commandes

La commande mv permet de renommer et/ou (non exclusif) déplacer un fichier:
```bash,ignore
    $ mv fichier_a_renommer ../../nouveau_fichier
```
La commande cp permet de copier un fichier :
```bash,ignore
    $ cp original ~/copie
```
La commande rm permet de supprimer un fichier :
```bash,ignore
    $ rm ~/copie
```
Par défaut la commande *rm* n'est pas récursive. Pour cela il est nécessaire d'ajouter le flag *-r*
suivi du répertoire. La commande *rmdir* permet également de supprimer un répertoire mais seulement
si celui-ci est déjà vide.

Finalement pour créer un nouveau répertoire on utilise la commande :
```bash,ignore
    $ mkdir Mon\ Repertoire
```
Pour avoir encore plus d'informations sur une commande on peut se référer aux pages de manuel de
celle-ci :
```bash,ignore
    $ man ls
```
Cela permet généralement d'avoir une meilleure vision de ce que fait la commande, avec une
navigation facilitée.

> Note : Pour quitter le programme *man*, il suffit de presser la lettre *q*.

Pour nettoyer le terminal on peut exécuter la commande :
```bash,ignore
    $ clear
```
ou plus facilement presser Ctrl + L.
