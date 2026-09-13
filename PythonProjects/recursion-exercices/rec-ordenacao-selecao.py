vet = [2, 1, 3, 5, 4]

def ordenar(vet, i=0):
    if i == len(vet) - 1:
        return vet

    menor = i

    for j in range(i + 1, len(vet)):
        if vet[j] < vet[menor]:
            menor = j

    vet[i], vet[menor] = vet[menor], vet[i]

    return ordenar(vet, i + 1)

print(ordenar(vet))
