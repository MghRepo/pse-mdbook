## Virtualisation et conteneurisation

### Orchestrateur Kubernetes

Kubernetes est un système d'orchestration de conteneurs open source permettant d'automatiser le
déploiement, la mise à l'échelle et la gestion d'applications informatiques.

Beaucoup de services de cloud offrent des plateformes ou infrastructures en tant que service (PaaS,
IaaS) basées sur Kubernetes sur lesquelles Kubernetes peut être déployé comme service fournisseur de
plateformes.

Kubernetes définit un ensemble de primitives, qui collectivement fournissent des mécanismes de
déploiement, de maintien et de mise à l'échelle d'applications basé sur les ressources CPU, mémoire
et autres métriques personnalisées. Kubernetes est lâchement couplé et extensible pour s'accorder à
différentes charges de travail. Cette extensibilité est fournit en grande partie par l'API
Kubernetes, utilisée par des composants internes ainsi que les extensions et conteneurs exécutés sur
Kubernetes. La plateforme exerce son contrôle sur les ressources de calcul et de stockage et
définissant ces ressources comme objets, ceux-ci pouvant par la suite être gérés comme tels.

Kubernetes suit l'architecture Maître-Esclave. Les composants de Kubernetes peuvent être divisés
entre ceux qui gèrent les noeuds individuels et ceux qui font partie du plan de contrôle.

Le maître Kubernetes est l'unité principale de contrôle du cluster, il gère la charge de travail et
dirige les communications à travers le système. Le plan de contrôle de Kubernetes consiste en divers
composants, chacun ayant sa propre tâche, pouvant être exécuté soit sur un simple noeud maître, soit
sur plusieurs maîtres pour des clusters à haute disponibilité. Les différents composants du plan de
contrôle Kubernetes sont les suivants :

* **etcd** : etcd est une base de données clef-valeur, légère, persistante et distribuée qui stocke
  de manière fiable les données de configuration du cluster, donnant une représentation de l'état
  global du cluster à l'instant t. *etcd* est un système qui favorise la cohérence à la
  disponibilité dans l'éventualité d'une partition réseau. Cette cohérence est cruciale pour
  ordonnancer correctement les services opérants. Le serveur de l'API Kubernetes utilise l'API de
  visualisation d'etcd pour surveiller le cluster et déployer des changements configuration
  critiques ou simplement restaurer n'importe quelle divergence d'état du cluster tels qu'il était
  déclaré par celui qui l'a déployé.
* **Le serveur d'API** : Le serveur d'API est un composant clé qui sert l'API Kubernetes via des
  JSON en HTTP, qui fournit à la fois les interfaces internes et externes à Kubernetes. Le serveur
  d'API traite et valide les requêtes REST et met à jour l'état des objets dans etcd, de fait
  permettant aux clients de configurer les charges de travail et les conteneurs à travers les
  noeuds.
* **L'ordonnanceur** : L'ordonnanceur est un composant qui, sur la base de la disponibilité
  ressource, sélectionne un noeud sur lequel s'exécute un pod non ordonnancé (entité de base géré
  par l'ordonnanceur). L'ordonnanceur suit l'usage ressource sur chacun des noeuds afin de s'assurer
  que la charge de travail n'est pas planifiée en excès de la ressource disponible. A cette fin,
  l'ordonnanceur doit connaître les conditions et disponibilités de la ressource et autres
  contraintes définies par l'utilisateur, les directives politiques telles que la qualité de
  service, les conditions d'affinité ou de non-affinité, la localisation des données etc. Le rôle de
  l'ordonnanceur est d'accorder la ressource disponible à la charge de travail demandée.
