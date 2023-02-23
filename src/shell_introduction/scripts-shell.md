## Scripts shell

La plupart des shells ont un langage de script qui leur est propre. Ce qui fait que le langage de
script shell est différent de langages de scripts plus traditionnels c'est qu'il est avant tout fait
pour de l'administration système. Créer des commandes pipes, écrire dans des fichiers, lire l'entrée
standard etc. Dans cette section, le langage bash étant le plus répandu, c'est celui que nous
utiliserons.

Pour assigner des variable en bash, on utilise la syntaxe *foo=bar* et on accède au contenu de la
variable avec *$foo*. *foo = bar* ne marche pas puisque le bash l'interprète comme l'appel du
programme *foo* avec 2 arguments *=* et *bar*. En général dans les scripts shell le caractère espace
sépare les arguments.

Les chaînes de caractères en bash peuvent être définies à l'aide des délimiteurs ' et ", mais ils ne
sont pas équivalents. Les chaînes délimitées à l'aide de la simple quote sont des littéraux et ne
substituent pas de variables contrairement aux chaînes délimitées à l'aide d'une double quote :
```bash,ignore
    $ foo=bar
    $ echo "$foo"
      bar
    
    $ echo '$foo'
      $foo
```
Comme la plupart des langages de programmation, bash supporte des techniques de contrôle du flux
d'exécution tel que if, case, while et for. On peut également définir des fonctions en bash qui
peuvent prendre des arguments. Exemple :
```bash,ignore
    mcd () {
        mkdir -p "$1"
        cd "$1"
    }
```
Ici $1 est le premier argument de la fonction. Contrairement aux autres langages de script, bash
utilise un nombre assez important de variables spéciales qui font référence à des arguments, codes
d'erreurs etc. Voir liste ci-dessous :

- $0 - Nom du script
- $1 à $9 - Arguments du script. $1 est le premier argument (resp. autres)
- $@ - Tous les arguments
- $# - Nombre d'arguments
- $? - Code retour de la commande précédente (très utile pour une vérification par exemple)
- $$ - Identifiant de processus (PID) du shell courant.
- $! - Identifiant de processus (PID) de la dernière commande passée en background.
- $_ - Dernier argument de la dernière commande. Dans un shell interactif on peut également faire
  Esc suivi du point.

Les commandes génèrent généralement une sortie via stdout, des erreurs via stderr, et un code
retour. Le code retour permet de savoir le résultat d'exécution, qui peut être utilisé à la suite
par d'autres scripts ou commandes. Généralement, une valeur de 0 signifie que tout s'est bien passé
et tout autre valeur est une erreur.

Néanmoins, ce code peut aussi être utilisé pour des commandes conditionnées en utilisant les
opérateurs && (et) et || (ou). Les commandes peuvent également être séparées sur la même ligne avec
le ; . La commande true aura toujours un code retour à 0 tandis que false aura toujours un code à 1.
Exemples :
```bash,ignore
    false || echo "Oups, raté !"
    
    true || echo "N'est pas affiché"
    
    true && echo "Les choses se sont bien passées."
    
    false && echo "Pas affiché"
    
    false ; echo "Ca marche !"
```
Parfois on souhaite avoir le contenu de la sortie d'une commande dans une variable. On peut le faire
à l'aide d'une substitution de commande. Quand on écrit $(commande) le bash exécutera la commande et
substituera son contenu dans le script avant l'exécution de celui-ci. Par exemple, si on écrit :
```bash,ignore
    for file in $(ls)
```
Le shell appellera dans un premier temps ls et parcourra ses valeurs par la suite.

Le bash permet également de substituer une commande de cette façon :
```bash,ignore
    diff <(ls foo) <(ls bar)
```
Cette commande montre la différence entre fichiers dans les répertoires foo et bar.

