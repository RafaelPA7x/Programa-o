def inverter(texto, i=0):
    if i == len(texto):
        return ""

    return inverter(texto, i + 1) + texto[i]

print(inverter("sabor"))
