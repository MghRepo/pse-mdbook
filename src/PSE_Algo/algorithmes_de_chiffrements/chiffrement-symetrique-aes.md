## Algorithmes de chiffrements

### Chiffrement symétrique AES

Le standard de chiffrement avancé (AES), aussi connu sous son nom originel Rijndael, est une spécification pour le chiffrement
des données électroniques établi par l'institut national des standards et technologies (NIST) en 2001.

AES est un sous-ensemble du chiffrement par bloc Rijndael. Rijndael est une famille de chiffres comprenant différentes clefs et
différentes tailles de blocs. Pour AES, NIST a sélectionné trois membres de la famille Rijndael, chacun ayant une taille de bloc
de 128 bits, mais trois longueurs de clefs différentes : 128, 192 et 256 bits.

AES est basé sur un principe simple connu sous le nom de réseau de substitution-permutation, et est efficace tant au niveau
logiciel que matériel.

AES opère sur un tableau de bits ordonné 4 x 4. La plupart des calculs AES sont effectués dans un champ fini particulier.

La taille de clef utilisée pour un chiffre AES spécifie le nombre de rondes de transformations qui convertissent l'entrée, appelée
texte en clair, à la sortie finale, appelée texte chiffré. Les nombres de rondes sont les suivants :

* 10 rondes pour des clefs de 128 bits.
* 12 rondes pour des clefs de 192 bits.
* 14 rondes pour des clefs de 256 bits.

Chaque ronde consiste en plusieurs étapes de calculs, incluant une étape qui dépend de la clef de chiffrement elle même. Un
ensemble de rondes inversées sont appliquées pour retransformer le texte chiffré en son texte original en clair à l'aide
de la même clef de chiffrement.
