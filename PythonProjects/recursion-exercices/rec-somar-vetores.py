vet1 = [1, 2, 3]
vet2 = [4, 5, 6]

def soma_vetores(vet1, vet2):
    resultado = []

    for i in range(len(vet1)):
        resultado.append(vet1[i] + vet2[i])

    return resultado

print(soma_vetores(vet1, vet2))
