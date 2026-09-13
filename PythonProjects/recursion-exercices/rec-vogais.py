texto = "aeiou"

def conta_vogais(texto):
    vogais = "aeiou"
    contador = 0

    for i in range(len(texto)):
        for j in range(len(vogais)):
            if texto[i] == vogais[j]:
                contador += 1

    return contador

print(conta_vogais(texto))
