## Processus et mécanismes de communication

### Signaux

Un signal est une forme de communication entre processus utilisée par les systèmes de type Unix et
ceux respectant les standards POSIX. Il s'agit d'une notification asynchrone envoyée à un processus
pour lui signaler l'apparition d'un événement. Quand un signal est envoyé à un processus, le système
d'exploitation interrompt l'exécution normale de celui-ci. Si le processus possède une routine de
traitement pour le signal reçu, il lance son exécution. Dans le cas contraire, il exécute la routine
des signaux par défaut.

La norme POSIX (et la documentation de Linux) limite les fonctions directement ou indirectement
appelables depuis cette routine de traitements des signaux. Cette norme donne une liste exhaustive
de fonctions primitives dites *async-signal safe* (en pratique les appels systèmes) qui sont les
seules à pouvoir être appelées depuis une routine de traitement de signal sans avoir un comportement
indéfini. Il est donc suggéré d'avoir une routine de traitement de signal qui positionne simplement
un drapeau déclaré *volatile sig_atomic_t* qui serait testé ailleurs dans le programme.

L'appel système kill(2) permet d'envoyer, si cela est permis, un signal à un processus. La commande
kill(1) utilise cet appel système pour faire de même depuis le shell. La fonction raise(3) permet
d'envoyer un signal au processus courant.

Les exceptions comme les erreurs de segmentation ou les divisions par zéro génèrent des signaux. Ici
les signaux générés seront respectivement SIGSEGV et SIGFPE. Un processus recevant ces signaux se
terminera et générera un core dump par défaut.

Le noyau peut générer des signaux pour notifier les processus que quelque chose s'est passé. Par
exemple, SIGPIPE est envoyé à un processus qui essaye d'écrire dans un pipe qui a été fermé par
celui qui lit. Par défaut, le programme se termine alors. Ce comportement rend la construction de
pipeline en shell aisée.
