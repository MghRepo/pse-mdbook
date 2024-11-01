## Architecture TCP/IP

La suite des protocoles internet est un modèle conceptuel et un ensemble de protocoles de
communication utilisés par internet et les réseaux informatiques similaires. Elle est connue plus
communément sous le nom d'architecture **TCP/IP** du fait que les protocoles sur lesquels elles
s'appuie sont, le protocole de contrôle de transmission (TCP) et le protocole internet (IP). Son
implémentation est une pile de protocoles.

La suite des protocoles internet fournit une communication de données bout en bout en spécifiant
comment la donnée doit être empaquetée, adressée, transmise, routée et reçue. Cette fonctionnalité
est organisée en quatre couches d'abstraction, qui classifient tous les protocoles rattachés en
fonction de l'étendue de leur implication réseau. De la couche la plus basse à la couche la plus
haute :

* **Liaison** : contient des méthodes de communications pour des données appartenant à un unique
  segment réseau (ou lien).
* **Réseau** : fournit l'interconnexion entre réseaux indépendants.
* **Transport** : gère la communication d'hôte à hôte.
* **Application** : fournit l'échange de données inter-processus pour les applications.

Les trois couches les plus hautes du modèle OSI, i.e. la couche application, présentation et
session, ne sont pas distinguées séparément dans l'architecture TCP/IP. Néanmoins il n'y a aucune
contrainte sur le fait que la pile de protocoles TCP/IP impose une architecture monolithique au
dessus de la couche transport. Par exemple le protocole applicatif NFS fonctionne au dessus du
protocole de présentation de représentation externe de données (XDR), qui lui-même s'appuie sur le
protocole d'appel de procedures distant (RPC). RPC fournit une transmission fiable des
enregistrements, de façon qu'il puisse utiliser le protocole de transport UDP de manière sûre.

La fonctionnalité de la couche session peut se retrouver dans des protocoles tels que HTTP et SMTP
et de manière encore plus évidente dans Telnet et le protocole d'initialisation de session (SIP). La
fonctionnalité de la couche session est également réalisée par la numérotation de port qui
appartient à la couche transport de la suite TCP/IP. Les fonctions de la couche présentation est
réalisée dans les applications TCP/IP à l'aide du standard MIME dans l'échange de données.
