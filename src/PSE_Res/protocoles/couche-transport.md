## Protocoles

### Couche transport

* **TCP** (*Transmission Control Protocol*) : est un des principaux protocoles de la suite des protocoles internet. Il a été
développé à l'origine dans l'implémentation réseau initiale pour complémenter le protocole internet (IP). Par conséquent, la
suite entière est communément connue sous le nom d'architecture TCP/IP. TCP fournit des flux d'octets vérifiés ordonnés et
fiables entre applications s'exécutant sur des hôtes communiquant via un réseau IP. TCP est orienté connexion, et une connexion
entre client et serveur est établie avant qu'une donnée puisse être envoyée. Le serveur doit écouter (ouverture passive) les
requêtes de connexion des clients avant qu'une connexion soit établie. Un handshaking en trois temps (ouverture active), une
retransmission, et une détection d'erreurs permet une grande fiabilité mais ajoute de la latence. Les applications qui ne
requièrent pas un service de flux de données fiable peuvent utiliser le protocole datagramme utilisateur (UDP), qui fournit un
service datagramme sans connexion qui priorise le temps à la fiabilité. TCP permet d'éviter la congestion réseau. Néanmoins, le
TCP est vulnérable aux attaques de déni de service, au piratage de connexion, attaque par veto TCP et redémarrage de la
connexion.
* **UDP** (*User Datagram Protocol*) : est un des protocoles principals de la suite des protocoles internet. UDP utilise un
modèle de communication sans connexion très simple à l'aide d'un minimum de mécanismes protocolaires. UDP fournit des sommes de
vérification pour l'intégrité des données, et des numéros de ports pour adresser différentes fonctions au niveau de la source et
de la destination du datagramme. Il ne contient pas de dialogue d'handshaking et par conséquent expose le programme utilisateur
aux problèmes éventuels de fiabilité de la connexion réseau sous-jacente ; il n'y a aucune garantie de livraison, d'ordre ni de
double protection. Si une correction d'erreur est nécessaire au niveau de l'interface réseau, une application utilisera plutôt
le protocole de contrôle de transmission (TCP) ou le protocole de transmission de contrôle de flux (SCTP) implémentés pour cet
usage. UDP est adapté aux usages où ni les contrôles ni les corrections d'erreurs ne sont nécessaires ou sont à la charge de
l'application ; UDP évite la surchage d'un tel processus dans la pile de protocole. Les applications temporellement sensibles
utilisent souvent UDP du fait qu'il est souvent préférable d'oublier des paquets plutôt que d'attendre des paquets retransmis,
ce qui peut ne pas être une option dans un système temps réel.
* **DCCP** (*Datagram Congestion Control Protocol*) : est un protocole orienté message. DCCP implémente une mise en place de
connexion et une déconnexion fiables, une notification de congestion explicite (ECN), un contrôle de congestion, et des
fonctionnalités de négociations.
* **SCTP** (*Stream Control Transmission Protocol*) : est un protocole Internet standard il permet de garder les fonctionnalités
orientées message du protocole datagramme utilisateur (UDP), tout en assurant une fiabilité et un ordonnancement des messages
ainsi que des contrôles de congestion similaires au protocole de contrôle de transmission (TCP). Contrairement à UDP et TCP, le
protocole permet le multi-homing et la redondance des chemins afin d'augmenter la résilience et la fiabilité.
* **RSVP** (*Ressource Reservation Protocol*) : est un protocole utilisé pour réserver des ressources à travers un réseau en
utilisant un modèle de services intégrés. RSVP opère à travers des réseaux IP et fournit une installation initiée par le
receveur pour la réservation de ressources pour des flux de données unicast ou multicast. Il est similaire à un protocole de
contrôle comme le protocole de messages de contrôles internet (ICMP) ou le protocole de gestion de groupes internet (IGMP).
