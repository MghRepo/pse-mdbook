## Administration SGBDR PostgreSQL

### Stockage et réplication

PostgreSQL inclus une réplication binaire basé sur l'import de changements (write-ahead logs (WAL)) pour répliquer des noeuds de
manière asynchrone, avec la possibilité d'exécuter des requêtes de lecture seule sur ces noeuds répliqués. Ceci permet de
séparer le traffic en lecture sur de multiples noeuds efficacement.

PostgreSQL inclus un mécanisme de réplication synchrone qui garantit que, pour chaque transaction d'écriture, le maître attende
jusqu'à ce qu'au moins un noeud répliqué ait écrit la donné dans sa log de transactions. Contrairement à d'autres systèmes de
base de données, la durabilité d'une transaction (selon qu'elle soit synchrone ou asynchrone) peut être spécifiée par base de
données, par utilisateur, par session ou même par transaction. Cela peut se révéler utile pour des charges qui ne demandent pas
de telles garanties, et peut ne pas être recherchée pour l'ensemble des données car cela diminue les performances du fait de la
nécessité de confirmation de la transaction pour atteindre la veille synchrone.

Les serveurs de veille peuvent être synchrones ou asynchrones. Des serveurs de veille synchrones peuvent être spécifiés dans la
configuration qui détermine quels serveurs sont candidats pour la réplication synchrone. Le premier dans la liste qui diffuse
activement sera utilisé comme serveur synchrone courant. Quand il échoue, le système retombe sur le suivant dans la liste.

La réplication multi-maître synchrone n'est par inclus dans PostgreSQL. Postgres-XC basé sur PostgreSQL fournit la réplication
multi-maître synchrone. Réplication bidirectionnelle (BDR) est un système de réplication multi-maître asynchrone pour
PostgreSQL.

Des outils tels que *remgr* permettent de gérer des groupes de réplication plus facilement.

PostgreSQL inclus un support pour arbre B et index de tables de hachages, ainsi que quatre méthodes d'accès aux index : les
arbres de recherche généralisés (GiST), les index inversés généralisés (GIN), GiST partitionnés espace (SP-GiST) et les index de
portée de bloc (BRIN). De plus, des méthodes d'index définis par l'utilisateur peuvent être crées. Les index dans PostgreSQL
supporte également les fonctionnalités suivantes :

* Les index d'expression peuvent être créés à l'aide d'un index du résultat d'une expression ou fonction, au lieu de la simple
valeur d'une colonne.
* Les index partiels, qui indexent seulement une partie d'une table, qui peut être créé en ajoutant une clause WHERE à la fin de
la déclaration CREATE INDEX. Ceci permet la création d'index plus petits.
* Le planificateur est capable d'utiliser des index multiples ensemble pour répondre à des requêtes complexes, en utilisant des
opérations temporaire d'index de tableaux de bits en mémoire.
* L'indexation des k-proche voisins (KNN-GiST) fournit une recherche efficace des "plus proches valeurs" à celle spécifiée,
utile pour trouver des mots similaires, ou des objets proches ou des lieux avec des informations géographiques.
* Les balayages uniquement-index permettent souvent au système de récupérer la donnée depuis des index sans jamais avoir à
accéder la table principale.

Dans PostgreSQL, un schéma détient tous les objets, à l'exception des rôles et des tablespaces. Les schémas agissent
efficacement comme des espaces de noms, permettant à des objets de même noms de coexister dans la même base de données. Par
défaut, les bases de données ont un schéma appelé *public*, mais d'autres schémas peuvent être créés, et le schéma public n'est
pas obligatoire.


Un paramètre *search_path* détermine l'ordre dans lequel PostgreSQL vérifie les schémas les objets sans qualifications (sans
schéma préfixé). Par défaut, il est défini à *$user, public* (*$user* fait référence à l'utilisateur de la base de données
connecté). Ce paramètre peut être changé sur une base de données ou un niveau de rôle, mais il s'agit d'un paramètre de session,
il peut être changé librement (de multiples fois) pendant une session client, affectant uniquement cette session.

Les schémas non existants, listés dans *search_path* sont silencieusement ignorés pendant la recherche d'objets.

De nouveaux objets sont créés dans n'importe quel schéma valide qui apparaît en premier dans le *search_path*

Une grande variété de types de données natifs sont supportés, incluant :

* Booléens
* Nombre à précision arbitraire
* Caractère (texte, varchar, char)
* Binaire
* Date/heure (horodatage/heure avec/sans fuseau horaire, date, intervalle)
* Monnaie
* Énumération
* Chaîne de bits
* Texte de recherche de type
* Composé
* HStore
* Tableaux
* Primitives géométriques
* Adresses IPv4 et IPv6
* CIDR et adresses MAC
* XML
* UUID
* JSON, JSONB

De plus, les utilisateurs peuvent créer leurs propres types de données qui peut généralement être fait complètement indexable
via les infrastructures d'indexation PostgreSQL - GiST, GIN, SP-GiST.

Il existe également un type de données appelé un *domaine*, qui est le même que n'importe quel type de données mais avec des
contraintes optionnelles définies par le créateur de ce domaine. Cela signifie que toute donnée entrée dans une colonne
utilisant le domaine devra se conformer aux contraintes définies comme faisant partie du domaine.

Un type qui représente un intervalle de donnée peut être utilisé et est appelé type intervalle. Ces intervalles peuvent être
discrets ou continus. Les types inclus disponibles sont les intervalles d'entiers, les nombres décimaux, les horodatages et les
dates.

Des types avec intervalles personnalisés peuvent être créés pour faire de nouveau types d'intervalles disponibles, tels que des
adresses IP qui utilisent un type inet comme base. Les types intervalle sont aussi compatibles avec des opérateurs existants
utilisés pour vérifier des intersections, l'inclusion, etc.

De nouveaux types de la plupart des objets à l'intérieur de la base de données peuvent être créés, tels que :

* Distributions
* Conversions
* Types de données
* Domaines de données
* Fonctions
* Index
* Opérateurs
* Langages procéduraux

Des tables peuvent être paramétrées pour hériter leurs caractéristiques d'une table parente. Les données d'une table descendante
apparaîtront comme existantes dans les tables parentes, à moins que les données ne soit lues depuis la table parente en
utilisant le mot clef ONLY. Ajouter une colonne dans la table parente la fera apparaître dans la table descendante.

L'héritage peut être utilisé pour implémenter un partitionnement de table, en utilisant soit des déclencheurs soit des règles
pour insérer directement depuis la table parente dans les tables descendante concernées.

L'héritage permet de fournir un moyen de relier les fonctions de généralisation hiérarchiques décrites dans des diagrammes
relations entités (ERDs) directement dans la base de données PostgreSQL.
