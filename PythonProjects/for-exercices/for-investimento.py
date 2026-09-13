inv = float(input("Digite o valor investido: "))
tem = int(input("Digite o tempo, em anos, que ficará investido: "))
tax = float(input("Digite o valor de taxa em %: "))
m = inv
taxa = tax/100
for i in range(1, tem, 1):
    m *= (1 + taxa)

print(f"o montante final será de {m:.2f} reais")