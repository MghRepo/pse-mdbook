## Gestion de la mémoire centrale

### Fichier mappé en mémoire

Un fichier mappé en mémoire est un segment de mémoire virtuelle qui est la copie d'une portion de fichier ou d'une ressource de
type fichier. Cette ressource est typiquement un fichier présent sur le disque, mais cela peut également être un périphérique,
un objet en mémoire partagée, ou toute autre ressource que le système d'exploitation peut référencer à l'aide d'un descripteur
de fichier. Une fois présente en mémoire, cette corrélation entre le fichier et l'espace mémoire permet aux applications de
traiter la partie mappée comme s'il s'agissait de la mémoire primaire.

Le bénéfice d'utiliser le mappage en mémoire est d'augmenter les performances d'entrée/sortie notamment sur les fichiers de gros
volume. Pour les petits fichiers, les fichiers mappés peuvent engendrer des problèmes de fragmentation interne du fait que les
maps mémoires sont toujours aligné sur la taille de la page (généralement 4Ko). Par conséquent, un fichier de 5Ko allouera 8Ko
et gâchera 3Ko. Accéder aux fichiers mappés en mémoire est plus rapide que d'utiliser des opérations de lecture et d'écriture
directement pour 2 raisons. Premièrement, un appel système est bien plus lent qu'un accès vers la mémoire locale du programme.
Deuxièmement, dans la plupart des systèmes d'exploitation la région mémoire mappée est la page cache du noyau, c'est à dire que
cela ne nécessite aucune copie en espace utilisateur.

Le processus de mapping mémoire est géré par le gestionnaire de mémoire virtuelle, qui est le même sous-système responsable de
la pagination. Les fichiers mappés sont chargés une page entière à la fois. La taille de la page est choisi par le système
d'exploitation pour un maximum de performance. Sachant que la pagination est un élément critique du gestionnaire de mémoire
virtuelle, le chargement des portions de la taille d'une page d'un fichier en mémoire physique est généralement une fonction
système très optimisée.

L'usage le plus commun de fichier mappé en mémoire est le chargement de processus. Lors de la création d'un processus, le
système d'exploitation utilise un fichier mappé en mémoire pour faire apparaître le fichier exécutable ainsi que tous les
modules chargeable en mémoire pour exécution. La technique la plus utilisée est la demande de pages, le fichier est chargé en
mémoire physique par section (chacune d'une page), et seulement quand cette page est référencée. Dans le cas spécifique des
exécutables, cela permet à l'OS de charger de manière sélective uniquement les portions de l'image processus qui nécessitent
réellement une exécution.

Un autre usage répandu pour les fichiers mappés en mémoire est le partage de fichiers entre processus multiples. Ceci permet
d'éviter les fautes de pages ainsi que les violations de segmentation.