* **Le gestionnaire de contrôle** : Un contrôleur est une boucle de réconciliation qui amène l'état
  courant du cluster vers l'état désiré du cluster, en communicant via le serveur d'API pour créer,
  mettre à jour et supprimer les ressources qu'il gère (pods, services, extrémités, etc.). Le
  gestionnaire de contrôle est un processus qui gère un ensemble de contrôleurs du noyau Kubernetes.
  Un type de contrôleur est un contrôleur de réplication, qui s'occupe de la réplication et de la
  mise à l'échelle en exécutant un nombre de copies de pods spécifiées à travers le cluster. Il
  s'occupe également de créer des pods de remplacement, si les noeuds sous-jacents sont en erreur.
  D'autres contrôleurs qui sont une partie du noyau Kubernetes incluent le contrôleur DaemonSet pour
  exécuter exactement un pod sur chaque machine (ou sous-ensemble de machines), et un contrôleur de
  travail pour exécuter des pods jusqu'à fin d'exécution par exemple pour des traitements batchs.
  L'ensemble des pods qu'un contrôleur gère est déterminé par l'étiquette des sélecteurs faisant
  partie de la définition du contrôleur.

Un noeud, est une machine où des conteneurs (charge de travail) sont déployés. Chaque noeud à
l'intérieur du cluster doit exécuter un environnement d'exécution de conteneurs tel que Docker,
ainsi que les composants mentionnés ci-dessous, à des fins de communication avec le maître pour la
configuration réseau de ces conteneurs.

* **Kubelet** : Kubelet est responsable de l'état d'exécution de chaque noeud, il s'assure que tous
  les conteneurs du noeud sont sains. Il prend en charge le démarrage, l'arrêt et la maintenance des
  conteneurs d'application organisés en pods tels que l'a décidé le plan de contrôle. Kublet
  surveille l'état d'un pod, s'il n'est pas dans l'état désiré, le pod est redéployé sur le même
  noeud. Le statut du noeud est relayé sur une période de quelques secondes via des messages au
  maître. Si le maître détecte un échec de noeud, le contrôleur de réplication observe ce changement
  de statut et lance des pods sur d'autres noeuds sains.
* **Kube-proxy** : Le Kube-proxy est une implémentation d'un proxy réseau et d'un répartiteur de
  charge, il prend en charge l'abstraction de service ainsi que d'autres opérations réseau. Il est
  responsable du routage du traffic vers le conteneur approprié basé sur l'adresse IP et le numéro
  de port de la requête qui arrive.
* **Environnement** d'exécution de conteneur : Un conteneur réside dans un pod. Le conteneur est le
  niveau de micro-service le plus bas, qui contient l'application en cours d'exécution, les
  bibliothèques et leurs dépendances. Ils peuvent également avoir une adresse IP externe.

L'unité d'ordonnancement de base dans Kubernetes est un pod. Un pod est un groupement de composants
conteneurisés. Un pod consiste en un ou plusieurs conteneurs garantis de se trouver sur le même
noeud.

Chaque pod dans Kubernetes est assigné à une adresse IP unique à l'intérieur du cluster, permettant
aux applications d'utiliser des ports sans risques de conflits. A l'intérieur du pod, chaque
conteneur peut faire référence à chaque autre sur le localhost, mais un conteneur à l'intérieur d'un
pod n'a aucun moyen de s'adresser directement à un autre conteneur dans un autre pod ; pour cela, il
doit utiliser l'adresse IP du pod.

Un pod peut définir un volume, tel qu'un répertoire du disque local ou un disque réseau, et
l'exposer aux conteneurs du pod. Les pods peuvent être gérés manuellement via l'API Kubernetes, ou
leur gestion peut être déléguée à un contrôleur. De tels volumes sont aussi la base des
fonctionnalités Kubernetes de ConfigMaps (pour fournir un accès à la configuration à travers le
système de fichier visible au conteneur) et Secrets (pour fournir les certificats nécessaires à
l'accès sécurisé à des ressources distantes, en donnant uniquement aux conteneurs autorisés, ces
certificats sur leur système de fichier visible).

La fonction d'un ReplicaSet est de maintenir un ensemble stable de pods répliqués pouvant être
exécutés à tout moment. En tant que tel, il est souvent utilisé pour garantir la disponibilité d'un
nombre de pods identiques spécifique.

Les ReplicaSets est également un mécanisme de rassemblement qui permet à Kubernetes de maintenir
pour un pod donné un nombre d'instance défini à l'avance. La définition d'un ensemble de réplique
utilise un sélecteur, dont l'évaluation résulte en l'évaluation de tous les pods qui lui sont
associés.

