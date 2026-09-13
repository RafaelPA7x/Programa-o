import random
mat = []
s = 0
for i in range(0, 5):
    mat.append([])
    for j in range(0, 5):
        mat[i].append(random.randint(0, 100))
print(mat)

maiores = []
for l in mat:
    maior = l[0]
    for valor in l:
        if valor > maior:
            maior = valor
    maiores.append(maior)
print(f"maiores: {maiores}")