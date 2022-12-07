## Construction et automatisation

### Maven

Maven est un outil d'automatisation de construction utilisé généralement pour les projets Java. Maven peut également être
utiliser pour construire et gérer des projets dans d'autres langages.

Maven aborde deux aspects de la construction de logiciel : comment le logiciel est construit, et ses dépendances. Contrairement
à des outils précédents tels que Ant, il utilise des conventions pour la procédure de construction. Seules les exceptions ont
besoin d'être spécifiées. Un fichier XML décrit le projet logiciel en cours de construction, ces dépendances sur d'autres
modules externes et composants, l'ordre de construction, les répertoires, et plugins requis. Il embarque des cibles prédéfinies
pour exécuter certaines tâches bien définies telles que la compilation de code et la construction de paquets. Maven télécharge
dynamiquement des bibliothèques Java et des plugins Maven d'un ou plusieurs dépôts et les stocke dans un cache local. Ce cache
local d'artefacts téléchargés peut également être mis à jour à l'aide d'artefacts créés par des projets locaux. Les dépôts
publics peuvent également être mis à jour.

Maven est construit en utilisant une architecture de plugins qui permet de faire usage de n'importe quelle application
contrôlable via l'entrée standard.
