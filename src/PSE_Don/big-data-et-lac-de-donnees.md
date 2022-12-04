## Big data et lac de données

Le big data désigne les ressources d'informations dont les caractéristiques en terme de volume, de vélocité et de variété
imposent l'utilisation de technologies et de méthodes analytiques particulières pour générer de la valeur, et qui dépassent en
général les capacités d'une seule et unique machine et nécessitent des traitements parallélisés.

L'explosion quantitative (et souvent redondante) des données numériques permet une nouvelle approche pour analyser le monde. Le
volume colossal de données numériques disponibles, implique de mettre en oeuvre de nouveaux ordres de grandeur concernant la
capture, le stockage, la recherche, le partage, l'analyse et la visualisation des données, celles-ci proviennent de nombreuses
sources numériques : les réseaux sociaux, l'OpenData, le Web, des bases de données privées, publiques à caractère commercial ou
scientifique.

La maturité grandissante du concept permet de se différencier de manière plus marqué vis à vis de l'informatique décisionnelle :

* L'informatique décisionnelle utilise des outils de mathématiques appliquées ainsi que des statistiques descriptives à l'aide
de données à haute densité d'informations pour mesurer, observer des tendances etc.  Le big data utilise l'analyse mathématique,
l'optimisation, les statistiques inductives ainsi que des concepts d'identification de systèmes non linéaires pour inférer des
règles (régressions, relations non linéaires et effets causaux) de larges ensembles de données avec une densité d'information
faible afin de révéler des relations et dépendances, ou pour fournir des prédictions de résultats et de comportements.

Le big data peut être décrit par les caractéristiques suivantes :

* **Volume** : La quantité de la donnée générée et stockée. La taille de la donnée détermine la valeur, la potentielle
perspicacité, et si elle peut être considérée big data ou non. La taille du big data est généralement supérieure aux térabits et
pétabits.
* **Variété** : Le type et la nature de la donnée. Les technologies plus anciennes tels que les SGBDR étaient capable de traiter
des données structurées de manière performante et efficace. Néanmoins, les changements du type et de la nature des données
structurées à semi-structurées puis déstructurées à mis à l'épreuve les outils et technologies existants. Les technologies big
data ont évoluées avec l'intention première de capturer, stocker et traiter la donnée semi-structurée et déstructurée (variété)
générée très rapidement  (vitesse), et avec une taille immense (volume). Plus récemment, ces outils et technologies sont
utilisés pour s'occuper de données structurées mais préférablement pour le stockage. Finalement, le traitement de données
structurées était toujours gardé en option, soit en utilisant du big data soit avec des SGBDR traditionnels. Ceci permet
d'analyser les données vers un usage efficace des perspicacités cachées exposées par les données collectées via les réseaux
sociaux, les fichiers de logs, les capteurs, etc. que le big data dessine depuis du texte, des images, audio, vidéo ; et
complète les pièces manquantes via la fusion de données.
* **Vitesse** : La rapidité à laquelle la donnée est générée et traitée pour satisfaire la demande et les nouveaux défis que
représentent le chemin de la croissance et du développement. Le big data est souvent disponible en temps réel. En comparaison
avec le small data, le big data est produit de façon plus continu. Deux types de vitesses liés au big data sont la fréquence de
production et la fréquence de gestion, enregistrement et publication.
* **Véracité** : La véracité et la fiabilité de la donnée, qui fait référence à sa qualité et sa valeur. Le big data ne doit pas
être uniquement grand par la taille, mais également fiable afin d'obtenir de la valeur dans son analyse. La qualité de la donnée
capturée peut largement varier et affecter la précision de l'analyse.
* **Valeur** : La valeur d'une information qui peut être obtenu par le traitement et l'analyse de grands ensembles de données.
La valeur peut aussi être mesurée par une évaluation des autres qualités du big data. La valeur peut aussi représenter la
profitabilité de l'information qui est extraite de l'analyse du big data.
* **Variabilité** : La caractéristiques des formats changeants, structure, ou sources de big data. Le big data peut inclure des
données structurées ou déstructurées ou encore une combinaison des deux. L'analyse du big data peut intégrer des données brutes
de sources multiples. Le traitement des données brutes peut également faire intervenir des transformations de données
déstructurées en données structurées.

D'autres caractéristiques du big data sont :

* **Exhaustivité** : Si le système dans son ensemble est capturé (enregistré) ou non. Le big data peut inclure toutes les
données depuis les sources ou pas.
* **Fin et uniquement lexical** : Respectivement, la proportion de données spécifiques de chaque élément par élément collecté et
si l'élément et ses caractéristiques sont correctement indexés ou identifiés.
* **Relationnel** : Si la donnée collectée contient des champs communs qui pourrait permettre une intersection, ou méta-analyse,
de différents ensembles de données.
* **Extensible** : Si de nouveaux champs dans chaque élément de la donnée collectée peuvent être ajoutés ou changés facilement.
* **Mise à l'échelle** : Si la taille du système de stockage big data peut rapidement s'agrandir.

L'architecture du big data est généralement multi-couche. Une architecture parallèle distribuée distribue les données à travers
de multiples serveurs, ces exécutions dans des environnements parallèles permet d'améliorer considérablement les temps de
traitements. Ce type d'architecture rentre les données dans des systèmes de gestions de bases de données parallèles, qui
implémentent l'usage du modèle de programmation *MapReduce* de Google. Le concept *MapReduce* fournit un modèle de traitement
parallèle. Les requêtes sont réparties et distribuées à travers des noeuds parallèles et traités en parallèle. Les résultats
sont ensuite récupérés, rassemblés et fournis. Ce type de framework cherche à rendre transparent le pouvoir de traitement à
l'utilisateur final en utilisant des interfaces de serveurs d'applications.

Le lac de données peut permettre à une organisation de changer son fusil d'épaule en passant d'un contrôle centralisé à un
modèle partagé pour répondre aux changements dynamiques de la gestion d'information.

Un lac de données est un système ou bibliothèque de données stockées dans leurs formats naturels/bruts, généralement des objets
blobs ou des fichiers. Un lac de données est généralement un emplacement de stockage unique de données qui incluent des copies
brutes de données système, des données de capteurs, des données sociales etc. et des données transformées utilisées pour des
tâches comme la visualisation, l'analyse et l'apprentissage automatique. Un lac de données peut inclure des données structurées
de bases de données relationnelles, semi-structurées (CSV, logs, XML, JSON), ou déstructurées (emails, documents, PDFs) et des
données binaires (images, audio, vidéo).

Les principaux composants qui caractérisent un écosystème big data sont les suivants :

* Des techniques d'analyse de données, telles que les tests A/B, l'apprentissage automatique, et le traitement automatique des
langages.  Des technologies big data, telles que l'informatique décisionnelle, l'informatique en nuage, et les bases de données.
* Une visualisation de la donnée, à travers des diagrammes, des graphes, ou d'autres types d'affichages.
