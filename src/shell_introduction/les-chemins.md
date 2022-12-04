## Les chemins

Le shell sait quel programme (dont un certain nombre sont installés avec l'OS) utiliser et où celui-ci se situe dans le système
de fichiers à l'aide de ce que l'on appelle une variable d'environnement. Une variable connue et renseignée dès le lancement du
shell. Il s'agit de la variable PATH :
```bash,ignore
    $ echo $PATH
    /usr/local/sbin:/usr/local/bin:/usr/bin
```
Il s'agit d'une liste des chemins ordonnée dans lequel le shell va chercher les programmes.

La commande which permet de savoir dans quel répertoire se trouve le programme passé en argument, lequel sera celui exécuté lors
de l'appel par ce shell précisément :
```bash,ignore
    $ which echo
    /usr/bin/echo
```
Les chemins sont la description des emplacements des fichiers dans l'architecture du système de fichiers. Sur Linux et MacOS,
les répertoires sont séparés par des slashs. Le premier slash sur la gauche symbolise le sommet du système de fichiers (celui-ci
étant hiérarchique) il est appelé root ou répertoire root, racine en français. Sous Windows les répertoires sont généralement
séparés par des anti-slash et chaque partition est la racine de son propre système de fichier hiérarchique. La partition est
généralement désignée par une lettre de l'alphabet (C:\ D:\ etc.).

Il existe 2 types de chemins :

- les chemins absolus : à partir de la racine.
- les chemins relatifs : à partir du répertoire dans lequel on se situe.

Pour savoir dans quel répertoire on se trouve actuellement il existe la commande *pwd* pour *print working directory* (affiche
le répertoire de travail) :
```bash,ignore
    $ pwd
    /home/hugo
```
A partir d'ici on peut changer de répertoire de travail avec la commande cd et, en argument un chemin relatif ou absolu :
```bash,ignore
    $ cd /home

    $ pwd
    /home
```
Il existe un certain nombre de symboles permettant "d'expanser" des noms de répertoires :

- **~** : le répertoire de l'utilisateur courant (ie : /home/hugo)
- **.** : le répertoire de travail
- **..** : le répertoire parent du répertoire de travail
- **-** : l'ancien répertoire de travail

Par exemple :
```bash,ignore
    $ cd ~/test/

    $ pwd
    /home/hugo/test

    $ cd ../../

    $ pwd
    /home

    $ cd -

    $ pwd
    /home/hugo/test
```
Cela permet de naviguer plus facilement à l'intérieur du système de fichiers.

> Note : Dans le cas de script shell, lors de l'appel d'un programme on évite les chemins relatifs. On préfère travailler avec
la variable d'environnement PATH ou bien on donne le chemin absolu.
