
vet = []
valor = int(input("Digite um Valor (digite 0 para sair): "))
while valor != 0:
    if valor % 2 == 0:
        vet.append(valor)
    valor = int(input("Digite um Valor (digite 0 para sair): "))
print(vet)