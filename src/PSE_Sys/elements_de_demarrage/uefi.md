## Éléments de démarrage

### UEFI

**L'interface microgicielle extensible unifiée (UEFI)** est une spécification qui définit une interface logicielle entre un
système d'exploitation et une plateforme microgicielle. UEFI remplace l'ancienne interface microgicielle BIOS dont elle reprend
généralement l'ensemble des services. L'UEFI peut supporter les diagnostics et réparations distants, même sans système
d'exploitation.

L'interface défini par la spécification EFI inclut des tables de données qui contiennent des informations de plateforme, ainsi
que des services de démarrage et d'exécution disponible au chargeur d'amorçage et au système d'exploitation. Le microgiciel
UEFI fournit un certain nombre d'avantages techniques par rapport à un système BIOS traditionnel :

* La possibilité de démarrer un disque contenant de grandes partitions (plus de 2TB) à l'aide d'une table de partition GUID
(GPT)
* Un environnement pre-SE flexible, incluant des capacités réseaux, une interface graphique utilisateur, le multi-langage
* Un environnement pre-SE 32 ou 64 bits.
* Une programmation en langage C
* Une architecture modulaire
* Une compatibilité

Contrairement au BIOS, UEFI ne s'appuie pas sur des secteurs de démarrage, il définit un gestionnaire de démarrage comme faisant
parti des spécifications UEFI. Quand l'ordinateur est allumé, le gestionnaire de démarrage vérifie la configuration de démarrage
et en fonction de ses paramètres, exécute ensuite le chargeur d'amorçage spécifié ou noyau de système d'exploitation
(généralement chargeur d'amorçage). La configuration de démarrage est définie par des variables stockées en NVRAM, incluant des
variables qui indiquent les chemins du système de fichier vers les chargeurs d'amorçages ou noyaux.

Les chargeurs d'amorçage peuvent également être détectés automatiquement par UEFI grâce à des chemins standardisés contenant des
fichiers au format *.efi*.

La spécification UEFI spécifie que les exécutables portables (PE) de Microsoft sont le format d'exécutable standard dans les
environnements EFI.
