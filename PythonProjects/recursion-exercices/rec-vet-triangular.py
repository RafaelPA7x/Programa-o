vet = [1, 2, 3, 4, 5, 6, 7, 8]

n = len(vet)

for i in range(n):
    for j in range(i + 1):
        print(vet[j], end=" ")

    print()

for i in range(n - 1, 0, -1):
    for j in range(i):
        print(vet[j], end=" ")

    print()
