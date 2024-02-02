## Structures de données

### File

Une file est une structure de donnée basée sur le principe de "premier entré, premier sorti" (FIFO),
les premiers éléments ajoutés à la file seront les premiers à en être retirés.

Les files servent à organiser le traitement séquentiel des blocs de données d'origines diverses.

La théorie des files d'attente, élaborée pour le dimensionnement des réseaux téléphoniques, relie le
nombre d'usagers, le nombre de canaux disponibles, le temps d'occupation moyen du canal, et le temps
d'attente à prévoir (Loi de Poisson).

Cette structure est utilisée :

* en général, pour mémoriser temporairement des transactions qui doivent attendre pour être traitées
  ;
* les serveurs d'impression, qui traitent ainsi les requêtes dans l'ordre dans lequel elles
  arrivent, et les insèrent dans une file d'attente (spool) ; certains moteurs multitâches, dans les
  systèmes d'exploitation, qui doivent accorder du temps machine à chaque tâche, sans en privilégier
  aucune ;
* un algorithme de parcours en largeur utilise une file pour mémoriser les noeuds visités ;
* pour créer toutes sortes de mémoires tampons (*buffers*) ;
* En gestion des stocks les algorithmes doivent respecter la gestion physique des stocks pour
  assurer la cohérence physique/valorisation.

Voici les primitives communément utilisées pour manipuler les files. Il n'existe pas de
normalisation pour les primitives de manipulation de file. Leurs noms sont donc indiqués de manière
informelle :

* Enfiler (*Enqueue*) : ajouter un élément dans la file.
* Defiler (*Dequeue*) : renvoie le prochain élément de la file, et le retire de la file.
* "La file est-elle vide ?" (*IsNull*) : renvoie "vrai" si la file est vide, "faux" sinon.
* "Nombre d'élément dans la file" (*Length*) : renvoie le nombre d'élément dans la file.
