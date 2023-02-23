## Éléments de sécurité

### Netfilter

Netfilter est un framework fournit par le noyau Linux et qui permet diverses opérations en lien avec
le réseau pouvant être implémentées sous la forme de gestionnaires configurables. Netfilter offre
plusieurs fonctions et opérations pour le filtrage des paquets, la traduction d'adresses et de ports
réseaux, ce qui fournit la fonctionnalité requise pour diriger les paquets à travers le réseau et
d'interdire à certains l'accès aux lieux sensibles d'un réseau.

Netfilter présente un ensemble de hooks à l'intérieur du noyau Linux, permettant à des modules du
noyau spécifiques d'enregistrer des fonctions de rappel avec la pile réseau du noyau. Ces fonctions
s'appliquent généralement au traffic sous forme de règles de modification et de filtrage qui sont
appelées pour chaque paquet qui traverse le hook respectif dans la pile réseau.

Nftables est un sous-système du noyau Linux et la nouvelle partie de Netfilter qui fournit la
classification et le filtrage des paquets réseaux. Elles sont disponibles depuis le noyau Linux
3.13. Nftables se substitue aux iptables, elles présentent les avantages d'une moindre réplication
du code et d'une plus grande simplicité d'extension pour de nouveaux protocoles. Nftables est
configuré via l'utilitaire d'espace utilisateur *nft*.

Nftables utilise les blocs de construction de l'infrastructure Netfilter, tels que les hooks
existant dans la pile réseau, la connexion au système de traçage, le composant d'enfilage de
l'espace utilisateur, et le sous-système de logs.

Le moteur du noyau nftables ajoute une machine virtuelle simpliste au noyau Linux, capable
d'exécuter un bytecode pour inspecter un paquet réseau et prendre les décisions concernant la
gestion de ce paquet. Elle peut obtenir des données de la part du paquet lui-même, regarder les méta
données associées (par exemple l'interface d'entrée), et gérer les données de traçage de connexions.
Les opérateurs de comparaison arithmétiques et bits à bits peuvent être utilisés pour prendre des
décisions en fonction de ces données. La machine virtuelle est aussi capable de réaliser des
manipulations sur des ensembles de données (typiquement des adresses IP), en permettant de remplacer
de multiples opérations de comparaisons par un ensemble d'inspections.

Nftables offre une API améliorée côté espace utilisateur qui permet des remplacements atomiques
d'une ou plusieurs règles pare-feu dans une seule transaction Netlink. Ceci accélère les changements
de configuration pare-feu pour les installations ayant de grands ensembles de règles ; cela peut
également permettre d'éviter des situations de compétition durant le changement de règle.
