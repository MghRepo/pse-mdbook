## Haute disponibilité

La haute disponibilité est une caractéristique d'un système qui vise à assurer un certain niveau de
performance opérationnelle, généralement l'uptime (ou durée de fonctionnement), durant une période
plus longue que celle attendue habituellement.

Il existe trois principes de conception système en ingénierie de fiabilité permettant d'atteindre
une haute disponibilité :

* L'élimination des points de défaillances uniques. Cela signifie ajouter ou construire une
  redondance dans le système pour que la défaillance d'un composant ne signifie pas la défaillance
  du système en entier.
* Fiabilité des points de croisements. Au niveau des systèmes redondants, le point de croisement
  lui-même tend à devenir un point de défaillance unique. Les systèmes fiables doivent fournir des
  points de croisement fiables.
* Détection des défaillances lors de leurs occurrences. Si les deux principes ci-dessus sont
  observés, alors un utilisateur pourra ne jamais voir de défaillance - mais l'activité de
  maintenance le doit.
