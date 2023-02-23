## Redirection d'entrée/sortie, descripteurs de fichiers et tubes

Comme il a été évoqué plus haut, l'une des caractéristiques les plus importantes du shell est qu'il
permet l'assemblage de multiples programmes via des flux. Cela permet de combiner les
fonctionnalités de différents programmes afin d'exécuter une tâche spécifique.

Pour interagir avec ces flux le bash dispose de descripteurs de fichiers ou fd (pour file
descriptor). Ceux-ci sont des chiffres utilisés comme référence abstraite vers un fichier ou une
ressource d'entrée/sortie (e.g pipe, IPC etc.) Le terme de fichier est ici très large également
(physique, virtuel, périphérique etc.)

Par défaut 3 ressources disposant de fd sont ouverts :

- le stdin ou (entrée standard) : fd 0, qui est saisi au clavier
- le stdout ou (sortie standard) : fd 1, qui est affiché dans le terminal
- le stderr ou (erreur standard) : fd 2, qui est affiché dans le terminal

Pour alimenter l'entrée standard à l'aide du contenu d'un fichier, on utilise le chevron gauche :
```bash,ignore
    $ ma_commande < nom_fichier
```
Pour vider le contenu de la sortie standard dans un fichier, on utilise le chevron droit :
```bash,ignore
    $ ma_commande > nom_fichier
```
> Note : Si aucun chiffre de descripteur ne préfixe les chevrons, ce sera le stdin (0) pour un
gauche et le stdout (1) pour un droit.

Dans ce cas précis, uniquement la sortie d'erreur standard sera affichée dans le terminal. Dans ce
cas précis également, le contenu préexistant au fichier est écrasé, ce qui peut être pratique si
l'on souhaite vider un fichier ou créer un fichier vide on peut exécuter la commande :
```bash,ignore
    $ > nom_fichier
```
Pour ajouter le flux au fichier on utilise le double chevron :
```bash,ignore
    $ ma_commande >> nom_fichier
```
Si l'on souhaite conserver cette sortie d'erreur dans un fichier il faut préciser le descripteur de
fichier :
```bash,ignore
    $ ma_commande > nom_fichier 2> erreur_log
```
Et si l'on souhaite simplement ajouter sans écraser :
```bash,ignore
    $ ma_commande >> nom_fichier 2>> erreur_log
```
Si l'on souhaite rediriger le fd i vers j :
```bash,ignore
    $ i>&j
```
Par exemple :
```bash,ignore
    $ ma_commande 2>&1 nom_fichier
```
redirige la stderr vers stdout.

Pour ouvrir un fichier et affecter un descripteur de fichier :
```bash,ignore
    $ exec 3<> nom_fichier
```
Et pour fermer le fichier :
```bash,ignore
    $ exec 3>&-
```
Cela permet d'accéder au fichier :
```bash,ignore
    $ exec 3<> nom_fichier

    $ read <&3         # Se déplacer d'une ligne vers le bas

    $ read -n 3 <&3    # Se déplacer de 3 caractères (en position 4)

    $ echo -n . >&3

    $ exec 3>&-
```
Le script ci-dessus permet par exemple de remplacer le 4ème caractère de la deuxième ligne du
fichier par un point. La où le shell se distingue réellement, c'est dans l'utilisation de pipe. Cet
opérateur | permet de chaîner des programmes de façon à ce que la sortie de l'un devienne l'entrée
d'un autre :
```bash,ignore
    $ ls -l / | tail -n1
    $ pactl list sink-inputs | rg Volume | awk '{print $5}'
```
La première commande affiche le dernier item de la liste de fichiers du répertoire /. La deuxième
affiche le pourcentage de l'entrée son des destinations (sinks) audio (enceintes, casques etc.) Cela
a de multiples avantages notamment pour l'exploitation de fichiers de données.

Une commande conçue pour fonctionner avec l'opérateur pipe est xargs. xargs lit l'entrée standard et
passe chaque item en argument à la fonction suivante. Un exemple d'application :
```bash,ignore
    $ ls *.txt | xargs wc -l
```
La première commande liste l'ensemble des fichiers .txt et wc compte le nombre de ligne de chacun
des fichiers passés en argument.

Pour savoir ce qu'une commande peut faire, savoir quelle est son utilisation généralement celle-ci
implémente une option --help ou une référence (page) dans le man. Man est une commande qui renvoie
une section du manuel système. Pour plus de détail :
```bash,ignore
    $ man man
```
Appuyer sur q pour quitter.

Pour reprendre l'opérateur | on peut afficher une page man et l'ouvrir au format pdf :
```bash,ignore
    $ man ma_commande -Tpdf | zathura -
```
Si on le souhaite (et qu'on dispose d'un lecteur pdf)...
