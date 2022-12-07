## Éléments de sécurité

### SELinux

SELinux (*Security Enhanced Linux*) est un module de sécurité du noyau Linux qui fournit des politiques de sécurité de contrôle
d'accès, dont le contrôle d'accès obligatoire (MAC) en addition au contrôle d'accès discrétionnaire existant (DAC). SELinux
répond fondamentalement aux questions telles que :

"Est-ce que **le sujet** peut faire cette **action** à cet **objet** ?" e.g : "Est-ce qu'un serveur web peut accéder aux
fichiers dans le répertoire home des utilisateurs ?"

Un noyau Linux intégrant SELinux impose des politiques de contrôles d'accès obligatoire qui confinent les programmes
utilisateurs et les services systèmes, ainsi que les accès aux fichiers et aux ressources réseaux. Limiter les privilèges au
minimum requis pour fonctionner réduit ou élimine les capacités de ces programmes et daemons à causer des dommages si ceux-ci
sont compromis ou défaillants (par exemple via des dépassements de tampons ou des mauvaises configurations). Ce mécanisme de
confinement fonctionne indépendamment des mécanismes de contrôle d'accès discrétionnaire traditionnels de Linux. Le concept de
super utilisateur n'existe pas, et ne partage pas les raccourcis bien connus des mécanismes de sécurité traditionnels, tel
qu'une dépendance aux binaires setuid/setgid.

Lorsqu'une application ou un processus, reconnu comme un sujet, effectue une requête d'accès à un objet, tel qu'un fichier,
SELinux vérifie à l'aide d'un cache de vecteur d'accès (AVC), où les permissions des sujets et des objets sont mises en cache.

Si SELinux ne trouve pas matière à trancher à propos de cet accès dans le cache, il envoie une requête au serveur de sécurité.
Le serveur de sécurité vérifie le contexte de sécurité de l'application ou du processus et du fichier. Le contexte de sécurité
est appliqué depuis la base de données de politiques SELinux. La permission est donnée ou refusée.

Si la permission est refusée, un message "avc: denied" sera visible dans */var/log.messages*.

Chaque processus et ressource système a une étiquette spéciale de sécurité appelée contexte SELinux. Un contexte SELinux est un
identifiant qui s'abstrait des détails du systèmes et se concentre sur les propriétés de sécurité de l'objet. Cela permet un
référencement des objets cohérent dans la politique SELinux mais supprime également toute ambigüité que l'on peut retrouver avec
d'autres méthodes d'identification ; par exemple, un fichier peut avoir plusieurs noms de chemins valides sur un système qui
utilise des montages liés.

La politique SELinux utilise ces contextes dans une série de règles qui définissent comment un processus peut interagir avec les
autres ainsi que les différentes ressources systèmes. Par défaut, la politique ne permet aucune interaction à moins qu'une règle
explicite en permette l'accès.

Le contexte SELinux contient plusieurs champs : utilisateur, role, type, et niveau de sécurité. L'information du type SELinux
est sans doute la plus importante quand il s'agit de la politique SELinux, du fait que la règle la plus commune de la politique
SELinux qui définit les interactions autorisées entre les processus et les ressources systèmes utilise les types SELinux et non
le contexte en entier. Le type SELinux finit habituellement par *_t* (e.g. *httpd_t*).
