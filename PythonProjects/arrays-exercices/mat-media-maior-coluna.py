import random

matriz = []

for i in range(7):
    linha = []

    for j in range(5):
        linha.append(random.randint(1, 9))

    matriz.append(linha)

for col in range(5):
    soma = 0
    maior = matriz[0][col]

    for linha in range(7):
        soma += matriz[linha][col]

        if matriz[linha][col] > maior:
            maior = matriz[linha][col]

    media = soma / 7

    print(
        "Coluna", col + 1,
        ": Média =", round(media, 2),
        ", Maior =", maior
    )
