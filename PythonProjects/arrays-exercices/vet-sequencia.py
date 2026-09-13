max = 0
seq = 0

vet = []
tam = len(vet)

for i in range(0, tam - 1):
    if vet[i] + 1 == vet[i + 1]:
        seq += 1
    else:
        seq = 0

    if seq > max:
        max = seq

print(max)

        