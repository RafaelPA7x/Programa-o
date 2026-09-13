import random

mat = []

for i in range(5):
    mat.append([])

    for j in range(5):
        mat[i].append(random.randint(0, 100))

colunas = len(mat[0])
soma = [0] * colunas

for linha in mat:
    for j in range(colunas):
        soma[j] += linha[j]

print("Matriz:", mat)
print("Soma das colunas:", soma)
