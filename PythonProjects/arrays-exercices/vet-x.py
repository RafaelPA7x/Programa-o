vet = [10,20,30,40,50,60,70,80,90,100]
tam = len(vet)

for i in range(tam):
    opt = (tam- 1) - i
    for j in range(tam):
        if (j == i) or (j == opt):
            print(vet[j], end=" ")
        else:
            print(' ', end=' ')
    print('\n')