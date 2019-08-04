Pour réussir ce challenge il suffit d'éxécuter le code suivant:

```python
# Auteur : Arnaud Meauzoone

import random
from math import *

def reverseXorShiftDroite(valeur_init, decalage):	# C'est la cryptanalyse du Xorshift.
    valeur_rec = valeur_init
    for i in range(ceil((32 - decalage)/decalage) +1):	# Le nombre de décalage dans 32 bits.
        valeur_rec = valeur_init ^ valeur_rec >> decalage	# Voir note Xorshift pour les détails.
    return valeur_rec

def reverseXorShiftGauche(valeur_init, decalage, masque):	# C'est la cryptanalyse du Xorshift.
    valeur_rec = valeur_init
    for i in range(ceil((32 - decalage)/decalage) +1):	# Le nombre de décalage dans 32 bits.
        valeur_rec = valeur_init ^ (valeur_rec << decalage & masque)	# Voir note Xorshift.
    return valeur_rec

def demixage(valeur):	# C'est la fonction de demixage. Voir extract_number() ici:
			# https://en.wikipedia.org/wiki/Mersenne_Twister

    valeur = reverseXorShiftDroite(valeur, 18)		#
    valeur = reverseXorShiftGauche(valeur, 15, 0xefc60000)	# On renverse chaque étape de la
    valeur = reverseXorShiftGauche(valeur, 7, 0x9d2c5680)	# fonction d'extraction
    valeur = reverseXorShiftDroite(valeur, 11)		#
    return valeur


lines = [line.rstrip('\n') for line in open('rand_list.txt')]	# On lit les valeurs dans le
									# fichier rand_list.txt
```

Plus d'infos dans le MISC
