salario = float(input("Informe seu salário: R$"))
if salario <= 1903.98:
    irpf = salario * 0.0
    print("Isento")
elif salario <= 2826.65:
    irpf = salario * 0.075
elif salario <= 3751.05:
    irpf = salario * 0.15
elif salario <= 4664.68:
    irpf = salario * 0.225
elif salario > 4664.68:
    irpf = salario * 0.3
print(f"você pagará {irpf:.2f} de IRPF")