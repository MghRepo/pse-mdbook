## Protocoles

### Couche application

* **DHCP** (*Dynamic Host Configuration Protocol*) : protocole des gestion réseau utilisé sur des réseaux IP, où un serveur DHCP
assigne dynamiquement des adresses IP et autres paramètres de configuration réseaux à chaque appareil, de façon à ce qu'ils
puissent communiquer avec d'autres réseaux IP. DHCP utilise le protocole UDP. (Port 67 pour le serveur, 68 pour le client)
* **DNS** (*Domain Name System*) : système de nommage dynamique et hiérarchisé pour appareils, services et autres ressources
connectées à Internet ou un réseau privé. DNS utilise UDP pour les requêtes de moins de 512 octets sinon il utilise TCP. (Port
53)
* **FTP** (*File Transfer Protocol*) : protocole réseau standard utilisé pour le transfert de fichiers depuis un serveur à un
client. FTP est construit sur un modèle d'architecture client-serveur en utilisant des connexions de contrôles et de données
séparées entre le client et le serveur. Les utilisateurs FTP peuvent s'authentifier eux-mêmes à l'aide d'un protocole
d'authentification en clair, généralement sous la forme d'un nom d'utilisateur et d'un mot de passe, mais ils peuvent se
connecter de manière anonyme si le serveur est configuré en ce sens. Pour des transmission sécurisées protégeant le nom
d'utilisateur et le mot de passe, et qui chiffrent le contenu, FTP est souvent sécurisé à l'aide de SSL/TLS (FTPS) ou bien
remplacé par le protocole de transfert de fichier SSH (SFTP). Le client FTP initie des connexions TCP selon différents modes.
(Port 21 pour le serveur)
* **HTTP** (*Hypertext Transfer Protocol*) : protocole de la couche application pour systèmes d'information distribués,
collaboratifs, hypermedia. HTTP est la base de la communication de données pour le World Wide Web, où des documents hypertextes
incluent des hyper liens pour d'autres ressources que l'utilisateur peut accéder facilement, par exemple par un click
utilisateur ou en tapant à l'écran dans un navigateur web. Le client initie une connexion TCP. (Port 80 ou 8080)
* **HTTPS** (*Hypertext Transfer Protocol Secure*) : est une extension de HTTP. Il est utilisé pour une communication sécurisé à
travers un réseau, et très largement répandu sur Internet. En HTTPS, le protocole de communication est crypté avec la sécurité
de la couche transport (TLS) ou, précédemment la couche de sockets sécurisée (SSL). Le protocole est par conséquent désigné
également par HTTP sur TLS, ou HTTP sur SSL. (Port 443)
* **IMAP** (*Internet Message Access Protocol*) : est un protocole Internet standard utilisé par les clients emails pour
récupérer les messages d'un serveur de messagerie à travers une connexion TCP/IP. (Port 143 et 993 pour IMAP sur SSL/TLS)
* **LDAP** (*Lightwight Directory Access Protocol*) : est un protocole applicatif standard permettant d'accéder et de maintenir
des répertoires de services d'information distribués à travers un réseau IP. Les répertoires de services jouent un rôle
important dans le développement des applications intranets et Internet en permettant le partage d'informations à propos
d'utilisateurs, de systèmes, de réseaux, de services, et d'applications à travers le réseau. LDAP utilise TCP et UDP. (Port 389
et 636 pour LDAP sur SSL/TLS)
* **NFS** (*Network File System*) : est un protocole de système de fichiers distribué qui permet à un ordinateur client
d'accéder à des fichiers à travers un réseau informatique. NFS comme de nombreux protocoles est construit au-dessus du protocole
ONC/RPC. NFS 3 et 4 utilisent le protocole TCP. (Port 2049 pour NFSv4)
* **NTP** (*Network Time Protocol*) : est un protocole qui permet de synchroniser l'horloge locale d'ordinateurs sur une
référence d'heure. NTP utilse UDP. (Port 123)
* **ONC/RPC** (*Open Networking Computing/Remote Procedure Call*) : est un système d'appel procedural distant. Il sérialise la
donnée à l'aide de la représentation de données externes (XDR), qui permet également le transcodage pour l'accès sur de
multiples plateformes. ONC délivre alors la charge XDR à l'aide des protocoles UDP ou TCP. (Port 111)
* **RIP** (*Routing Information Protocol*) : est un protocole de routage IP de type vecteur s'appuyant sur l'algorithme de
détermination des routes décentralisé Bellman-Ford. Il permet à chaque routeur de communiquer aux routeurs voisins. La métrique
utilisée est la distance qui sépare un routeur d'un réseau IP déterminé quant au nombre de sauts. RIP utilise UPD. (Port 520)
* **SIP** (*Session Initiation Protocol*) : est un protocole de signalisation utilisé pour initier, maintenir et terminer des
sessions en temps réel, qui inclut des applications de messageries, vocales et vidéo. Les clients SIP utilisent TCP ou UDP.
(Port 5060 et 5061 pour SIP sur SSL/TLS)
* **SMTP** (*Simple Mail Transfer Protocol*) : est un protocole de communication pour la transmission de mail. Les serveurs
mails et autres agents de transferts utilisent SMPT pour envoyer et recevoir des messages mails. Les serveurs SMTP utilisent le
protocole TCP. (Port 25)
* **SNMP** (*Simple Network Management Protocol*) : SNMP est un protocole Internet standard utiliser pour collecter et organiser
l'information liée aux appareils sur des réseaux IP et pour modifier cette information afin de définir un nouvel état de
fonctionnement. Les appareils qui typiquement supportent SNMP sont les modems, les routeurs, les switch, les serveurs, les
postes de travail, les imprimantes, etc. SNMP est utilisé très largement pour la gestion et la surveillance réseau. SNMP expose
la gestion des données sous la forme de variables sur les systèmes gérés organisées dans une base informationnelle de gestion
(MIB) qui décrit le statut de la configuration système. Ces variables peuvent être elles même requêtées à distance (et, dans
certaines circonstances manipulées) par des applications de gestion.
* **SSH** (*Secure Shell*) : est un protocole réseau cryptographique pour des service réseaux sécurisés opérants sur des réseaux
non-sécurisés. SSH utilise une architecture client-serveur en connectant un client SSH à un serveur. SSH utilise TCP. (Port 22)
* **TLS/SSL** (*Transport Layer Security/Secure Sockets Layer*) : sont des protocoles cryptographiques permettant des
communications sécurisées à travers un réseau. Le protocole TLS a pour but principal de garantir le caractère privé et
l'intégrité de la donnée entre deux applications communicantes ou plus. Une connexion entre un client et un serveur doit quand
elle est sécurisé par TLS avoir une ou plusieurs des propriétés suivantes :
    + La connexion est privée (ou sécurisée) par un algorithme cryptographique symétrique pour chiffrer les données transmises.
    Les clefs de cette encryption symmétrique sont générées de manière unique et à chaque connexion, elle sont créées à partir
    d'un secret partagé négocié au début de la session. Le serveur et le client négocient les détails de l'algorithme
    cryptographique utilisé avant que le premier octet de données soit échangé. La négociation du secret partagé est à la fois
    sécurisé (ne peut être attaqué à l'aide d'un connexion intermédiaire) et fiable (aucun attaquant ne peut modifier les
    communications pendant le processus de négociation sans être détecté).
    + L'identité des parties en communication peut être authentifiée via une clef cryptographique publique. Cette
    authentification est requise pour le serveur et optionnelle pour le client.
    + La connexion est fiable du fait que chaque message transmis inclus un message de vérification d'intégrité en utilisant un
    message de code d'authentification pour prévenir les pertes non-détectées ou l'altération des données durant la transmission.
En plus des propriétés ci-dessus, un configuration TLS peut fournir des propriétés de sécurisation supplémentaires telles que la
confidentialité persistante, assurant qu'aucune découverte future des clefs cryptographiques ne puisse être utilisée pour
déchiffrer une communication TLS enregistrée par le passé.
* **XDR** (*External Data Representation*) : est un standard de format de sérialisation de données qui se retrouve dans de
nombreux protocoles réseau.
