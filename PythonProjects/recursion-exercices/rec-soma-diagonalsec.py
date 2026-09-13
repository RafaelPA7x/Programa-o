mat = [
    [3, 1, 1],
    [2, 3, 2],
    [1, 1, 3]
]

def soma_diagonal_secundaria(mat):
    soma = 0

    for i in range(len(mat)):
        for j in range(len(mat[i])):
            if i + j == len(mat) - 1:
                soma += mat[i][j]

    return soma

print(soma_diagonal_secundaria(mat))
