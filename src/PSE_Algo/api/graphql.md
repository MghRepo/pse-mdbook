## API

### GraphQL

GraphQL est un langage de requêtage et de manipulation de données pour APIs, ainsi qu'un
environnement d'exécution permettant de répondre aux requêtes à l'aide de données existantes.

Il fournit une approche au développement d'APIs webs et est souvent comparé à REST et autres
architectures de services webs. Il permet aux clients de définir une structure de la donnée requise,
et cette même structure de la donnée est retournée par le serveur, prévenant ainsi le retour d'une
trop grande quantité de données, mais ceci a des implications sur l'efficacité de la mise en cache
web des résultats de requêtes. La flexibilité et la richesse du langage de requêtage ajoute
également une complexité qui n'est pas forcément nécessaire pour des APIs simples. Malgré le nom,
GraphQL ne fournit pas la richesse des opérations de graphe que l'on peut trouver dans les bases de
données orientées graphes tels que Neo4j, ou même certains dialectes de SQL qui supportent les
fermetures transitives. Par exemple, une interface GraphQL qui rapporte les parents d'un individu ne
peut pas retourner en une seule requête, l'ensemble de ses ancêtres.

GraphQL consiste en un système de types, un langage de requêtage et une sémantique d'exécution, une
validation statique et une introspection de type. Il supporte la lecture, l'écriture (mutation), et
la souscription à des modifications de la donnée (mis à jour en temps réel -- implémentée le plus
souvent à l'aide de websockets). Les serveurs GraphQL sont disponibles pour de nombreux langages de
programmations.
