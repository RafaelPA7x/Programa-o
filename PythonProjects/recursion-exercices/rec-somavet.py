vet = [40, 62, 12, 200]

def soma_vetor(vet, ind):
    if ind == len(vet) - 1:
        return vet[ind]

    return vet[ind] + soma_vetor(vet, ind + 1)

print(soma_vetor(vet, 0))
