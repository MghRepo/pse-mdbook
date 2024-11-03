## Qu'est-ce que le shell ?

Le Shell est un programme qui permet d'interpréter les commandes de l'utilisateur. C'est l'un des
tout premiers moyens d'interagir avec un ordinateur. Le shell est généralement plus puissant qu'une
interface graphique utilisateur (GUI), dans le sens où il permet d'accéder très efficacement aux
fonctionnalités internes du système d'exploitation (OS).

Souvent les outils textuels dont il dispose sont construits de manière à pouvoir être composés.
Ainsi de multiples assemblages permettent à la fois une simplicité dans la décomposition des tâches,
et une facilité de mise en oeuvre dans l'automatisation.

Les shells peuvent généralement dépendre des OS, sachant qu'il en existe une quantité pour chacun
d'entre eux. Dans le cas de Linux, le Bourne Again Shell ou bash est très largement répandu. C'est
celui qui va nous intéresser ici.

Quand on ouvre un terminal, une fenêtre s'ouvre affichant un prompt shell. Dans le cadre du bash si
aucune personnalisation n'a été faite il se décompose ainsi :
```console
[utilisateur@machine répertoire\ de\ travail]$
```
Généralement un shell est fait pour passer des commandes, c'est à dire, exécuter des programmes avec
ou sans arguments :
```console
$ date
sam. 09 mai 2020 17:36:09 CEST
```
L'ajout de certains arguments permet de modifier le comportement de certains programmes. La commande
*echo* permet par exemple d'afficher à l'écran les arguments qui la suivent. Un argument est une
chaîne de caractère séparée du nom du programme par un espace :
```console
$ echo hello
hello
```
Si l'on souhaite que l'argument contiennent lui-même un espace, et éviter d'ajouter un deuxième
argument il suffit d'entourer la chaîne de guillemets :
```console
$ echo "Hello world!"
Hello world!
```
On peut également échapper le caractère espace à l'aide d'un antislash :
```console
$ echo Hello\ world!
Hello world!
```

> Exemple pour créer un répertoire Mes photos on écrit : *mkdir Mes\ photos*
