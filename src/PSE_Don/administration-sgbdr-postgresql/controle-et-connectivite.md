## Administration SGBDR PostgreSQL

### Contrôle et connectivité

PostgreSQL peut se connecter à d'autres systèmes pour récupérer des données via des encapsulateurs de données étrangères (FDWs).
Ils peuvent prendre la forme de n'importe quelle source de données, telle qu'un système de fichier, un autre SGBDR, ou un
service web. Cela signifie que des requêtes classiques de base de données peuvent utiliser ces sources de données comme des
tables, et même joindre ensemble plusieurs sources de données.

Pour se connecter à des applications, PostgreSQL inclus l'interface libpq (l'interface d'applications C officielle) et ECPG (un
système C embarqué). Des bibliothèques tierces pour se connecter à PostgreSQL sont disponibles pour de nombreux langages de
programmation.

Des langages procéduraux permettent aux développeurs d'étendre la base de donnée à l'aide de fonctions personnalisées, souvent
appelées **procédures stockées**. Ces fonctions peuvent être utilisées pour construire des déclencheurs de base de données
(fonctions invoquées suite à la modification d'une donnée particulière), des types de données personnalisés et des fonctions
d'agrégations. Des langages procéduraux peuvent également être invoqués sans définir de fonction en utilisant une commande DO au
niveau du SQL.

Les langages sont divisés en deux groupes : les procédures écrites en langage sûr sont exécutées dans des bacs à sable et
peuvent être créées et utilisées par n'importe quel utilisateur. Les procédure écrites en langage non sûr sont uniquement créées
par des super utilisateurs, du fait qu'elles permettent un court circuit des restrictions de sécurité de la base de données,
mais également d'accéder à des ressources externe à la base de données. Quelques langages tel que Perl fournissent à la fois des
versions sûre et non sûres.

PostgreSQL fournit un support pour trois langages procéduraux :

* SQL (sûr). Des fonctions SQL plus simple peuvent être étendues dans une requête appelante, qui évite la surcharge à l'appel
de fonction et permet à l'optimiseur de requête de "voir à l'intérieur" de la fonction.
* Langage procédural PostgreSQL (PL/pgSQL)(sûr), qui ressemble au langage procédural Oracle pour langage procédural SQL (PL/SQL)
et les modules stockés persistants SQL (SQL/PSM).
* C (non sûr), qui permet de charger une ou plusieurs bibliothèques partagées personnalisées en base de données. Les fonctions
écrites en C offrent une meilleure performance, mais un bogue dans le code peut faire tomber et corrompre la base de données.
La plupart des fonctions incluses sont écrites en C.

De plus, PostgreSQL permet aux langages procéduraux d'être chargés en base de données à l'aide d'extensions. Trois extensions
sont incluses dans PostgreSQL pour Perl, Tcl et Python.

Des déclencheurs sont des évènements déclenchés par l'action de déclarations de langage de manipulation de données SQL (DML). La
plupart des déclencheurs sont activés uniquement pour des déclarations INSERT ou UPDATE.

Les déclencheurs peuvent être liés à des tables. Ils peuvent être par colonnes et conditionnels, les déclencheurs UPDATE peuvent
cibler les colonnes spécifiques d'une table, et les déclencheurs peuvent être exécutés selon un ensemble de conditions spécifiés
par une clause WHERE. Les déclencheurs peuvent être liés à des vues en utilisant la condition INSTEAD OF. De multiples
déclencheurs sont traités par ordre alphabétique. En plus d'appeler des fonctions écrites en PL/pgSQL natif, les déclencheurs
peuvent également invoquer des fonctions écrites dans d'autres langages PL/Python ou PL/Perl.

PostgreSQL fournit un système de messagerie asynchrone qui peut être accédé à travers les commandes NOTIFY, LISTEN et UNLISTEN.
Une session peut émettre une commande NOTIFY, avec un canal spécifique à un utilisateur et une charge optionnelle, pour marquer
l'occurrence d'un évènement en particulier. D'autres sessions sont capables de détecter ces évènements en soumettant une
commande LISTEN, qui permet d'écouter un canal en particulier. Cette fonctionnalité peut être utilisée pour une grande variété
de situations, tels que faire savoir à d'autres sessions quand une table a été mise à jour, ou pour des applications séparées de
détecter quand une action particulière a été effectuée. Un tel système prévient le besoin de récupération d'informations par les
applications et réduit les surcharges inutiles. Les notifications sont pleinement transactionnelles, dans le sens où les
messages ne sont pas envoyés tant que la transaction desquels ils proviennent n'a été enregistrée. Cela élimine le problèmes des
messages envoyés pour une action en cours qui est ensuite redéroulée en sens inverse.

Beaucoup de connecteurs pour PostgreSQL fournissent un support pour le système de notification (incluant libpq, JDBC, Npgsql,
psycopg, Npgsql, psycopg et node.js) pour qu'il puisse être utilisé par des applications internes.

Les règles permettent l'arbre de requêtage d'une requête arrivante d'être réécrit. Des "règles de réécriture de requête" sont
liées à une table/classe et "réécrire" le DML arrivant (select, insert, update et/ou delete) en une ou plusieurs requêtes
supplémentaires qui soit remplacent la déclaration DML originale soit s'ajoutent à lui. Les réécriture de requêtes ont lieu
après l'analyse syntaxique de la déclaration de requête, mais avant la planification de requête.

D'autres fonctionnalités du requêtage incluent :

* Transactions
* Recherche plein texte
* Vues
    + Vues matérialisées
    + Vues actualisables
    + Vues récursives
* Joins internes, externes et croisés
* Sous-selects
    + Sous-requêtes corrélées
* Expressions régulières
* Expressions de tables communes et expression de table commune inscriptible
* Connexions chiffrées via sécurité de couche transport (TLS)
* Domaines
* Points de sauvegardes
* Enregistrement en deux temps
* La technique de stockage d'attributs surdimensionnés (TOAST) est utilisée pour stocker de manière transparente de grand
attributs de table dans une aire séparée, avec compression automatique.
* SQL embarqué est implémenté en utilisant un préprocesseur. Un code SQL est tout d'abord été écrite et embarquée dans du code
C. Puis le code est exécuté à travers un préprocesseur ECPG, qui remplace le SQL avec des appels au code de la bibliothèque.
Puis le code peut être compilé en utilisant un compilateur C.

Le serveur PostgreSQL fonctionne au niveau des processus (et pas des fils d'exécution), et utilise un processus de système
d'exploitation par session de base de données. Des sessions multiples sont automatiquement réparties sur tout les processeurs
disponibles par le système d'exploitation. De nombreux types de requêtes peuvent aussi être parallélisés à travers plusieurs
processus en arrière plan, pour profiter des nombreux processeurs ou cœurs. Les applications clientes peuvent utiliser des fils
d'exécution et créer plusieurs connexions à la base de données depuis chaque fil d'exécution.
