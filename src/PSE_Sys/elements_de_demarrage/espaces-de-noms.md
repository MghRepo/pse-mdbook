## Éléments de démarrage

### Espaces de noms

Un espace de noms encapsule dans une abstraction une ressource système globale qui la fait apparaître aux processus contenus
dans l'espace de noms qui ont leur propre instance isolée de la ressource globale. Les changements de la ressource globale sont
visibles aux autres processus membre de l'espace de noms, mais invisible aux autres processus. Les espaces de noms sont utilisés
pour implémenter les conteneurs.

Les types d'espace de noms disponibles dans Linux sont les suivants : Cgroup, IPC, Network, mount, PID, Time, User, UTS.
