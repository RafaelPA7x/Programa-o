vet = list(range(20))
n = len(vet)
for i in range(n-1,0,-1):
    print(""*(n-i-1), end="")
    for j in range(i+1):
        print(vet[j], end=" ")
    print()