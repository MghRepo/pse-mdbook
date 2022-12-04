## Gestion des périphériques

### Bus

Un bus est un système de communication qui permet de transférer des données entre les composants d'un ordinateur ou entre
ordinateurs. Cette expression couvre tous les composants matériels (fils, fibre optique, etc.) et logiciels, protocoles de
communications inclus. Les bus informatiques modernes peuvent à la fois utiliser des connexions parallèles et séries avec hubs.
C'est par exemple le cas de l'USB.

Un bus d'adresses est un bus utilisé pour spécifier une adresse physique. Quand un processeur ou un périphérique bénéficiant
d'un accès direct à la mémoire (*DMA-enabled*) a besoin de lire ou d'écrire en mémoire, il spécifie en emplacement mémoire sur
le bus d'adresses (la valeur à lire ou à écrire est alors envoyé sur le bus de données). La largeur du bus d'adresse détermine
la quantité de mémoire qu'un système peut adresser.

Accéder un octet individuel requiert généralement d'écrire ou de lire une largeur de bus complète (un mot) à la fois. Dans ce
cas, les bits les moins signifiants du bus d'adresses peuvent même ne pas être implémentés - il revient en effet au contrôleur
d'isoler l'octet individuel demandé du mot complet transmis.
