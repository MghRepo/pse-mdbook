## Processus et mécanismes de communication

### Socket réseau

Une socket réseau est une structure logicielle comprise dans un noeud réseau qui sert de point
d'arrivée pour les données envoyées et reçues à travers le réseau. La structure et les propriétés
d'une socket sont définies par une interface de programmation (API) de l'architecture réseau. Les
sockets sont créées uniquement durant l'intervalle de temps d'un processus d'une application
s'exécutant dans le noeud.

Du fait de la standardisation des protocoles TCP/IP au cours du développement d'Internet, le terme
*socket réseau* est plus communément utilisé dans le contexte de la *Suite des protocoles
Internets*. On parle alors aussi de socket internet. Dans ce contexte, une socket est identifiée
extérieurement par les autres machines par son *adresse socket*, qui est la triade du protocole de
transfert, de l'adresse IP et du numéro de port.

Une pile de protocole, habituellement fournie par le système d'exploitation est un ensemble de
services permettant aux processus de communiquer à travers un réseau utilisant les protocoles que la
pile implémente. Le système d'exploitation fait passer les données utiles des paquets IP entrants à
l'application correspondante en lisant l'information de l'adresse socket des entêtes des protocoles
IP et transport et en enlevant ces entêtes des données applications.

L'interface de programmation que les programmes utilisent pour communiquer avec la pile de
protocole, utilisant les sockets réseaux, est appelée **socket API**. Les API sockets internet sont
généralement basées sur le standard socket de Berkeley. Dans le standard socket de Berkeley, les
socket sont une forme de descripteur de fichier (*read, write, open, close*).

Dans les protocoles internet standards TCP et UDP, une adresse socket est la combinaison d'une
adresse IP et d'un numéro de port. Les sockets n'ont pas besoin d'adresse source, mais si un
programme lie la socket à une adresse source, la socket peut être utilisée pour recevoir et envoyer
des données à cette adresse. Basé sur cette adresse, les sockets internet délivrent les paquets
applicatifs entrants au processus applicatif approprié.

Plusieurs types de sockets internet sont disponibles :

* **Datagram** : Des sockets non connectées, qui utilisent le protocole UDP (*User Datagram
  Protocol*). Chaque paquet envoyé ou reçu avec un socket datagramme est adressé et routé
  individuellement. L'ordre ainsi que la fiabilité ne sont pas garantis, par conséquent plusieurs
  paquets envoyés depuis un processus à un autre peuvent arriver dans n'importe quel ordre ou bien
  ne pas arriver du tout. Certaines configurations spéciales peuvent être requises pour envoyer en
  broadcast un socket datagramme.
* **Stream** : Des socket connectés, qui utilisent les protocoles TCP (*Transmission Control
  Protocol*), SCTP (*Stream Control Transmission Protocol*) ou DCCP (*Datagram Congestion Control
  Protocol*). Un socket flux fournit un flot de données sans erreurs, séquencé, unique et
  ininterrompu avec des mécanismes prédéfinis pour créer et détruire des connexions et rapporter des
  erreurs. Un socket flux transmet des données de manière fiable, ordonnée sans requérir
  l'établissement préalable d'un canal de communication.
* **Raw** : Permet l'envoie et la réception de paquets IP sans aucun formatage spécifique à un
  protocole de la couche transport. Avec les autres types de socket, la donnée est automatiquement
  encapsulée selon le protocole de la couche transport choisi (TCP, UDP etc.), et l'utilisateur du
  socket n'a pas connaissance de l'existence des entêtes du protocole. Quand on lit d'un socket
  brut, les entêtes sont généralement inclus. Lorsqu'on transmet des paquets depuis un socket brut,
  l'addition automatique d'une entête est optionnelle.
