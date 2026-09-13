#INTEGRANTES:
#Caroline Rodrigues do Nascimento; Heshillen Victoria Pires ds Silva;
#Kamilla Silva Felipe; Luiz Fernandes; Rafael Arrunategui Pereira.
#LINK DO FLUXOGRAMA:
#https://drive.google.com/file/d/13oUBA2FvX3eL0PZYo8dNLp8rM35v3TU_/view?usp=sharing

import random

print()
print("=" * 50)
print(" 🏝️ SOBREVIVÊNCIA NA ILHA 🏝️ ")
print("=" * 50)
print()

energia = 100

print("-" * 50)
print(f"Energia Atual = {energia} pontos")
print("-" * 50)

print()
print("🏝 O DESPERTAR NA ILHA 🏝")
print("-" * 50)
print()
print("Você acorda em uma ilha desrta após um naufrágio...")
print("O sol bate em sua pele, e o som das ondas quebra o silêncio.")
print("Sua última lembrança é do barco afundando durante uma tempestade.")
print("Agora, você precisa tomar decisões para garantir a sua sobrevivência.")
print("-" * 50)
print()

print("O que você deseja fazer?")
print()
print(" (1) Explorar a floresta em busca de recursos.")
print(" (2) Caminhar pela praia e procurar sinais de vida")
print()

c1 = input("Sua escolha: ").strip()
while c1 != "1" and c1 != "2":
    print("Escolha inválida. Tente novamente.")
    c1 = input("Sua escolha: ").strip()

perda = random.randint(20, 40)
energia -= perda
print()
print(f"Esse esforço te custou {perda} de energia.")
print("-" * 50)
print(f"Energia Atual = {energia} pontos")
print("-" * 50)
print()

if c1 == "1":
    print("🌲 A FLORESTA 🌲")
    print("-" * 50)
    print()
    print("Você entra na floresta e logo encontra um pequeno rio de água cristalina.")
    print("A sombra das árvores oferece um alívio do calor intenso.")
    print()

    print("O que você deseja fazer?")
    print()
    print(" (1) Beber a água do rio.")
    print(" (2) Procurar uma fonte de água mais segura.")
    print()

    c2a = input("Sua escolha: ").strip()
    while c2a != "1" and c2a != "2":
        print("Escolha inválida. Tente novamente.")
        c2a = input("Sua escolha: ").strip()

    if c2a == "1":
        continuar = True
        while continuar:
            perda = random.randint(15, 35)
            energia -= perda
            print()
            print("A água pode estar contaminada.")
            print(f"Você começa a se sentir mal, perdendo {perda} de energia.")
            print("-" * 50)
            print(f"Energia Atual = {energia} pontos")
            print("-" * 50)
            print()

            if energia <= 0:
                print("Você ficou sem energia.. Não resistiu.")
                print("Fim de Jogo.")
                continuar = False

            else:
                print("Humm, você começou a passar mal, o que deseja fazer?")

                print()
                print(" (1) Beber mais água do rio.")
                print(" (2) Procurar por outra fonte de água.")
                print()

                ou = input("Sua escolha: ").strip()
                while ou != "1" and ou != "2":
                    print("Ecolha Inválida. Tente novamente.")
                    ou = input("Sua escolha: ").strip()

                if ou == "1":
                    perda = random.randint(15, 35)
                    energia -= perda
                    print()
                    print(f"A água estava contaminada, voce perdau {perda} de energia.")

                    print("-" * 50)
                    print(f"Energia Atual = {energia} pontos")
                    print("-" * 50)

                    if energia <= 0:
                        print("Você ficou sem energia.. Não resistiu.")
                        print("Fim de Jogo")
                        continuar = False

                else:
                    ganho = random.randint(5, 15)
                    energia += ganho
                    print("Você encontrou um coqueiro e bebeu água de coco!")

                    print(f"Você recuperou {ganho} de energia.")
                    print("-" * 50)
                    print(f"Energia Atual = {energia} pontos")
                    print("-" * 50)
                    continuar = False

    else:
        ganho = random.randint(5, 15)
        energia += ganho
        print()
        print("Você encontrou um coqueiro e bebeu água de coco fresca!")
        print(f"Você recuprou {ganho} de energia.")
        print("-" * 50)
        print(f"Energia Atual = {energia} pontos")
        print("-" * 50)

