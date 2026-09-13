vet = [2,4,5,8,12,7,3,9,6,10]
vet2 = []
soma = 0
media = 0
for i in range(len(vet)):
    soma += vet[i]
    media = soma/len(vet)
print(media)
for i in range(len(vet)):
    if vet[i] > media:
        vet2.append(1)
    elif vet[i] < media:
        vet2.append(-1)
    else:
        vet2.append(0)
print(vet)
print(vet2)