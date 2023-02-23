## Administration SGBDR PostgreSQL

### Sécurité

PostgreSQL gère sa sa sécurité interne à l'aide de rôles. Un rôle peut généralement être un
utilisateur (un rôle pouvant se connecter), ou un groupe (un rôle duquel d'autres rôles sont
membres). Les permissions peuvent être accordées ou révoquées sur tout objet jusqu'au niveau des
colonnes, et peuvent également permettre/interdire la création de nouveaux objets au niveau de la
base de données, du schéma ou de la table.

La fonctionnalité PostgreSQL SECURITY LABEL permet un sécurité additionnelle; avec un module
chargeable inclus permettant un contrôle d'accès obligatoire d'étiquettes (MAC) basé sur la
politique de sécurité SELinux.

PostgreSQL supporte nativement un large panel de mécanismes externes d'authentification, tels que :

* Mot de passe : soit SCRAM-SHA-256, soit MD5, soit en clair
* GSSAPI
* SSPI
* Kerberos
* ident (relie utilisateur système et utilisateur base de données par serveur ident)
* peer (relie utilisateur local et utilisateur base de données)
* LDAP
    + AD
* RADIUS
* Certificat
* PAM

Les méthodes par GSSAPI, SSPI, Kerberos, pees, ident et certificats peuvent également spécifier un
fichier "map" qui liste quels utilisateurs vérifiés par le système d'authentification sont autorisés
à se connecter spécifiquement en tant qu'utilisateur de base de données.

Ces méthodes sont spécifiées dans le fichier de configuration d'authentification de groupe basé sur
l'hôte (*pg_hba.conf*), qui détermine quelles connexions sont autorisées. Cela permet un contrôle
sur quel utilisateur peut se connecter à quelle base de données, depuis quelle adresse IP,
intervalle d'adresse IP ou domaine socket, avec quel système d'authentification, et si la connexion
doit utiliser la couche de transport de sécurité (TLS)
