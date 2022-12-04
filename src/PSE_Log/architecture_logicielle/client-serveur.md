## Architecture logicielle

### Client serveur

Le modèle client serveur est une structure d'application distribué qui sépare les tâches ou charges de travail entre
fournisseurs de ressource ou service, appelés serveurs, et les demandeurs de ce service, appelés clients. Les clients et les
serveurs communiquent souvent à travers un réseau informatique sur des matériels séparés, mais les deux peuvent également se
trouver sur la même machine. Un serveur hôte exécute un ou plusieurs programmes serveurs, qui partagent leurs ressources avec
des clients. Un client ne partage habituellement aucune de ses ressources, mais demande le contenu ou le service au serveur. Par
conséquent, les clients initient la session de communication avec les serveurs, qui attendent les requêtes entrantes.

La caractéristique client-serveur décrit la relation de programmes coopérants dans une application. Le composant serveur fournit
une fonction ou un service à un ou plusieurs clients, qui initient des requêtes pour de tels services. Les serveurs sont
classifiés en fonction du service qu'ils fournissent. Par exemple, un serveur web, sert des pages web pour un serveur de fichier
qui sert des fichiers informatiques. Une ressource partagée peut être n'importe quel composant électronique ou logiciel
informatique du serveur, des programmes et des données aux processeurs et périphériques de stockages. Le partage des ressources
d'un serveur constitue un *service*.

La condition si un ordinateur est un client, un serveur ou les deux, est déterminé par la nature de l'application qui demande
les fonctions du service. Par exemple, un seul ordinateur peut exécuter un serveur web et un logiciel serveur de fichier en même
temps pour servir différentes données aux clients effectuant diverses requêtes. Le logiciel client peut aussi communiquer avec
un logiciel serveur sur le même ordinateur. La communication entre serveurs tel que la synchronisation de données, est quelques
fois appelée communication inter-serveur ou serveur à serveur.

En général, un service est une abstraction de ressources informatiques et un client n'a pas à être concerné du comment le
serveur procède tandis qu'il exécute la requête et livre la réponse. Le client doit uniquement comprendre la réponse selon les
protocoles applicatifs connus, i.e. le contenu et le formatage de la donnée pour le service requis.

Les clients et les serveurs échangent des messages à l'aide du motif de messagerie requête-réponse. Le client envoie une
requête, et le serveur retourne une réponse. Cet échange de message est un exemple de communication inter-processus. Pour
communiquer, les ordinateurs doivent avoir un langage commun, et doivent suivre des règles communes qui doivent être définis
dans le protocole de communications. Tous les protocoles client-serveur opère au niveau de la couche application. Le protocole
de la couche application définit des motifs basiques de dialogue. Pour formaliser un peu plus loin l'échange de données, le
serveur peut implémenter une interface de programmation applicative (API). L'API est une couche d'abstraction permettant
d'accéder un service. En restreignant la communication à des contenus formatés spécifiquement, cela facilite l'analyse
syntaxique. En rendant l'accès à la donnée abstrait, on facilite l'échange de données inter-plateformes.

Un serveur peut recevoir de multiples clients distincts sur une période de temps très courte. Un ordinateur peut uniquement
exécuter un nombre limité de tâches à la fois, et s'appuie sur l'ordonnanceur système pour prioriser les requêtes entrantes des
clients pour les traiter. Afin de prévenir les abus et une disponibilité maximale, le logiciel serveur peut limiter la
disponibilité aux clients. Les attaques de déni de service sont conçues pour exploiter les obligations du serveur à traiter des
requêtes en le surchargeant avec un taux de requêtes excessif. Le chiffrement doit être mis en place si des données sensibles
sont communiquées entre le client et le serveur.
