import random

mat = []
for l in range(0, 4):
    mat.append([])
    for j in range(0, 3):
        mat[l].append(random.randint(0, 100))

print(mat)