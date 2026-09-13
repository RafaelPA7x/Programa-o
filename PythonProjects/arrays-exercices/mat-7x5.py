import random

matriz = []

for i in range(7):
    linha = []

    for j in range(5):
        linha.append(random.randint(1, 9))

    matriz.append(linha)

print("Matriz 7x5:")

for i in range(7):
    for j in range(5):
        print(matriz[i][j], end="\t")

    print()
