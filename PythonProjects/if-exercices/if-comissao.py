venda = float(input("Digite o valor da venda: "))
if venda <= 0:
        comissao = venda * 0
elif venda <= 100:
        comissao = venda * 0.05
elif venda <= 500:
        comissao = venda * 0.06
elif venda <= 1000:
        comissao = venda * 0.07
elif venda > 1000:
        comissao = venda * 0.08
print(f"o vendedor recebe {comissao} de comissao por suas vendas")