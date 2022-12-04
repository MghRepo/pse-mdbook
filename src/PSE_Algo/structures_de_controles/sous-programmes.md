## Structures de contrôle

### Sous-programmes

Un sous-programme permet la réutilisation d'une partie du code et ainsi le développement des algorithmes récursifs.

Beaucoup de langages modernes ne supportent pas directement la notion de sous-programme au profit de constructions de haut
niveau qui peuvent être appelées, d'un langage à l'autre **procédure, fonction, méthode**, ou **routine**. Ces constructions
ajoutent la notion de passage de paramètres et surtout le cloisonnement des espaces de noms pour éviter que le sous-programme
ait un effet de bord sur la routine appelante.

Il existe diverses extensions à la notion de procédure comme les coroutines (routine avec suspension), signaux, et slots
(signaux implémentés pour les objets), fonctions de rappel (callback, traitement post-fonction), méthodes virtuelles
(programmation par contrat, méthode implémentée dans les classes héritées) Elles permettent de modifier dynamiquement, c'est à
dire à l'exécution, la structure du flot d'exécution du programme.
