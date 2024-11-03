## Éléments de démarrage

### LUKS

LUKS est une spécification de chiffrement de disque. LUKS implémente un format sur disque standard
indépendant pour l'utilisation de divers outils. Cela permet une compatibilité et une
interopérabilité parmi différents programmes, mais s'assure également qu'ils implémentent une
gestion des mots de passe sécurisée et documentée.

LUKS utilise dm-crypt comme backend pour le chiffrement de disque.

> **Remarque** : Il existe également plusieurs systèmes de chiffrement du disque complet (ou
 pseudo-complet), on parle de FDE (*Hardware-based Full Disk Encryption*). Linux remplit en partie
 un ensemble de spécifications (*OPAL*) pour des SED (Self-Encrypting Disk).
