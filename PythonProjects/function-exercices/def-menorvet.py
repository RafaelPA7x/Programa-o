vetor = [2,5,9,3,5,7,1]
def max_(vetor):
    menor = vetor[0]
    for i in range(1,len(vetor)):
        if vetor[i] < menor:
            menor = vetor[i]
    return menor
print(max_(vetor))



