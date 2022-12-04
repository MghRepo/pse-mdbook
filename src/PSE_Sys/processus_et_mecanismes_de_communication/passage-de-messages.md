## Processus et mécanismes de communication

### Passage de messages

Le modèle de passage de messages et une technique permettant de demander l'exécution d'un programme. Le passage de message
utilise un modèle objet afin de distinguer la fonction générale de ses implémentations spécifiques. Le programme appelant envoie
un message et se fie à l'objet afin de sélectionner et d'exécuter le code approprié. L'utilisation d'une couche intermédiaire,
est justifiée par des besoins de distribution et d'encapsulation.

L'encapsulation suit l'idée que les objets logiciels devraient être capables d'invoquer les services d'autres objets sans avoir
aucune connaissance spécifique de leurs implémentations. L'encapsulation permet de réduire les lignes de codes ainsi qu'une plus
grande maintenabilité des systèmes.

Le passage de messages distribué permet au développeur, à l'aide d'une couche fournissant les services de base de construire des
systèmes constitués de sous-systèmes s'exécutant sur des ordinateurs disparates, à différents endroit et à des horaires
différents. Lorsqu'un objet distribué envoie un message, la couche message s'occupe de :

* Trouver d'où et de quel processus le message est issu.
* Sauvegarder le message dans une file si l'objet approprié au traitement du message n'est pas en cours d'exécution et s'occuper
de l'envoyer dès que l'objet est disponible. Ainsi que de stocker le résultat si besoin, jusqu'à ce que l'objet qui a envoyé le
message est prêt à le recevoir.
* Contrôler diverses dépendances transactionnelles pour les transactions distribuées.
