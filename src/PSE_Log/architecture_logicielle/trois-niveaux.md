## Architecture logicielle

### Trois niveaux

Une *architecture à trois niveaux* ou *architecture trois tiers* ajoute un niveau supplémentaire à l'architecture à 2 niveaux,
permettant de spécialiser les serveurs dans une tâche précise, ce qui donne un avantage de flexibilité, de sécurité et de
performance :

* un client qui demande une ressource via une interface utilisateur chargée de la présentation de la ressource ;
* un serveur d'application (appelé middleware) qui fournit la ressource, mais en faisant appel aux ressources d'un autre serveur
;
* un serveur de données qui fournit au serveur d'application les ressources requises pour répondre au client.
