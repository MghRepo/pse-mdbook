## Processus et mécanismes de communication

### Multitâche préemptif

Le multitâche préemptif désigne la capacité d'un système d'exploitation à exécuter ou arrêter une
tâche planifiée en cours.

Un ordonnanceur préemptif présente l'avantage d'une meilleure réactivité du système et de son
évolution, mais l'inconvénient vient des situations de compétition (lorsque le processus d'exécution
accède à la même ressource avant qu'un autre processus (préempté) ait terminé son utilisation).

Dans un système d'exploitation multitâche préemptif, les processus ne sont pas autorisés à prendre
un temps non défini pour s'exécuter dans le processeur. Une quantité de temps définie est attribuée
à chaque processus ; si la tâche n'est pas accomplie avant la limite fixée, le processus est renvoyé
dans la pile pour laisser place au processus suivant dans la file d'attente, qui est alors exécuté
par le processeur. Ce droit de préemption peut tout aussi bien survenir avec des interruptions
matérielles.

Certaines tâches peuvent être affectées d'une priorité ; une tâche pouvant être spécifiée comme
"préemptible" ou "non préemptible". Une tâche préemptible peut être suspendue (mise à l'état
"ready") au profit d'une tâche de priorité plus élevée ou d'une interruption. Une tâche non
préemptible ne peut être suspendue qu'au profit d'une interruption. Le temps qui lui est accordé est
plus long, et l'attente dans la file d'attente plus courte.

Au fur et à mesure de l'évolution des systèmes d'exploitation, les concepteurs ont quitté la logique
binaire "préemptible/non préemptible" au profit de systèmes plus fins de priorités multiples. Le
principe est conservé, mais les priorités des programmes sont échelonnées.

Pendant la préemption, l'état du processus (drapeaux, registres et pointeurs d'instruction) est
sauvé dans la mémoire. Il doit être rechargé dans le processeur pour que le code soit exécuté à
nouveau : c'est la commutation de contexte.

Un système d'exploitation préemptif conserve en permanence la haute main sur les tâches exécutées
par le processeur, contrairement à un système d'exploitation non préemptif, ou collaboratif, dans
lequel c'est le processus en cours d'exécution qui prend la main et décide seul du moment où il la
rend. L'avantage le plus évident d'un système préemptif est qu'il peut en permanence décider
d'interrompre un processus, principalement si celui-ci échoue et provoque l'instabilité du système.
