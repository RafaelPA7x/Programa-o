import random

vet = []
while len(vet) < 100:
    n1 = random.randint(0, 100)
    if n1 % 2 == 0:
        vet.append(n1)
print(vet)