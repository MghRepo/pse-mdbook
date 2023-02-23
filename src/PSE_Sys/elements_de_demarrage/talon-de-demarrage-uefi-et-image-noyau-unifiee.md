## Éléments de démarrage

### Talon de démarrage UEFI et Image noyau unifiée

Une image noyau unifiée (UKI) est un exécutable unique qui peut être démarré directement depuis le
microgiciel UEFI, ou sourcé automatiquement par les chargeurs d'amorçage avec une configuration
légère voire inexistante.

Une image unifiée permet d'inclure :

* un talon de démarrage UEFI tel que *systemd-stub*,
* une image noyau,
* une image initramfs,
* l'interface ligne de commande du noyau,
* optionnellement, un écran de démarrage.

Grâce au talon, l'exécutable résultant, et par conséquent tous ses éléments, peuvent être facilement
signés afin d'utiliser la fonctionnalité de démarrage sécurisé UEFI (Secure Boot).
