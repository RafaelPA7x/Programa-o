vetor = [1,2,3,4,5]

def dev_(vetor):
    soma = 0
    for i in range(len(vetor)):
        soma += vetor[i]
    media = soma / len(vetor)

    soma2 = 0
    for j in range(len(vetor)):
        soma2 += (j - media) **2

    variancia = soma2 / len(vetor)
    desvio = variancia ** 0.5

    return media, desvio
print(dev_(vetor))