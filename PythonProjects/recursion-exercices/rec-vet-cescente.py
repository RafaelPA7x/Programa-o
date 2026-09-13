vet = [1, 2, 8, 4, 5]

def crescente(vet, i=0):
    if i == len(vet) - 1:
        return True

    if vet[i] > vet[i + 1]:
        return False

    return crescente(vet, i + 1)

print(crescente(vet))
