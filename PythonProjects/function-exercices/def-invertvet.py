vetor = [2,5,9,3,5,7,1]
def invert_(vetor):
    veti = []
    x = len(vetor)
    for i in range(len(vetor) -1, -1, -1):
        veti.append(vetor[i])
    return veti
print(invert_(vetor))