## Processus et mécanismes de communication

### Algorithmes d'ordonnancement

L'ordonnanceur désigne le composant du noyau du système d'exploitation choisissant l'ordre d'exécution des processus sur les
processeurs d'un ordinateur.

Un processus a besoin de la ressource processeur pour exécuter des calculs ; il l'abandonne quand se produit une interruption,
etc. De nombreux anciens processeurs ne peuvent effectuer qu'un traitement à la fois. Pour les autres, un ordonnanceur reste
nécessaire pour déterminer quel processus sera exécuté sur quel processeur (c'est la notion d'affinité, très importante pour ne
pas dégrader les performances). Au-delà des classiques processeurs multicoeurs, la notion d'hyperthreading rend la question de
l'ordonnancement encore un peu plus complexe.

A un instant donné, il y a souvent davantage de processus à exécuter que de processeurs.

Un des rôles de système d'exploitation et plus précisément de l'ordonnanceur du noyau, est de permettre à tous ces processus de
s'exécuter à un moment ou un autre et d'utiliser au mieux le processeur pour l'utilisateur. Pour que chaque tâche s'exécute sans
se préoccuper des autres et/ou aussi pour exécuter les tâches selon les contraintes imposées au système, l'ordonnanceur du noyau
du système effectue des commutations de contexte de celui-ci.

A intervalles réguliers, le système appelle une procédure d'ordonnancement qui *élit* le prochain processus à exécuter. Si le
nouveau processus est différent de l'ancien, un changement de contexte (opération consistant à sauvegarder le contexte
d'exécution de l'ancienne tâche comme les registres du processeur) a lieu. Cette structure de données est généralement appelée
PCB (process control block). Le système d'exploitation restaure l'ancien PCB de la tâche élue, qui s'exécute alors en reprenant
là où elle s'était arrêtée précédemment.

Du choix de l'algorithme d'ordonnancement dépend le comportement du système. Il existe deux grandes classes d'ordonnancement :

* **L'ordonnancement en temps partagé** présent sur la plupart des ordinateurs "classiques". Par exemple l'ordonnancement
"decay" ; qui est celui par défaut sous Unix. Il consiste en un système de priorités adaptatives, par exemple il privilégie les
tâches interactives pour que leur temps de réponse soit bon. Une sous-classe de l'ordonnancement en temps partagé sont les
ordonnanceurs dits "proportional share", eux sont plus destinés aux stations de calcul et permettent une gestion rigoureuse des
ressources. On peut citer notamment "lottery" et "stride".
* **L'ordonnancement en temps réel** qui assure qu'une certaine tâche sera terminée dans un délai donné. Cela est indispensable
dans les systèmes embarqués. Un ordonnanceur temps réel est dit optimal pour un système de tâches s'il trouve une solution
d'ordonnancement du système lorsque cette solution existe. S'il ne trouve pas de solution à ce système, alors aucun autre
ordonnanceur ne peut en trouver une.

Algorithmes d'ordonnancement :

* **Round-robin (ou méthode du tourniquet)** : Une petite unité de temps appelé quantum de temps est définie. La file d'attente
est gérée comme une file circulaire. L'ordonnanceur parcourt cette file et alloue un temps processeur à chacun des processus
pour un intervalle de temps de l'ordre d'un quantum au maximum. La performance de round-robin dépend fortement du choix du
quantum de base.
* **Rate-monotonic scheduling (RMS)** : L'ordonnancement à taux monotone est un algorithme d'ordonnancement temps réel en ligne
à priorité constante (statique). Il attribue la priorité la plus forte à la tâche qui possède la plus petite période. RMS est
optimal dans le cadre d'un système de tâches périodiques, synchrones, indépendantes et à échéance sur requête avec un
ordonnanceur préemptif. De ce fait, il n'est généralement utilisé que pour ordonnancer des tâches vérifiant ces propriétés.
* **Earliest deadline first scheduling (EDF)** : C'est un algorithme d'ordonnancement préemptif à priorité dynamique, utilisé
dans les systèmes temps réels. Il attribue une priorité à chaque requête en fonction de l'échéance de cette dernière selon la
règle : Plus l'échéance d'une tâche est proche, plus sa priorité est grande. De cette manière, au plus vite le travail doit être
réalisé, au plus il a des chances d'être exécuté.
* **FIFO** : Les premiers processus ajoutés à la file seront les premières à être exécutés.
* **Shortest job first (SJF, ou SJN-Shortest Job Next)** : Le choix se fait en fonction du temps d'exécution estimé du
processus. Ainsi l'ordonnanceur va laisser passer en priorité le plus court des processus de la file d'attente.
* **Completely Fair Scheduler (CFS)** : L'ordonnanceur des tâches pour le noyau Linux. Il gère l'allocation de ressource
processeur pour l'exécution des processus, en maximisant l'utilisation globale CPU tout en optimisant l'interactivité. CFS
utilise un arbre rouge-noir implémentant une chronologie des futures exécutions des tâches. En effet, l'arbre trie les processus
selon une valeur representative du manque de ces processus en temps d'allocation du processeur, par rapport au temps qu'aurait
alloué un processeur dit multitâche idéal. De plus, l'ordonnanceur utilise une granularité temporelle à la nanoseconde, rendant
redondante la notion de tranche de temps, les unités atomiques utilisées pour le partage du CPU entre processus. Cette
connaissance précise signifie également qu'aucune heuristique (basée sur la statistique, donc pouvant commettre des erreurs)
n'est requise pour déterminer l'interactivité d'un processus.
