Pour déchiffrer ce fichier éxécutez le code suivant:

```python
# Auteur : Arnaud Meauzoone

import os

fichier_chiffre = 'crack_me.png' # Variable pour le nom du fichier chiffré.
fichier_dechiffre = 'decrypted.png' # Variable pour le nom du fichier déchiffré.

clef = [] # Variable qui contiendra toute la clé.

graine = [0,1,1,1,1,1,0,0,0,1,1,1,1,0,1,1,1,0,0]	# La graine que nous avons
						     	# retrouvé en prenant les
							# 19 premiers bits de la clef.

clef += graine # Les 19 premiers bits de la clé sont ceux de la graine.

data_chiffre = open(fichier_chiffre,'rb').read() # Variable pour les données chiffrées.
data_dechiffre = open(fichier_dechiffre,'wb') # Variable pour les données déchiffrées.

taille = os.path.getsize(fichier_chiffre) # On récupère la taille du fichier chiffré.

### I Génération de la clé ###

for i in range (0,taille*8):	# On génère une clé de la taille des données chiffrées.
				# On multiplie par 8 pour avoir la taille en bits.

    clef.append(clef[0+i]^clef[14+i]^clef[17+i]^clef[18+i])

	# C'est ici qu'est le coeur de la génération. Comme nous avons trouvé que le
	# polynome générateur est x^19 + x^18 + x^17 + x^14 + 1, cela signifie que les
	# XORs sont sur les cellules 14, 17 et 18. On ajoute à la liste le résultat.
	# La variable "i" sert à effectuer le décalage.

### II Déchiffrement du fichier ###

index = 0	# On crée un index qui va nous permettre de boucler
		# sur l'ensemble de la clé.

for octect in data_chiffre: # On boucle sur les données chiffrées.
  octect_tmp = 0 # Variable temporaire pour stocker les 8 bits de la clé.
  for i in range(8): # On boucle pour avoir 1 octet (8 bits).
    octect_tmp <<= 1 # À chaque coup on décale vers la droite.
    octect_tmp = octect_tmp | clef[index] # Et on ajoute le nouveau bit.
    index += 1 # On incrémente l'index.
  data_dechiffre.write(bytes([octect^octect_tmp]))	# Maintenant on XOR octets à
							# octets la clé et le fichier
							# chiffré pour retrouver le fichier
							# déchiffré. On écrit dans data_dechiffre.
data_dechiffre.close() # On ferme le fichier déchiffré. On a maintenant le fichier PNG déchiffré.
```

Plus d'explications dans le MISC.
