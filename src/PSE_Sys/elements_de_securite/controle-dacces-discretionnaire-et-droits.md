## Éléments de sécurité

### Contrôle d'accès discrétionnaire et droits

Le contrôle d'accès discrétionnaire (DAC) est un moyen de limiter l'accès aux objets basés sur l'identité des sujets ou des
groupes auxquels ils appartiennent. Le contrôle est discrétionnaire car un sujet avec une certaine autorisation d'accès est
capable de transmettre cette permission à n'importe quel autre sujet (sauf restriction du contrôle d'accès obligatoire).

Sous linux, les acteurs sont :

* l'utilisateur propriétaire (*user*)
* le groupe principal de l'utilisateur (*group*)
* les autres (*others*)

Les droits usuels s'organisent ainsi :

* pour les fichiers :
    - r autorise à lire le contenu du fichier
    - w autorise à modifier le contenu du fichier
    - x autorise l'exécution du fichier.
* pour les répertoires :
    - r autorise à lister le contenu d'un répertoire
    - w autorise la création, renommage et suppression de fichier
    - x autorise à traverser (entrer) dans le répertoire.

D'autres droits existent notamment :
    - t le sticky bit principalement utilisé sur les répertoires et qui permet d'éviter la suppression du répertoire par
      d'autres utilisateurs bien qu'ils puissent avoir des droits en écriture sur le contenu de ce même répertoire.
    - s le setuid et setgid qui permettent d'exécuter un fichier avec les mêmes permissions que son propiétaire ou
      respectivement son groupe. Setgid permet également de modifier le comportement d'un répertoire en fixant le groupe d'un
      fichier à sa création.
