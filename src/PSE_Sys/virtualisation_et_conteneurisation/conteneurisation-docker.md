## Virtualisation et conteneurisation

### Conteneurisation Docker

Docker est un ensemble de produits de Plateforme en tant que Service qui utilise la virtualisation
au niveau du système d'exploitation pour livrer des logiciels dans des paquets appelé conteneurs.
Les conteneurs sont isolés les uns des autres et embarquent leurs propres logiciels, bibliothèques
et fichiers de configuration ; ils peuvent communiquer entre eux à travers des canaux bien définis.
Tous les conteneurs sont exécuté par un noyau de système d'exploitation unique et par conséquent
utilisent moins de ressources que des machines virtuelles.

Docker peut empaqueter une application et ses dépendances dans un conteneur virtuel qui peut
s'exécuter sur n'importe quel ordinateur Linux, Windows, ou macOS. Ceci permet à l'application de
s'exécuter dans toute une variété d'environnement, par exemple, sur sa propre machine, dans un cloud
public ou privé. Quand il s'exécute sur Linux, Docker utilise les mécanismes d'isolation fournis par
le noyau (tels que les cgroups et les espaces de noms) et les systèmes de fichiers capables de
montage en union, pour permettre aux conteneurs de s'exécuter sur une instance Linux unique, évitant
la surcharge du démarrage et de la maintenance de machines virtuelles.

Le support des espaces de nom du noyau Linux permet d'isoler l'environnement système de la vue de
l'application comme l'arbre des processus, le réseau, les identifiants utilisateurs et les systèmes
de fichiers montés, tandis que les cgroups fournissent la limitation de ressources mémoire et CPU.
Docker inclut également sa propre bibliothèque *libcontainer* permettant d'accéder directement les
fonctions de virtualisation fournies par le noyau Linux en plus de l'utilisation d'interfaces de
virtualisation telles que *libvirt*, *LXC* et *systemd-nspawn*.

Docker implémente une API de haut niveau pour fournir des conteneurs légers exécutant des processus
isolés.

Le logiciel Docker en tant qu'offre de services consiste en trois composants :

* **Le Logiciel** : Le daemon Docker, *dockerd*, est un processus persistant qui gère les conteneurs
  Docker ainsi que les objets du conteneur. Le daemon est à l'écoute des requêtes envoyés via l'API
  du Docker Engine. Et le programme client *docker* fournit une interface de ligne de commande qui
  permet d'interagir avec le daemon.
* **Les objets** : Les objets docker sont des entités diverses utilisées pour assembler une
  application dans Docker. Les classes principales des objets Dockers sont les images, les
  conteneurs et les services.
    + Un conteneur Docker est un environnement encapsulé, standardisé qui exécute des applications.
      Un conteneur est géré à travers l'API Docker ou la ligne de commande.
    + Une image Docker est un modèle en lecture seule utilisée pour construire des conteneurs. Les
      images sont utilisées pour stocker et envoyer des applications.
    + Un service Docker permet une mise à l'échelle des conteneurs sur de multiples daemons. Ceci
      étant appelé une nuée (*swarm*), un ensemble de daemon coopérant, communiquant à travers l'API
      Docker.
* **Les registres** : Un registre Docker est un dépôt d'image Docker. Les clients Docker se
  connectent aux registres pour cloner (*pull*) des images à utiliser ou déposer (*push*) des images
  qu'ils ont construites. Les dépôts peuvent être publics ou privés. Les deux principaux dépôts
  publics sont Docker Hub et Docker Cloud. Docker Hub est le registre par défaut ou Docker recherche
  des images. Des registres Docker permettent également la création de notifications basée sur des
  évènements.

Le logiciel Docker dispose également d'outils :

* **Docker Compose** qui est un outil qui permet de définir et d'exécuter des applications Docker
  multi-conteneurs. Il utilise des fichier YAML pour configurer les services de l'application et
  créé et démarre les processus de tous les conteneurs à l'aide d'une seule commande. L'interface en
  ligne de commande *docker-compose* permet aux utilisateurs de passer des commandes sur des
  ensembles de conteneurs, par exemple pour construire des images, déployer des conteneurs,
  redémarrer des conteneurs, etc. Les commandes liées à la manipulation d'image, ou les options
  interactives sont inutiles dans Docker Compose car elle s'adressent à un conteneur unique. Le
  fichier docker-compose.yml est utiliser pour définir les services de l'application et inclut
  plusieurs options de configuration. Par exemple, l'option *build* définit les options de
  configuration telles que le chemin du Dockerfile, l'option *command* permet de surcharger les
  commandes Docker par défaut, etc.
* **Docker Swarm** fournit nativement un fonctionnalité de grappe pour les conteneurs Docker qui
  transforme un groupe de Docker engine en un unique Docker engine virtuel. L'interface ligne de
  commande *docker swarm* permet aux utilisateurs d'exécuter des conteneurs Swarm, de créer des
  mots-clefs, lister les noeuds de la grappe, etc. L'interface ligne de commande *docker node*
  permet aux utilisateurs d'exécuter diverses commandes pour gérer des noeuds dans la nuée, par
  exemple, lister les noeuds de la nuée, mettre à jour les noeuds, supprimer les noeuds d'une nuée.
  Docker gère les nuées en utilisant l'algorithme de consensus Raft. Selon Raft, pour qu'une mise à
  jour se fasse, la majorité des noeuds de la nuée doivent s'accorder sur celle-ci.
