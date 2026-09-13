vet = [1,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0]
max = 0
atual = 0
for i in range(0,len(vet)):
    if vet[i] == 0:
        atual += 1
    else:
        if atual > max:
            max = atual
        atual = 0

if atual > max:
    max = atual
print(max)