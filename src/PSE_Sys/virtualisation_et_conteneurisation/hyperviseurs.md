## Virtualisation et conteneurisation

### Hyperviseurs

Un hyperviseur est un logiciel, microgiciel ou matériel qui créé et exécute des machines virtuelles.
Un ordinateur sur lequel un hyperviseur exécute une ou plusieurs machines virtuelles est appelé
hôte, et chaque machine virtuelle est appelée invitée. L'hyperviseur présente le système
d'exploitation invité à l'aide d'une plateforme d'exploitation virtuelle et gère l'exécution des
systèmes d'exploitations invités. Plusieurs instances de divers systèmes d'exploitation peuvent
partager les mêmes ressources matérielles virtualisées. A l'instar des mécanismes de virtualisation
implémentés au niveau du système d'exploitation (conteneurs), les systèmes d'exploitations invités
ne doivent pas forcément partager un même noyau.

Il existe deux types d'hyperviseurs :

* **Type-1 natif** : Ces hyperviseurs s'exécutent directement sur le matériel de l'hôte pour
  contrôler le matériel et gérer les systèmes d'exploitation invités.
* **Type-2 hébergés** : Ces hyperviseurs s'exécutent sur un système d'exploitation conventionnel
  comme n'importe quel autre programme. Un système d'exploitation invité s'exécute en tant que
  processus de l'hôte. Les hyperviseurs de type-2 créent une abstraction pour les systèmes
  d'exploitation invités depuis le système d'exploitation hôte.

Cette distinction entre les deux types n'est pas toujours claire. Par exemple KVM et bhyve sont des
modules noyau qui transforment le système d'exploitation hôte en hyperviseur de type-1. En même
temps, les distributions Linux et FreeBSD sont aussi des systèmes d'exploitations conventionnels, où
des applications entrent en concurrence les unes avec les autres pour les ressources VM et ils
peuvent être aussi catégorisés comme des hyperviseurs de type-2.
