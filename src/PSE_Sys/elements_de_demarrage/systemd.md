## Éléments de démarrage

### Systemd

Systemd est un système et un gestionnaire de service pour les systèmes d'exploitation Linux. Lorsqu'il est exécuté en tant que
premier processus au démarrage, il agit comme le système init et met en place et gère les services de l'espace utilisateur. Des
instances séparées sont démarrées pour les utilisateurs connectés afin de démarrer leurs services.

D'habitude, systemd n'est pas invoqué directement par l'utilisateur, mais est installé comme le lien symbolique */sbin/init* et
lancé au début du démarrage.

Lorsqu'il est exécuté en tant qu'instance système, systemd interprète le fichier de configuration *system.conf* et les fichiers
présents dans les répertoires de *system.conf.d* ; lorsque lancé en tant qu'instance utilisateur, systemd interprète le fichier
de configuration *user.conf* et les fichiers dans les répertoires *user.conf.d*

Systemd fournit un système de dépendances entre des entités variées appelées "unités" de 11 types différents. Les unités
encapsulent des objets utiles pour le démarrage et la gestion du système. La grande majorité des unités sont configurées dans
des fichiers de configuration d'unité, néanmoins certaines peuvent être créées automatiquement depuis d'autres configurations,
dynamiquement d'un état système ou de façon programmée à l'exécution. Une unité peut être "active" (i.e. démarrée, liée,
connectée, etc. selon le type d'unité), ou "inactive" (i.e. stoppée, déliée, déconnectée, etc.) ou bien dans le processus
d'activation ou de désactivation, c'est à dire entre les deux états. Un état spécial "échoué" est également disponible, très
similaire à "inactive" il se déclenche lorsque le service a échoué d'une certaine façon (le processus a renvoyé un code
d'erreur, ou a crashé, une opération a time out, ou après un nombre trop important de redémarrages). Si l'état apparaît, la
cause sera tracée pour référence ultérieure. Il est à noté que plusieurs types d'unité peuvent avoir un nombre de sous-états
additionnels, qui sont reliés aux 5 états d'unité généraux décrits ici.

Les unités suivantes sont disponibles :

1. Les unités de **services**, qui démarrent et contrôlent des daemons et les processus qui les composent.
2. Les unités de **sockets**, qui encapsulent des IPC locaux ou des sockets réseaux du système, utiles pour l'activation basée
sur des sockets.
3. Les unités de **cibles** utilisées afin de grouper des unités, ou de fournir des points de synchronisation connus au
démarrage.
4. Les unités de **périphériques** qui expose les périphériques de noyau dans systemd et peuvent être utilisées pour de
l'activation basée sur des périphériques.
5. Les unités de **montages**, pour contrôler les points de montage dans le système de fichiers.
6. Les unités de **montages automatiques**, afin d'automatiser les opérations de montage à la demande et le démarrage
parallélisé.
7. Les unités de **timers** afin de déclencher l'activation d'autres unités sur la base de timers.
8. Les unités de **swap**, très similaires aux unités de montages qui encapsulent les partitions mémoires dédiées au swap ou des
fichiers du système d'exploitation.
9. Les unités de **chemins** qui peuvent être utilisées afin d'activer d'autres service lorsque les objets du système de
fichiers changent ou sont modifiés.
10. Les unités de **tranches** qui sont utilisées afin de grouper des unités qui gèrent des processus systèmes dans un arbre
hiérarchique pour des questions de gestion des ressources.
11. Les unités de **scope** similaires aux unités de services mais pour gérer et démarrer des processus externes. Ils sont créés
de façon programmée en utilisant les interfaces de bus de systemd.

> Units : service, socket, target, device, mount, automount, timer, swap, path, slice, scope

Systemd chargera implicitement et automatiquement les unités depuis le disque - si celles-ci ne sont pas déjà chargées - dès
qu'elles seront requises par des opérations. Ainsi, le fait qu'une unité est chargée ou non est invisible aux clients. On
utilise `systemctl list-units --all pour lister de manière compréhensive les unités actuellement chargées. N'importe quelle
unité pour laquelle aucune de conditions ci-dessus ne s'applique est rapidement déchargée. Il est à noter que quand une unité
est déchargée de la mémoire courante ses données sont également libérées. Néanmoins les données ne sont généralement pas
perdues, du fait qu'un enregistrement dans le journal de log est généré déclarant les ressources consommées à l'arrêt d'une
unité.

Les processus lancés par systemd sont placés dans des cgroups nommés d'après l'unité à laquelle ils appartiennent dans la
hiérarchie privée de systemd. systemd fait usage de cela afin de garder efficacement la trace des processus. L'information du
Control group est gérée par le noyau, et est accessible dans la hiérarchie du système de fichier (sous /sys/fs/cgroup/systemd/),
ou bien dans des outils tels que systemd-cgls.

Systemd contient un système transactionnel minimal : si une unité doit s'activer ou se désactiver, il l'ajoutera avec toutes ses
dépendances dans une transaction temporaire. Il vérifiera alors si la transaction est cohérente (i.e. si l'ordonnancement de
toutes les unités ne contient pas de boucle). Si ce n'est pas le cas, systemd essaiera de résoudre le problème, et supprimera
les jobs non essentiels de la transaction ce qui pourra faire disparaître la boucle. Systemd essaiera également de supprimer les
jobs non essentiels qui arrêteraient un service déjà actif. Enfin il vérifiera si les jobs de la transaction contredisent des
jobs déjà en attente dans la file et optionnellement annulera la transaction. Si tout a marché et que la transaction est
cohérente et minimale dans son impact, elle est fusionnée avec tous les jobs en attente dans la file d'exécution. Cela signifie
qu'avant l'exécution d'une opération demandée, systemd vérifiera en premier lieu qu'elle ait un sens, essaiera de résoudre si
possible, et échouera uniquement s'il n'est pas possible de la faire fonctionner.

Il est à noter que les transactions sont générées indépendamment de l'état des unités à l'exécution, ce qui a pour conséquence
par exemple que si un job de démarrage est requis sur une unité déjà active, il génèrera quand même une transaction et
réveillera toute dépendance inactive (et causera par propagation la demande d'autres jobs tels que définis par leurs relations).
Ceci du fait que le job enfilé est comparé à l'exécution à l'état de l'unité cible et est marqué comme réussi et complet quand
les deux sont satisfaits. Cependant ce job ressort également les autres dépendances du fait de la relation définie et mène donc,
dans notre exemple, à l'enfilage des jobs de démarrage de toutes ces unités inactives.

Systemd contient des implémentation natives de tâches diverses faisant parti du processus de démarrage et ayant besoins d'être
exécutées. Par exemple, il fixe le nom de l'hôte ou configure le périphérique réseau de loopback. Il sert également à mettre en
place et monter plusieurs systèmes de fichiers d'API, tels que /sys/ ou /proc/.
