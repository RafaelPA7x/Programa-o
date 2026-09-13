print(f"{'Peso (kg)':<10} {'Altura (m)':<12} {'IMC':<8} {'Classe'}")

peso = 60
while peso <= 90:
    altura = 1.60
    while altura <= 1.90:
        imc = peso / (altura ** 2)

        if imc < 18.5:
            classe = "Abaixo do peso"
        elif imc < 25:
            classe = "Normal"
        elif imc < 30:
            classe = "Sobrepeso"
        else:
            classe = "Obesidade"

        print(f"{peso:<10} {altura:<12.2f} {imc:<8.2f} {classe}")

        altura += 0.10

    peso += 5
    
