branco = 0
maiusculos = 0
especiais = 0

frase = "O dIa esT@ mUit0 Bon1t0"
for caracter in frase:
    if ord(caracter) == ord(" "):
        branco += 1
    elif ord("A") <= ord(caracter) <= ord("Z"):
        maiusculos += 1
    elif not (ord("a") <= ord(caracter) <= ord("z")) and not (ord("0") <= ord(caracter) <= ord("9")):
        especiais += 1
print(frase)
print(f"branco {branco}")
print(f"mauisculos {maiusculos}")
print(f" especiais {especiais}")
