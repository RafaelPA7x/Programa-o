p1 = input("O evento é profissonal ou lazer? ")
p2 = input("É com amigos ou família? ")
p3 = input("Faz calor ou frio? ")
p4 = input("O ambiente do evento é rural ou urbano? ")
p5 = input("O local é fechado ou aberto? ")

if p1 == "profissional":
    if p3 == "frio":
        print("Terno completo e casaco")
    elif p3 == "calor":
        if p4 == "rural" or p5 == "aberto":
            print("Camisa manga curta de linho ou polo e calça sarja fina ou bermuda social")