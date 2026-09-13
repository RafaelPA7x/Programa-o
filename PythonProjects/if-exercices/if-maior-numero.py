num1 = float(input("Digite um número: "))
num2 = float(input("Digite outro número: "))
if num1 > num2:
    print(f"{num1} é maior que {num2}")
elif num2 > num1:
    print(f"{num2} é maior que {num1}")
else:
    print("Os números são iguais")
