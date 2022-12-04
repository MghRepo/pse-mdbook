## Algorithmes de chiffrements

### Chiffrement asymétrique RSA

Dans un système de chiffrement à clef publique, la clef de chiffrement est publique et distincte de la clef de déchiffrement,
qui est gardée secrète (privée). Un utilisateur RSA créé et publie une clef publique sur la base de deux grand nombres premiers,
ainsi qu'une valeur auxiliaire. Les nombres premiers sont gardés secret. Les messages peuvent être chiffrés par n'importe qui,
via la clef publique, mais peut uniquement être décodé par quelqu'un connaissant les nombres premiers.

La sécurité du RSA repose sur la difficulté pratique à factoriser le produit de deux grands nombres premiers, le "problème de
factorisation".

RSA est un algorithme relativement lent. De ce fait, il n'est généralement pas directement utilisé pour chiffrer les données des
utilisateurs. Il est plus souvent utilisé pour transmettre des clefs partagées pour un chiffrement à clef symétrique, qui est
ensuite utilisé pour le chiffrement et déchiffrement des données.

La taille des clefs pour le chiffrement RSA varie entre 1024 et 4096 bits avec récemment une recommandation minimale de 2048
bits.
