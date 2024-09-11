## Processus et mécanismes de communication

### Multitâche coopératif

Le multitâche coopératif est une forme simple de multitâche où chaque tâche doit explicitement
permettre aux autres tâches de s'exécuter. Cette approche simplifie l'architecture du système mais
présente plusieurs inconvénients :

* Le multitâche coopératif est une forme de couplage fort. Si un des processus ne redonne pas la
  main à un autre processus, par exemple si le processus est buggé, le système entier peut
  s'arrêter.
* Le partage de ressources (temps CPU, mémoire, accès disque, etc.) peut être inefficace.
