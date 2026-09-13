valor = float(input("Digite o valor do produto: "))
if valor > 0 and valor <= 2000:
    desconto = 0.03
    valor_final = valor - desconto
elif valor > 2000 and valor <= 3000:
    desconto = 0.045
    valor_final = valor - desconto
elif valor > 3000 and valor <= 5000:
    desconto = 0.05
    valor_final = valor - desconto
elif valor > 5000 and valor <= 7000:
    desconto = 0.06
    valor_final = valor - desconto
elif valor > 5000 and valor <= 7000:
    desconto = 0.07
    valor_final = valor - desconto
else:
    desconto = valor * 0.00
    valor_final = valor - desconto
    print("Valor Inválido")

print(f"Valor {valor}, desconto {desconto}, valor final {valor_final}")


valor = float(input("Digite o valor do produto: "))
if valor <= 0:
    desconto = valor * 0.00
elif valor <= 2000:
    desconto = valor * 0.03
elif valor <= 3000:
    desconto = valor * 0.045
elif valor <= 5000:
    desconto = valor * 0.05
elif valor <= 7000:
    desconto = valor * 0.06
else:
    desconto = valor * 0.07
    valor_final = valor - desconto

print(f"Valor {valor}, desconto {desconto}, valor final {valor_final}")