Un service Kubernetes est un ensemble de pods travaillant de concert, tel une couche d'une
application multi-couche. L'ensemble de pods qui constitue un service sont définis par un sélecteur
d'étiquette. Kubernetes fournit deux modes de découverte de service, en utilisant des variables
d'environnement, ou en utilisant le DNS Kubernetes. La découverte de service assigne un adresse IP
fixe et un nom DNS au service, et réparti la charge du traffic en utilisant un DNS round-robin pour
les connexions réseaux à cette adresse IP au milieu des pods vérifiant ce sélecteur (même si des
erreurs peuvent amener les pods à passer d'une machine à une autre). Par défaut un service est
exposé à l'intérieur d'un cluster (par exemple les pods back-end peuvent être groupés en service,
recevant des requêtes de la part des pods front-end réparties entre eux), mais un service peut
également être exposé en dehors d'un cluster (par exemple pour que les clients puissent accéder aux
pods front-end).

Les systèmes de fichier dans le conteneur Kubernetes fournit par défaut un stockage éphémère. Cela
signifie qu'un redémarrage du pod effacera toute les données sur ces conteneurs, et par conséquent,
cette forme de stockage est, excepté dans le cas d'applications triviales, relativement limitante.
Un volume Kubernetes fournit un stockage permanent qui existe pendant la durée d'existence du pod
lui-même. Ce stockage peut également être utilisé comme disque partagé pour les conteneurs du pod.
Ces volumes sont montés à des points de montages spécifique à l'intérieur du conteneur définit par
la configuration du pod, et ne peuvent être montés aux autres volumes ou liés à ceux-ci. Le même
volume peut être monté à différent endroits dans l'arbre du système de fichiers par différents
conteneurs.

Kubernetes fournit un partitionnement des ressources qu'il gère dans des ensembles disjoints appelés
espace de noms. L'usage de ces espaces de noms est destiné aux environnements possédant un grand
nombre d'utilisateurs répartis dans plusieurs équipes, ou projets, ou même à séparer des
environnements tels que le développement, l'intégration et la production.

Un problème applicatif thématique est de décider ou stocker et gérer les informations de
configuration, dont certaines peuvent contenir des données sensibles. Les données de configuration
peuvent être relativement hétérogènes comme de petits fichiers de configurations individuels ou de
grands fichiers de configuration ou des documents JSON/XML. Kubernetes permet de traiter ce genre de
problème à l'aide de deux mécanismes assez proches : "configmaps" et "secrets", les deux permettent
des changements de configuration sans nécessiter la reconstruction de l'application. Les données de
configmaps et de secrets sont accessibles à chaque objets de l'instance de l'application auxquels
ils ont été liés au déploiement. Un secret et/ou un configmaps sont uniquement envoyé à un noeud si
un pod sur ce noeud le demande. Kubernetes le gardera en mémoire sur ce noeud. Un fois que le pod
qui dépend du secret ou de la configmap est supprimé, la copie en mémoire de tous les secrets et
configmaps liés est également supprimée. La donnée est accessible au pod de deux façons : en tant
que variables d'environnements (que Kubernetes créé lors du démarrage du pod) ou disponible dans le
système de fichier du conteneur visible dans le pod.

La donnée elle même est stockée sur le maître qui est hautement sécurisé et dont personne ne doit
avoir d'accès de connexion. La plus grande différence entre un secret et une configmap est que le
contenu de la donnée dans un secret est encodé en base 64. Il peut également être chiffré. Les
secrets sont souvent utilisés pour stocker des certificats, des mots de passe et des clefs ssh.

Il est très facile de réaliser une mise à l'échelle d'applications sans conditions d'état : Il
suffit d'ajouter plus de pods d'exécution - quelque chose que Kubernetes fait très bien. Les charges
de travail avec condition d'état sont bien plus difficiles, de fait que l'état doit être conservé si
un pod est redémarré, et si l'application doit être redimensionnée alors l'état devra possiblement
être redistribué. Les bases de données sont des exemples de charge de travail avec condition d'état.
Lors d'une exécution en mode haute disponibilité, beaucoup de bases de données ont la notion
d'instance primaire et d'instance(s) secondaires. Dans ce cas la notion d'ordonnancement d'instances
est important.
