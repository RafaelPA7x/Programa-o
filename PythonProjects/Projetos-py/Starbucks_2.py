from time import sleep

#Banco de Dados:
    #[download, upload, acessos_simultaneos, tempo_conexao, perfil]
database =  [[120, 10, 3, 250, 'P1'],
             [80, 5, 2, 180, 'P1'],
             [90, 8, 3, 200, 'P1'],
             [85, 6, 2, 190, 'P1'],
             [130, 11, 3, 270, 'P1'],
             [100, 9, 2, 210, 'P1'],
             [95, 7, 2, 195, 'P1'],
             [200, 25, 5, 400, 'P2'],
             [150, 12, 4, 320, 'P2'],
             [170, 15, 4, 350, 'P2'],
             [220, 18, 5, 410, 'P2'],
             [160, 14, 4, 330, 'P2'],
             [180, 16, 4, 370, 'P2'],
             [300, 30, 6, 500, 'P3'],
             [250, 40, 7, 600, 'P3'],
             [310, 35, 6, 520, 'P3'],
             [305, 38, 6, 510, 'P3'],
             [260, 42, 7, 580, 'P3'],
             [240, 28, 6, 460, 'P3'],
             [270, 40, 6, 590, 'P3']
             ]

# Medida de similaridade:
def similaridade(database, vet_dist):
    vet_dist = []
    for linha in database:
        conta=0
        tam=len(linha)
        for i in range(0,tam-1):
            conta+= (usuario[i] - linha[i]) **2
        distancia= conta**0.5
        vet_dist.append(distancia)
    return vet_dist

# Classificação de perfil:
def classificacao(database, vet_dist):
    min_dist = vet_dist[0]
    line = 0
    for i in range(1, len(vet_dist)):
        if vet_dist[i] < min_dist:
            min_dist = vet_dist[i]
            line = i
    return line

# Resultado:
def resultado(database, usuario, line):
    tam=len(database[line]) - 1
    position = database[line][tam]
    usuario.append(position)
    print("Classificação:".center(60))
    if position == "P1":
        print("\033[1;32mP1 — Uso Leve: navegação básica, poucos downloads e acessos pontuais.\033[0m")
    elif position == "P2":
        print("\033[1;33mP2 — Uso Moderado: streaming, videoconferências.\033[0m")
    else:
        print("\033[1;35mP3 — Uso Intenso: gamers ou usuários com grande movimentação de arquivos.\033[0m")

def creditos(linhas):
    print(60 * "=")
    for linha in linhas:
        print("\033[1;31m" + linha.center(60) + "\033[0m")
    print(60 * "=")
    print()

#Inicialização:
print(60 * "=")
print("\033[1;31m" + "Bem-vindo(a) ao Labcom!".center(60) + "\033[0m")
print(60 * "=")
sleep(1.5)

#Dados do novo usuário:
usuario = []

print("\033[1mInsira os dados do novo usuário abaixo:\033[0m".center(60))
print()

usuario = []
qtd_atributos = len(database[0]) - 1

for i in range(qtd_atributos):
    valor = float(input(f"Digite o valor do atributo {i+1}: "))
    usuario.append(valor)

#Créditos:
linhas = [
    "Pontifícia Universidade Católica do Paraná",
    "Ciência da Computação - 1º Período (Matutino)",
    "Professor André Gustavo Hochuli",
    "Devs:",
    "Caroline Nascimento",
    "Heshillen Silva",
    "Kamilla Felipe",
    "Luiz Fernandes",
    "Rafael Pereira"
]

#Execução:
vet_dist = similaridade(database, usuario)
line = classificacao(database, vet_dist)
creditos(linhas)
sleep(2)
resultado(database, usuario, line)