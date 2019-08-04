# Il est inutile de changer ce code
# C'est un challenge de cryptographie

import random

rng = random.Random()

f = open("rand_list.txt", "w")


for i in range(624):
    f.write(str(rng.getrandbits(32))+"\n")

f.close()

print("#####################################")
print("")
print("Des valeurs alétoires ont été écrite dans rand_list.txt")
print("Pouvez-vous prédire la prochaine ???")

if input() == str(rng.getrandbits(32)):
    print("ROCKYOU !!!")
