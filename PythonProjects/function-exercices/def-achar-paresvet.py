vetor = [10,11,12,13,14]

def pares(vetor):
    vetp = []
    for i in range(len(vetor)):
        if vetor[i] % 2 == 0:
            vetp.append(i)
    return vetp
print(pares(vetor))