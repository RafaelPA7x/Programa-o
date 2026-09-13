
soma = 0
contador = 0
numero = float(input("Digite um número(0 para parar): "))

while (numero != 0):
    numero = float(input("Digite um número(0 para parar): "))
    soma += numero
    contador += 1
media = soma / contador
print(f"a média entre eles é {media}")


