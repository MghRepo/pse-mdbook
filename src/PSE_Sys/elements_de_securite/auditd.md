## Éléments de sécurité

### Auditd

Le cadriciel d'audit Linux fournit un profil de protection d'accès contrôlés (CAPP) qui collecte de manière fiable des
informations concernant des évènements pouvant être pertinent (mais pas forcément) pour la sécurité du système.

L'audit Linux permet de sécuriser le système en fournissant les moyens d'analyser ce qui se passe de façon très détaillé.
Néanmoins, il ne fournit pas de sécurité additionnelle en soit et ne protège pas le système de bogues ou de failles. Audit est
en revanche utile pour repérer ce genre de problèmes et ainsi d'aider à prendre les mesures de sécurité additionnelles pour les
prévenir.

Le cadriciel d'audit fonctionne en écoutant les évènements rapportés par le noyau et en les notant dans un fichier de log.

La commande *auditctl* permet de définir des règles permettant d'auditer les accès et les appels systèmes (ex. *chmod*). La
recherche et la détection d'anomalies se fait via les commandes *ausearch* et *aureport*.
