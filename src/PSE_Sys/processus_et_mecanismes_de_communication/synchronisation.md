## Processus et mécanismes de communication

### Synchronisation

En programmation concurrente, la synchronisation se réfère à deux concepts distincts mais liés : la
synchronisation de processus et la synchronisation des données. La synchronisation de processus est
un mécanisme qui vise à bloquer l'exécution de certains processus à des points précis de leur flux
d'exécution, de manière que tous les processus se rejoignent à des étapes relais données, tel que
prévu par le programmeur. La synchronisation de données, elle, est un mécanisme qui vise à conserver
la cohérence des données telles que vues par différents processus, dans un environnement multitâche.
Initialement, la notion de synchronisation est apparue pour la synchronisation de données.

Ces problèmes dits "de synchronisation" et même plus généralement ceux de communication
inter-processus dont ils dépendent rendent pratiquement toujours la programmation concurrente plus
difficile. Certaines méthodes de programmation, appelées synchronisation non-blocante, cherchent à
éviter d'utiliser des verrous, mais elles sont encore plus difficiles à mettre en oeuvre et
nécessitent la mise en place de structure de données particulières. La mémoire transactionnelle
logicielle en est une.

La synchronisation de processus cherche par exemple à empêcher des programmes d'exécuter la même
partie de code en même temps, ou au contraire forcer l'exécution de deux partie de code en même
temps. Dans la première hypothèse, le premier processus bloque l'accès à la section critique avant
d'y entrer et libère l'accès après y être sorti. Ce mécanisme peut être implémenté de multiples
manières.

Ces mécanismes sont par exemple la barrière de synchronisation, l'usage conjoint des sémaphores et
des verrous, les spinlock, le moniteur.

* **Barrière de synchronisation** : Permet de garantir qu'un certain nombre de tâches aient passé un
  point spécifique. Ainsi, chaque tâche qui arrivera sur cette barrière devra attendre jusqu'à ce
  que le nombre spécifié de tâches soient arrivées à cette barrière.
* **Sémaphore** : Variable partagée par différents "acteurs" qui garantit que ceux-ci ne peuvent
  accéder de façon séquentielle à travers des opérations atomiques, et constitue la méthode utilisée
  couramment pour restreindre l'accès à des ressources partagées et synchroniser les processus dans
  un environnement de programmation concurrente.
* **Verrous** : Permet d'assurer qu'un seul processus accède à une ressource à un instant donné. Un
  verrou peut être posé pour protéger un accès en lecture et permettra à plusieurs processus de
  lire, mais aucun d'écrire. On dit alors que c'est un verrou partagé. Un verrou est dit exclusif
  lorsqu'il interdit toute écriture et toute lecture en dehors du processus qui l'a posé. La
  granularité d'un verrou constitue l'étendue des éléments qu'il protège. Par exemple dans les bases
  de données, un verrou peut être posé sur une ligne, un lot de ligne, une table etc.
* **Spinlocks** : Mécanisme simple de synchronisation basé sur l'attente active.
* **Moniteur** : Mécanisme de synchronisation qui permet à plusieurs threads de bénéficier de
  l'exclusion mutuelle et la possibilités d'attendre (*block*) l'invalidation d'une condition. Les
  moniteurs ont également un mécanisme qui permet aux autres threads de signaler que leur condition
  est validé. Il est constitué d'un mutex et de variables conditionnelles.

La connaissance des dépendances entre les données est fondamentale dans la mise en oeuvre
d'algorithmes parallèles, d'autant qu'un calcul peut dépendre de plusieurs calculs préalables. Les
*conditions de Bernstein* permettent de déterminer les conditions sur les données lorsque deux
parties de programme peuvent être exécutées en parallèle.
