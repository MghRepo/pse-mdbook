## Virtualisation réseau

### Veth

Le périphérique veth (pour Ethernet virtuel) est un tunnel Ethernet virtuel. Les périphériques sont
créés par paire. Les paquets transmis sur un des périphérique de la paire sont immédiatement reçus
par l'autre périphérique. Lorsqu'un des deux périphérique est inactif, l'état du lien de la paire
est inactif.

On utilise une configuration veth lorsque des espaces de noms ont besoin de communiquer à l'espace
de nom de l'hôte principal ou entre chacun d'entre eux.
