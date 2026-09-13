vetor = [2,5,9,3,5,7,1]
def sort_(vetor):
    ordenado = vetor.copy()
    for i in range(len(ordenado)):
        for j in range(0, len(ordenado)-1 -i):
            if ordenado[j] > ordenado[j+1]:
                aux = ordenado[j]
                ordenado[j] = ordenado[j+1]
                ordenado[j+1] = aux
    return ordenado

print(sort_(vetor))