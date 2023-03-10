## Éléments de sécurité

### Systemd-logind

Systemd-logind est un service système qui gère les connexions utilisateurs. Il est responsable pour
:

* Garder la trace des utilisateurs et de sessions, leurs processus et leur état au repos à l'aide
  des unités slice et scope, ainsi qu'un service gestionnaire par utilisateur.
* Générer et gérer les identifiants de session.
* Fournir un accès basé sur polkit pour des utilisateurs pour des opérations telles que l'arrêt du
  système ou la veille.
* Implémenter une logique d'inhibition lors de l'arrêt/veille pour les applications.
* Gérer les touches d'arrêt/veille.
* La gestion multisiège.
* La gestion de basculement de session.
* L'accès aux périphériques pour les utilisateurs.
* L'apparition automatique de gettys sur activation d'une console virtuelle et la gestion du
  répertoire d'exécution utilisateur.

Les sessions utilisateurs sont enregistrées avec *logind* via le module PAM *pam_systemd*.
