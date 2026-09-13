def msort(vetor):
    for i in range(len(vetor) -1):
        for j in range(i+1, len(vetor)):
            if vetor[j] < vetor[i]:
                vetor[i], vetor[j] = vetor[j], vetor[i]

lista = [5, 7, 1, 3]
msort(lista)
print(lista)
