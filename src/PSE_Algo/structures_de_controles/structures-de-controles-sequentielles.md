## Structures de contrôle

### Structures de contrôle séquentielles

Un programme informatique impératif est une suite d'instructions. Un registre interne de processeur,
le compteur ordinal (PC), est chargé de mémoriser l'adresse de la prochaine instruction à exécuter.

La plupart des instructions d'un programme sont exécutées séquentiellement : après le traitement de
l'instruction courante le compteur ordinal est incrémenté, et la prochaine instruction est chargée.

La séquence est donc la structure de contrôle implicite. Elle donne l'ordre d'exécution des
instructions, souvent séparées par un point-virgule ou par des retours chariots.

Un programme s'arrête généralement après l'exécution de la dernière instruction. La plupart des
langages de programmation proposent également une ou plusieurs instructions pour stopper l'exécution
du programme à une position arbitraire.

Selon l'environnement d'exécution sous-jacent (système d'exploitation ou microprocesseur), cet arrêt
peut être définitif ou correspondre à une suspension de l'exécution du programme en attendant un
évènement externe : c'est par exemple le fonctionnement habituel de la plupart des instructions
d'entrée sorties qui bloquent le flot d'exécution (mécanisme d'interruption avec stockage en mémoire
tampon) jusqu'à ce que le périphérique concerné ait terminé de traiter les données.
