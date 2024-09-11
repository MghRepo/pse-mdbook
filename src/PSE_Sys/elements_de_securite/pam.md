## Éléments de sécurité

### PAM

Les modules d'authentification attachables Linux (PAM) fournissent un cadriciel pour une
authentification de l'utilisateur sur l'ensemble du système. Cela permet de développer des
programmes indépendants du schéma d'authentification. Ces programmes ont besoin que des "modules
d'authentification" leurs soient attachés à l'exécution pour fonctionner. Le module
d'authentification attaché au programme est à la discrétion de l'administrateur système et dépend de
l'installation locale.

La bibliothèque fournit une interface générale stable (API) que les programmes donnant des privilèges
(tels que *login* ou *su*) délèguent pour exécuter des tâches d'authentification standards.

La principale fonctionnalité de l'approche PAM est que la nature de l'authentification est dynamiquement
configurable. L'administrateur choisit comment des applications de service individuelles authentifieront
les utilisateurs.

Le point important est que les fichiers de configuration définissent une connexion entre applications
(services) et que ce sont les PAMs qui executent effectivement les tâches d'authentification.

Les PAMs Linux séparent les tâches d'authentification en 4 groupes de gestion indépendants :
* **account** : Fournit un service de type vérification de compte : Le mot de passe utilisateur a-t-il expiré ?;
  Est-ce que l'utilisateur est autorisé à accéder au service demandé ?
* **auth** : Authentifie un utilisateur et créé (met en place) son identité.
* **password** : Ce groupe est responsable des mécanismes de mise à jour de l'authentification.
* **session** : Ce groupe de tâches couvre les choses qui doivent être réalisées avant qu'un service soit accordé et après qu'il soit retiré.
