## Éléments de sécurité

### BPF et eBPF

Le filtre de paquet BSD (BPF) est une architecture de capture de paquets en espace utilisateur. Celle-ci repose sur une machine
virtuelle à registre qui fonctionne dans le noyau et permet d'évaluer les règles de filtrage sans recopies des paquets. Ce
mécanisme est utilisé par des outils standards comme *tcpdump* pour sélectionner les paquets à capturer.

Récemment ce mécanisme à évolué vers une version étendue (eBPF) qui est la version moderne d'architecture utilisée : 

* passage de 2 registres 32 bits à 10 registres 64 bits
* possibilité d'appeler certaines fonctions du noyau

eBPF permet d'exécuter des programmes contrôlés (absence de boucles, pointeurs vérifiés etc.) dans l'espace noyau à l'aide d'un
compilateur JIT qui transforme le programme BPF en code natif.

Les programmes eBPF peuvent être utilisés pour implémenter des fonctionnalités de supervision, de sécurité et de réseautage
hautes performances.