elif c1 == "2":

    print()
    print("🌴 CAMINHANDO PELA PRAIA 🌴")
    print("-" * 50)
    print()
    print("Você dacide caminhar pela praia, sentindo o calor do sol e da areia sob seus pés.")
    print("Você tambḿ começa a sentir fome e cansaço")
    print()

    print(" (1) Caçar ou Pescar")
    print(" (2) Procurar Frutas")
    print()

    c2b = input("Sua escolha: ").strip()
    while c2b != "1" and c2b != "2":
        print("Escolha Inválida. Tente novamente.")
        c2b = input("Sua escolha: ").strip()

    if c2b == "1":
        perda = random.randint(15, 35)
        energia -= perda
        print()
        print("Você tenta pescar ou caçar, mas nao conseguiu nada..")
        print(f"{perda} de energia desperdiçada.")
        print("-" * 50)
        print(f"Energia Atual = {energia} pontos")
        print("-" * 50)
    else:
        ganho = random.randint(10, 25)
        energia += ganho
        print()
        print("Você encontrou algumas frutas!")
        print(f"{ganho} de energia recuperados")
        print("-" * 50)
        print(f"Energia Atual = {energia} pontos")
        print("-" * 50)
        print()

if energia > 0:

    print("🌙 A NOITE CHEGA 🌙")
    print("-" * 50)
    print()
    print("O sol começa a se pôr, e a temperatura cai rapidamente.")
    print("O vento aumenta, e você sabe que deve se preparar para a noite")
    print("Após um tempo, você encontra destroços do barco, incluindo madeira, cordas e pedaços de tecido")
    print()
    print(" (1) Construir um abrigo")
    print(" (2) Acender uma fogueira")
    print()

    c3 = input("Sua escolha: ").strip()
    while c3 != "1" and c3 != "2":
        print("Escolha Inválida. Tente novamente.")
        c3 = input("Sua escolha: ").strip()

    print()

    if c3 == "1":
        perda = random.randint(15, 30)
        energia -= perda
        print("Você consegue construir um abrigo.")
        print(f"Gasta {perda} de energia para isso.")
        print("Pela manhã, pescadores da ilha o encontram e decidem ajuda-lo.")

    else:
        perda = random.randint(5, 15)
        energia -= perda
        print("Você consegue acender uma fogueira.")
        print(f"Gasta {perda} de energia para isso.")
        print("Um navio distante vê a fumaça e envia uma equipe de resgate rapidamente.")


    print("-" * 50)
    print(f"Energia Atual = {energia} pontos")
    print("-" * 50)

    print()
    print("=" * 50)
    print("🛟 RESGATE! 🛟")
    print("=" * 50)
    print()

    if energia > 70:
        print("🥇 FINAL ALEGRE 🥇")
        print("-" * 50)
        print("O resgate chega!")
        print("você está tão bem que dá até para dar autógrafos para os socorristas.")
        print("Até parce que esteve em um SPA pode dias!")

    elif energia >= 30:
        print("🥈 FINAL IRÔNICO 🥈")
        print("-" * 50)
        print("O resgate chega!")
        print("Mas você está tão fraco que mal consegue fazer uma piada.")
        print("Você sobreviveu, mas está parecendo mais um zumbi do que um herói.")

    elif energia > 0:
        print("🥉 FINAL SURREAL 🥉")
        print("-" * 50)
        print("O resgate chega!")
        print("Mas você mal consegue se levantar, até acha que o socorro é só mais um pesadelo.")
        print("Vai prcisar de muitos cafés para voltar à vida normal.")

    else:
        print("💀 Final Triste 💀")
        print("O resgate chega tarde")
        print("Você gastou tanta energia, que não resistiu..")
        print("Fim de Jogo")

    print("-" * 50)
    print(f"Energia Final: {energia}")
    print("-" * 50)
    print()
    print("=" * 50)
    print(" 🏝️ Obrigado por Jogar! 🏝️")
    print("=" * 50)










