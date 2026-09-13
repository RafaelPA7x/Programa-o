mat = [
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1]
]

def identidade(mat):
    for i in range(len(mat)):
        for j in range(len(mat)):
            if i == j:
                if mat[i][j] != 1:
                    return False
            else:
                if mat[i][j] != 0:
                    return False

    return True

print(identidade(mat))
