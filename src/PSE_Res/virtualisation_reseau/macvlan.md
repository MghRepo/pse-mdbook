## Virtualisation réseau

### MACVLAN

De la même manière que VLAN permet de créer de multiples interfaces au dessus d'une seule au niveau
3 et de filtrer les paquets à l'aide d'une étiquette, MACVLAN permet de séparer le traffic de niveau
2 en créant de multiples interfaces (Ethernet MAC) sur une seule.

Cela permet de simplifier certains cas d'usage notamment dans le cadre de l'utilisation de
multiples machines virtuelles sur un hôte en se passant de ponts et en reliant directement les
espaces de nom réseau.

Il existe 5 types de MACVLAN :

1. **Privé** : Interdit la communication entre instances MACLAN sur la même interface physique.
2. **VEPA** :  La donnée est transmise d'une instance MACVLAN à une autre sur la même interface
   physique.
3. **Pont** : Toutes les terminaisons sont connectées avec un simple pont via l'interface physique.
4. **Perméable** : Permet à une VM unique d'être connecté directement à l'interface physique.
5. **Source** : Permet de filtrer le traffic selon une liste d'adresses sources pour créer des
   associations.

Le type pont est le plus communément utilisé.
On utilise notamment MACVLAN pour se connecter depuis des conteneurs à un réseau physique.
