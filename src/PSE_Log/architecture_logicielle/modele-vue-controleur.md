## Architecture logicielle

### Modèle-Vue-Contrôleur

Modèle-vue-contrôleur est un motif d'architecture typique utilisé afin de développer des interfaces utilisateur qui sépare la
logique liée du programme en trois éléments inter-connectés. Cela est réalisé en séparant les représentations internes de
l'information des façons dont l'information est présentée et acceptée par l'utilisateur.

Beaucoup de langages de programmation disposent de quadriciels MVC qui facilitent son implémentation.

Les trois composants du motifs sont :

* **Le modèle** : Le composant central. Il s'agit de la structure de données dynamique de l'application, indépendant de
  l'interface utilisateur. Il gère directement la donnée, la logique et les règles de l'application. Il reçoit l'entrée
  utilisateur du contrôleur.

* **La vue** : Une représentation de l'information (un graphique, un diagramme ou une table). Plusieurs vues de la même
  information sont possibles. C'est la présentation du modèle.

* **Le contrôleur** : Accepte et optionnellement valide les entrées pour le modèle. Il permet l'exécution des intérations sur
  les objets du modèle de données.
