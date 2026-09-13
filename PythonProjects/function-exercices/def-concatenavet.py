vetor1 = [1,2,3,4]
vetor2 = [5,6,7,8,9]

def concatena_(vetor1, vetor2):
    vet3 = vetor1.copy()
    for i in range(len(vetor2)):
        a = vetor2[i]
        vet3.append(a)
    return vet3
print(concatena_(vetor1, vetor2))
