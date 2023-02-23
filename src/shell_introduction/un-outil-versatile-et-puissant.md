## Un outil versatile et puissant

Sur la plupart des systèmes Unix-like, il existe un utilisateur root. Cet utilisateur a le droit
d'accéder à l'ensemble des fichiers du système sans restriction (écriture, lecture, modification,
suppression). Généralement il est dangereux de se connecter en root sur une machine. De ce fait, on
préfère donner des droits root à d'autres utilisateurs mais uniquement sur des commandes
spécifiques. Pour cela on utilise l'utilitaire sudo.

Par exemple, la luminosité d'un ordinateur portable apparaît dans un fichier système :
```bash,ignore
    /sys/class/backlight/brightness
```
En écrivant dans ce fichier on peut changer la luminosité de l'écran. Néanmoins, l'écriture doit
être faite par root. En effet :
```bash,ignore
    $ sudo find -L /sys/class/backlight --maxdepth 2 -name "*brightness"

    $ sudo echo 3 >/sys/class/backlight/brightness
```
Ne marche pas ! En effet, c'est le shell qui exécute l'écriture via >. sudo sur la commande echo est
inutile. Pour contourner le problème on utilise un autre outil pour écrire le fichier :
```bash,ignore
    $ echo 3 | sudo tee /sys/class/blacklight/brightness
```
Puisque c'est le programme tee qui ouvre */sys* pour l'écriture en tant que root, les permissions
sont vérifiées. Un nombre de choses intéressantes se trouve sous */sys* (contrôle des périphériques,
les infos cpu, mémoire etc.)
