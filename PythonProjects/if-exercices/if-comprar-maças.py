maca = int(input("Digite o número de maçãs que deseja comprar: "))
valor1 = 0.35
valor2 = 0.5
if maca < 12:
    print(f"O valor à ser pago é {valor1 * maca}")
else:
    print(f"O valor à ser pago é {valor2 * maca}")