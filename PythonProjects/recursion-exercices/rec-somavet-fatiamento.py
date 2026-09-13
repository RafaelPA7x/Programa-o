vet = [10, 20, 30, 40, 50]

def soma_vetor(vet):
    if len(vet) == 1:
        return vet[0]

    return vet[0] + soma_vetor(vet[1:])

print(soma_vetor(vet))
