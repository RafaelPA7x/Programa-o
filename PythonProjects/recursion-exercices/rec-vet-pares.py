vet = [2, 3, 6, 3, 4]

def conta_pares(vet):
    contador = 0

    for i in range(len(vet)):
        if vet[i] % 2 == 0:
            contador += 1

    return contador

print(conta_pares(vet))
