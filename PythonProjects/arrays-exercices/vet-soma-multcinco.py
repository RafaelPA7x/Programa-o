vet = [1,2,3,4,5,6,7,8,9,10]

somac = 0
for i in range(0, len(vet)):
    if vet[i] % 5 == 0:
        somac += vet[i]
print("soma dos multiplos de cinco", somac)