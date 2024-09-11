## Processus et mécanismes de communication

### Tube nommé

Un tube nommé est une extension du concept traditionnel de tube des systèmes Unix et Unix-like,
c'est l'une des méthode de communication inter-processus (IPC). Un tube traditionnel existe jusqu'à
la fin du processus qui l'utilise. Un tube nommé, par contre, peut exister aussi longtemps que le
système s'exécute, et dépasser la durée de vie du processus qui l'utilise. Il peut être supprimé
s'il n'est plus utilisé. Typiquement, un tube nommé apparait comme un fichier, et généralement des
processus s'y attachent pour IPC.
