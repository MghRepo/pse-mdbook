## Lister le contenu d'un répertoire et droits

Par défaut (sans argument) un programme agit sur le répertoire de travail. Il est alors généralement
intéressant de savoir que contient ce répertoire. La commande ls permet de lister le contenu d'un
répertoire.
```bash,ignore
    $ ls file1  file2  file3

    $ ls ../../ bleu rouge vert
```
Dans le cas de l'utilisation de certains programmes il peut être utile de connaître les arguments
que l'utilitaire accepte. La plupart des programmes implémentent des flags et des options. Un des
flags les plus utiles est --help :
```bash,ignore
    $ ls --help
```
permet d'afficher l'aide de la commande *ls*.

Pour lire les usages, *...* signifie 1 ou plus et *[ ]* signifie que ce qui est dans les crochets
est optionnel. En suit généralement une brève description de la commande et à la suite les
potentiels flags disponibles.
```bash,ignore
    $ ls -l
```
permet de lister au format long avec un nombre bien plus important d'information :

- le type de fichiers
- les droits : utilisateur propriétaire, groupe principal du propriétaire, autres (user, group,
  others)
- le nombre d'inodes (hard links)
- l'utilisateur propriétaire
- le groupe principal du propriétaire
- le mtime (modification time)
- le nom du fichier

Les droits s'organisent ainsi :

- pour les fichiers
    * r : read, autorise à lire le contenu du fichier w : write, autorise à modifier le contenu du
      fichier x : execute, autorise l'exécution du fichier
- pour les répertoires
    * r : read, autorise à lister le contenu du répertoire w : write, autorise la création de
      fichier, la modification du nom de fichier et la suppression de fichier x : execute, autorise
      à traverser (entrer) dans le répertoire

Enfin le - présenté par la commande :
```bash,ignore
    $ ls -l
```
signifie l'absence du droit.
