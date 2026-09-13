vet = [1,2,3,4,5,6]

somap = 0
for i in range(0, len(vet)):
    if vet[i] % 2 == 0:
        somap += vet[i]
print("soma dos pares", somap)