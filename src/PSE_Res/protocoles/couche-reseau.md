## Protocoles

### Couche réseau

* **IPv4** (*Internet Protocol v.4*) : est le principal protocole de communication de la suite des
  protocoles internet en relayant des datagrammes à travers les frontières de réseaux. Ces fonctions
  de routage permettent l'agrégation de réseaux, qui établit essentiellement Internet. IP a pour
  fonction de livrer des paquets depuis un hôte source à un hôte destination uniquement via
  l'adresse IP contenue dans l'entête. A cette fin, IP définit des structures de paquets qui
  encapsulent la donnée à envoyer. Le protocole définit également les méthodes d'adressage utiliser
  pour étiqueter le datagramme des informations concernant la source et la destination. IPv4 utilise
  des adresses de 32-bits qui fournissent un peu plus de 4 milliards d'adresses. Néanmoins une
  grande partie de ces adresses est réservée pour des méthodes réseaux spéciales.
* **IPv6** (*Internet Protocol v.6*) : est la version la plus récente du protocole internet (IP).
  IPv6 a été développé pour résoudre le problème d'épuisement du nombre d'adresse IPv4. IPv6 utilise
  des adresses de 128-bits soit 3,4.10^38 adresses. Les deux protocoles ne sont pas interopérable,
  de fait aucune communication entre eux n'est possible. IPv6 fournit d'autres avantages techniques
  en plus du plus grand espace d'adressage. En particulier, il permet des méthodes d'allocation
  d'adresses hiérarchiques qui facilite l'agrégation de routes à travers Internet, limitant
  l'expansion des tables de routage. L'usage de l'adressage multicast est étendu et simplifié, il
  contient également d'autres optimisations pour la livraison de services. La mobilité des
  appareils, la sécurité, et la configuration ont été considérés lors de la création du protocole.
* **ICMP** (*Internet Control Message Protocol*) : est un protocole de la suite des protocoles
  internet utilisé par les matériels d'interconnexion pour envoyer des messages d'erreurs et autres
  informations opérationnelles indiquant la réussite ou l'échec lors d'une communication avec une
  autre adresse IP. ICMP n'est pas utilisé pour envoyer des données applicatives entre systèmes (à
  part pour des outils de diagnostics tels ping et traceroute).
* **ECN** (*Explicit Congestion Notification*) : est une extension du protocole internet (IP) et du
  protocole de contrôle de transmission (TCP). ECN permet la notification bout en bout d'une
  congestion réseau sans oublis de paquets. ECN est une fonctionnalité optionnelle.
* **IGMP** (*Internet Group Management Protocol*) : est un protocole de communication entres hôtes
  et routeurs adjacents pour établir une appartenance à des groupes de multicasts. IGMP fait partie
  du multicast IP et permet au réseau de diriger les transmissions multicasts uniquement aux hôtes
  qui les ont demandées.
* **IPsec** (*Internet Protocol Secure*) : est une suite de protocoles réseau sécurisée qui
  authentifie et chiffre les paquets de données pour fournir une communication sécurisée à travers
  un réseau IP. Elle est utilisé par les réseaux privés virtuels (VPN).