Puisque cela a été relativement rapide, voyons un exemple que montre quelques trucs qu'on peut
faire. Le script parcourra les arguments que nous lui donnerons, grep la chaîne foobar, et
l'ajoutera comme commentaire ci celle-ci est absente.
```bash,ignore
    #!/bin/bash
    
    echo "Début du programme à $(date)" # Date sera substituée
    
    echo "Exécution du program $0 avec $# arguments avec le pid $$"
    
    for fichier in $@; do
        grep foobar $fichier 2>&1 >/dev/null
        if [[ $? -ne 0 ]]; then
            echo "Le fichier $fichier ne contient pas le mot foobar, ajout en cours !"
            echo "# foobar" >> "$fichier"
        fi
    done
```
Dans le test de comparaison on teste si $? est égal à 0. Bash implémente de nombreuses comparaisons
de la sorte (voir man test). Dans un test on essaye généralement d'utiliser les doubles crochets,
les chances de faire des erreurs sont moindres. Même si cela n'est pas le standard POSIX.

Lors de l'exécution de scripts, on devra souvent fournir des arguments semblables. Bash rend les
choses plus faciles, "étendant" les expressions en supportant des expansions de nom de fichiers :

- Joker - On peut utiliser *?* et *\** pour respectivement vérifier 1 ou n'importe quel nombre de
  caractère. Par exemple, soit les fichiers *foo1* *foo2*, *foo10* et *bar*, la commande *rm foo?*
  supprimera *foo1* et *foo2* alors que *rm foo\** supprimera tout sauf *bar*.
- Accolades *{}* - Quand il existe une sous-chaîne commune dans une série de commandes, on peut
  utiliser les accolades pour étendre automatiquement. Cela peut-être pratique pour déplacer ou
  convertir des fichiers.

Exemples :
```bash,ignore
    convert image.{png,jpg}
    # Deviens
    convert image.png image.jpg
    
    cp /chemin/du/projet/{foo,bar,baz}.sh /nouveau_chemin
    #Deviens
    cp /chemin/du/projet/foo.sh /chemin/du/projet/bar.sh /chemin/du/projet/baz.sh /nouveau_chemin
    
    # On peut également combiner des jokers
    mv *{.py,.sh} repertoire
    
    mkdir foo bar
    # Après la création de ces 2 répertoire,
    # La commande ci-dessous créé les fichiers foo/a foo/b, ...foo/h, bar/a, bar/b, ...
    touch {foo, bar}/{a..h}
    touch foo/x bar/y
    # Montre la différence entre les fichiers contenus dans foo et ceux dans bar
    diff <(ls foo) <(ls bar)
    # Sors
    # < x
    # ---
    # > y
```
Les scripts ne doivent pas nécessairement être écrit en bash pour être exécuté depuis le terminal.
Exemple, ce script python qui inverse les arguments qu'on lui fournit :
```python,ignore
    #!/usr/local/bin/python
    import sys
    for arg in reversed(sys.argv[1:]):
        print(arg)
```
Le noyau sait exécuter ce script avec le bon interpréteur grâce à l'inclusion du sheebang (la
première ligne). C'est une bonne pratique que d'inclure les sheebangs en utilisant la commande *env*
(pour des question de portabilité) : *#!/usr/bin/env python* *env* permet de résoudre où se trouve
l'interpréteur via la variable d'environnement *PATH*.

> Note : Pour savoir où se trouve la commande exécutée dans le système de fichiers hiérarchique
standard, on peut utiliser la commande *which*.

Quelques différences entre les fonctions shell et les scripts shell à garder en tête sont :

- Les fonctions doivent être écrites dans le même langage shell, alors que les scripts n'ont pas
  cette contrainte. D'où l'utilité du sheebang.
- Les fonctions sont chargées une fois que leur définition est lue. Les scripts sont chargés à
  chaque exécution.
- Les fonctions sont exécutées dans le shell courant alors que les scripts exécutent leurs propres
  processus. Les fonctions peuvent donc modifier des variables d'environnement, par exemple changer
  le répertoire de travail. A ce titre, les scripts peuvent hériter de variables d'environnement si
  celles-ci ont été exportées précédemment à l'aide du mot-clef *export*.
- Comme avec n'importe quel langage de programmation, les fonctions sont des outils modulaires
  permettant une réutilisation et une meilleure clarté du code.
