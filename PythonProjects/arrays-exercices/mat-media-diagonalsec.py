import random

mat = []

for i in range(5):
    mat.append([])

    for j in range(5):
        mat[i].append(random.randint(0, 100))

n = len(mat)
soma = 0

for i in range(n):
    soma += mat[i][n - 1 - i]

media = soma / n

print("Média da diagonal secundária:", media)
