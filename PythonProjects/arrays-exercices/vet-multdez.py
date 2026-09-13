vet = [5,10,15,20]

vetd = []
for i in range(0, len(vet)):
    if vet[i] % 10 == 0:
        vetd.append(vet[i])
print("vetor dos multiplos de 10", vetd)