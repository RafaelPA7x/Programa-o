import random

vet = []
soma = 0

while soma < 100:
    novo = random.randint(1, 10)

    vet.append(novo)
    soma += novo

print(vet)
print(soma)
