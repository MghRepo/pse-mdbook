## Éléments de sécurité

### OpenSSH

OpenSSH (OpenBSD Secure Shell) est un ensemble de programmes informatiques fournissant des sessions de communications chiffrées
à travers un réseau en utilisant le protocole Secure Shell. Il a été créé en tant qu'alternative open source à la suite
logicielle propriétaire Secure Shell offerte par SSH Communications Security.

On utilise généralement la suite d'outils OpenSSH suivante :

* **ssh-keygen** pour générer une paire clef publique/clef privée.
* **ssh-add** pour ajouter les identités de clefs privées à l'agent d'authentification *ssh-agent*.
* **ssh-agent** en tant que service gestionnaire de clefs.
* **ssh** en tant que client du protocole.
* **sshd** en tant que serveur du protocole.
