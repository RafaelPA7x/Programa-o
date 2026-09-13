import ddf.minim.*;

PImage fundo;
PImage fundoDigitacao;
PImage fundoMultipla;
PFont fonteImpact;

// procarionte
PImage procarionte, citoplasmaP, membrana_plasmatica, parede_celularP;
PImage capsula, flagelo, ribossomos, plasmideos, fimbrias, nucleoide;

// animal
PImage celula, nucleo, nucleolo, mitocondria, golgi, rugoso, liso;
PImage lisossomo, centriolo, bicamada, citoplasma, citoesqueleto;

// vegetal
PImage eucarionte_veg, parede_celular, cloroplasto, vacuolo_central;
PImage RER, REL, nucleo_veg, mitocondria_veg, golgi_veg;

Minim minim;
AudioPlayer player;
AudioPlayer somErro;
AudioPlayer somAcerto;

// menu
float bx = 390, by = 220, bw = 500, bh = 90, espacamento = 120;

// estado
// 0=menu | 1=procarionte | 2=vegetal | 3=animal | 4=quiz digitação | 5=quiz múltipla escolha
int estado = 0;
int ultimoEstado = 1;
int parteAtual = 0;

// coisas da procarionte
String[] nomesP = {
  "Citoplasma", "Membrana Plasmática", "Parede Celular",
  "Cápsula", "Flagelo", "Ribossomos",
  "Plasmídeos", "Fímbrias", "Nucleóide"
};
String[] funcoesP = {
  "Meio interno onde ocorrem as reações químicas vitais da célula.",
  "Controla a entrada e saída de substâncias na célula.",
  "Estrutura rígida que protege e dá forma à célula bacteriana.",
  "Camada protetora externa, protege de fagocitose e ressecamento.",
  "Estrutura filamentosa usada para locomoção da bactéria.",
  "Produzem proteínas a partir das informações do DNA.",
  "Pequenos círculos de DNA extra que conferem vantagens adaptativas.",
  "Filamentos que auxiliam na adesão a superfícies e outras células.",
  "Região onde fica o DNA circular da bactéria, sem membrana nuclear."
};

// coisas da animal
String[] nomesA = {
  "Núcleo", "Nucléolo", "Mitocôndria", "Complexo de Golgi",
  "Ret. Endo. Rugoso", "Ret. Endo. Liso", "Lisossomo",
  "Centríolo", "Bicamada Lipídica", "Citoplasma", "Citoesqueleto"
};
String[] funcoesA = {
  "Centro de controle celular, contém o DNA com as informações genéticas.",
  "Produz ribossomos e participa da síntese de RNA ribossomal.",
  "Produz energia (ATP) através da respiração celular aeróbica.",
  "Processa e empacota proteínas para secreção ou uso interno.",
  "Síntese de proteínas destinadas à secreção ou membranas celulares.",
  "Síntese de lipídios e detoxificação de substâncias na célula.",
  "Digere resíduos, organelas velhas e substâncias estranhas.",
  "Organiza o fuso mitótico durante a divisão celular.",
  "Controla a entrada e saída de substâncias, mantém a homeostase.",
  "Meio aquoso onde ficam os orgânulos e ocorrem reações químicas.",
  "Rede de proteínas que dá forma e suporte mecânico à célula."
};

// coisas da vegetal
String[] nomesV = {
  "Cloroplasto", "Vacúolo Central", "Ret. Endo. Rugoso",
  "Ret. Endo. Liso", "Núcleo", "Mitocôndria",
  "Complexo Golgiense", "Parede Celular"
};
String[] funcoesV = {
  "Realiza a fotossíntese, convertendo luz solar em glicose.",
  "Armazena água, sais e pigmentos; mantém a turgidez da célula.",
  "Síntese de proteínas destinadas à secreção ou membranas.",
  "Síntese de lipídios e detoxificação de substâncias.",
  "Centro de controle celular, contém o DNA genético.",
  "Produz energia (ATP) pela respiração celular aeróbica.",
  "Processa e empacota proteínas para secreção ou uso interno.",
  "Estrutura rígida de celulose que protege e dá forma à célula."
};

// variaveis
String[] nomesAtivos;
String[] funcoesAtivos;
String nomeCelula = "";

// painel
float px = 200, py = 160, pw = 430, ph = 430;
float ix = 700, iy = 160, iw = 380, ih = 340;

// quiz dos outros
String texto = "";
String resultado = "";
String respostaCorreta = "";
int pontosDigitacao = 0;
int tentativas = 0;
int tempoRespostaD = 0;
int telaQuiz = 0;
boolean esperando = false;
boolean fimQuizDigitacao = false;
boolean caixativa = false;

String[][] respostasDigitacao = {
  {"Citoplasma", "citoplasma"},
  {"Membrana Plasmática", "membrana plasmática", "membrana plasmatica"},
  {"Parede Celular", "parede celular"},
  {"Cápsula", "cápsula", "capsula"},
  {"Flagelo", "flagelo"},
  {"Ribossomos", "ribossomos", "ribossomo"},
  {"Plasmídeos", "plasmídeos", "plasmideos", "plasmideo", "plasmídeo"},
  {"Fímbrias", "fímbrias", "fimbrias"},
  {"Nucleóide", "nucleóide", "nucleoide"},
  {"Núcleo", "núcleo", "nucleo"},
  {"Nucléolo", "nucléolo", "nucleolo"},
  {"Mitocôndria", "mitocondria", "mitocondrias"},
  {"Complexo de Golgi", "complexo de golgi", "complexo golgiense", "golgi"},
  {"Retículo Endoplasmático Rugoso", "reticulo endoplasmatico rugoso", "rer"},
  {"Retículo Endoplasmático Liso", "reticulo endoplasmatico liso", "rel"},
  {"Lisossomo", "lisossomo", "lisossomos"},
  {"Centríolo", "centríolo", "centriolo"},
  {"Membrana Plasmática", "membrana plasmática", "bicamada fosfolipidica", "membrana plasmatica"},
  {"Citoplasma", "citoplasma"},
  {"Citoesqueleto", "citoesqueleto"},
  {"Cloroplasto", "cloroplasto"},
  {"Vacúolo Central", "vacúolo central", "vacuolo central"},
  {"Retículo Endoplasmático Rugoso", "reticulo endoplasmatico rugoso", "rer"},
  {"Retículo Endoplasmático Liso", "reticulo endoplasmatico liso", "rel"},
  {"Núcleo", "núcleo", "nucleo"},
  {"Mitocôndria", "mitocôndria", "mitocondrias", "mitocondria"},
  {"Complexo de Golgi", "complexo de golgi", "complexo golgiense"},
  {"Parede Celular", "parede celular"}
};

// meu quiz
int perguntaAtual = 0;
int respostaSelecionada = -1;
boolean mostrandoFeedback = false;
int tempoFeedback = 0;
int duracaoFeedback = 90;
int pontuacaoMultipla = 0;
float brilhoAlpha = 0;
float brilhoDir = 5;
boolean fimQuizMultipla = false;

float sx, sy;
int pergX, pergY, pergW, pergH;
int altXA, altXB, altY1, altY2;
int altWEsq, altWDir, altH;

int pergX_orig = 260, pergY_orig = 240, pergW_orig = 970, pergH_orig = 200;
int altXA_orig = 228, altXB_orig = 662;
int altY1_orig = 423, altY2_orig = 553;
int altWEsq_orig = 410, altWDir_orig = 390, altH_orig = 113;

String[] perguntas = {
  "1-Qual estrutura está presente nas células eucariontes,\nmas não nas procariontes?",
  "2-Qual estrutura é encontrada apenas na célula vegetal?",
  "3-Qual organela realiza a fotossíntese?",
  "4-As células procariontes pertencem principalmente a:",
  "5-Qual estrutura está presente em células animais\ne vegetais?",
  "6-Qual célula geralmente possui vacúolo central grande?",
  "7-O material genético das procariontes fica:",
  "8-Qual estrutura ajuda na locomoção de algumas\nbactérias?",
  "9-Qual destas estruturas NÃO está presente na\ncélula animal?",
  "10-Qual é uma característica das células eucariontes?"
};

String[][] alternativas = {
  {"Ribossomo", "Membrana plasmática", "Núcleo", "Citoplasma"},
  {"Parede celular", "Núcleo", "Membrana plasmática", "Ribossomo"},
  {"Mitocôndria", "Cloroplasto", "Complexo de Golgi", "Lisossomo"},
  {"Animais", "Plantas", "Fungos", "Bactérias"},
  {"Cloroplasto", "Parede celular", "Núcleo", "Cápsula"},
  {"Animal", "Procarionte", "Vegetal", "Bacteriana"},
  {"No núcleo", "No nucléolo", "Na mitocôndria", "No nucleoide"},
  {"Flagelo", "Cloroplasto", "Vacúolo", "Lisossomo"},
  {"Núcleo", "Mitocôndria", "Cloroplasto", "Ribossomo"},
  {"Não possuem DNA", "Não possuem membrana\nplasmática", "Possuem núcleo\ndefinido", "Não possuem\nribossomos"}
};

int[] respostasMultipla = {2, 0, 1, 3, 2, 2, 3, 0, 2, 2};

void setup() {
  size(1280, 720);
  smooth();
  textFont(createFont("TitanOne-Regular.ttf", 80));
  fonteImpact = createFont("impact.ttf", 60);

  fundo          = loadImage("cito_materia.png");
  fundoDigitacao = loadImage("Background_citoapp.png");
  fundoMultipla  = loadImage("LayoutCITO.png");
  fundoMultipla.resize(1280, 720);

  // Procarionte
  procarionte         = loadImage("Procarionte.png");
  citoplasmaP         = loadImage("citoplasmaP.png");
  membrana_plasmatica = loadImage("membrana plasmatica.png");
  parede_celularP     = loadImage("parede celularP.png");
  capsula             = loadImage("capsula.png");
  flagelo             = loadImage("flagelo.png");
  ribossomos          = loadImage("ribossomos.png");
  plasmideos          = loadImage("plasmideos.png");
  fimbrias            = loadImage("fimbrias.png");
  nucleoide           = loadImage("nucleoide.png");

  // Animal
  celula        = loadImage("Eucarionte Animal1.png");
  nucleo        = loadImage("nucleoA.png");
  nucleolo      = loadImage("nucleoloA.png");
  mitocondria   = loadImage("mitocondria.png");
  golgi         = loadImage("golgi.png");
  rugoso        = loadImage("rugoso.png");
  liso          = loadImage("liso.png");
  lisossomo     = loadImage("lisossomo.png");
  centriolo     = loadImage("centriolo.png");
  bicamada      = loadImage("bicamada.png");
  citoplasma    = loadImage("citoplasma.png");
  citoesqueleto = loadImage("citoesqueleto.png");

  // Vegetal
  eucarionte_veg  = loadImage("eucarionte_veg.png");
  parede_celular  = loadImage("parede_celular.png");
  cloroplasto     = loadImage("cloroplasto.png");
  vacuolo_central = loadImage("vacuolo_central.png");
  RER             = loadImage("RER.png");
  REL             = loadImage("REL.png");
  nucleo_veg      = loadImage("nucleo_veg.png");
  mitocondria_veg = loadImage("mitocondrias_veg.png");
  golgi_veg       = loadImage("golgi_veg.png");

  // Som
  minim     = new Minim(this);
  player    = minim.loadFile("som_click.mp3");
  somErro   = minim.loadFile("Rerrada.mp3");
  somAcerto = minim.loadFile("Rcerta.mp3");

  // Escala múltipla escolha
  sx = 1280.0 / 1280.0;
  sy = 720.0  / 720.0;
  pergX   = round(pergX_orig   * sx);
  pergY   = round(pergY_orig   * sy);
  pergW   = round(pergW_orig   * sx);
  pergH   = round(pergH_orig   * sy);
  altXA   = round(altXA_orig   * sx);
  altXB   = round(altXB_orig   * sx);
  altY1   = round(altY1_orig   * sy);
  altY2   = round(altY2_orig   * sy);
  altWEsq = round(altWEsq_orig * sx);
  altWDir = round(altWDir_orig * sx);
  altH    = round(altH_orig    * sy);
}

void draw() {
  if (estado == 0) {
    image(fundo, 0, 0, width, height);
    desenharMenu();
  } else if (estado == 4) {
    desenharTelaDigitacao();
  } else if (estado == 5) {
    desenharTelaMultipla();
  } else {
    image(fundo, 0, 0, width, height);
    desenharTelaCelula();
  }
}
void desenharMenu() {
  desenharBotao(bx, by,                   bw, bh, color(#71F2FF), "Célula Procarionte");
  desenharBotao(bx, by + espacamento,     bw, bh, color(#71FFD3), "Eucarionte Vegetal");
  desenharBotao(bx, by + espacamento * 2, bw, bh, color(#71A1FF), "Eucarionte Animal");
}

void desenharTelaCelula() {
  noStroke(); fill(0, 30);
  rect(px + 6, py + 6, pw, ph, 25);
  fill(255, 255, 255, 200);
  stroke(255); strokeWeight(2);
  rect(px, py, pw, ph, 25);
  noStroke();

  if (estado == 1) desenharImagensProcar();
  if (estado == 2) desenharImagensVegetal();
  if (estado == 3) desenharImagensAnimal();

  noStroke(); fill(0, 30);
  rect(ix + 6, iy + 6, iw, ih, 25);
  fill(255, 255, 255, 210);
  stroke(255); strokeWeight(2);
  rect(ix, iy, iw, ih, 25);
  noStroke();

  color corAtual = obterCorCelula();
  fill(corAtual); noStroke();
  rect(ix, iy, iw, 50, 25, 25, 0, 0);

  textFont(createFont("TitanOne-Regular.ttf", 17));
  textAlign(LEFT, CENTER);
  fill(255, 255, 255, 220);
  text("PARTE " + (parteAtual + 1) + " / " + nomesAtivos.length, ix + 16, iy + 25);

  textFont(createFont("TitanOne-Regular.ttf", 28));
  textAlign(CENTER, CENTER);
  fill(0, 40);
  text(nomesAtivos[parteAtual], ix + iw/2 + 2, iy + 85 + 2);
  stroke(0); strokeWeight(3); fill(50, 50, 70);
  text(nomesAtivos[parteAtual], ix + iw/2, iy + 85);
  noStroke();

  stroke(corAtual); strokeWeight(2);
  line(ix + 20, iy + 115, ix + iw - 20, iy + 115);
  noStroke();

  textFont(createFont("TitanOne-Regular.ttf", 17));
  textAlign(LEFT, TOP);
  fill(80, 80, 100);
  textLeading(24);
  text(funcoesAtivos[parteAtual], ix + 18, iy + 128, iw - 36, 180);

  float navY = iy + ih + 14;
  boolean temAnt  = parteAtual > 0;
  boolean temProx = parteAtual < nomesAtivos.length - 1;
  desenharBotaoNav(ix,             navY, "<- Anterior", corAtual, temAnt);
  desenharBotaoNav(ix + iw/2 + 5, navY, "Proximo ->",  corAtual, temProx);

  float qx = ix, qy = navY + 58, qw = iw, qh = 52;
  noStroke(); fill(0, 30);
  rect(qx + 4, qy + 4, qw, qh, 22);
  fill(#FF6B9D); stroke(255); strokeWeight(3);
  rect(qx, qy, qw, qh, 22);
  textFont(createFont("TitanOne-Regular.ttf", 24));
  textAlign(CENTER, CENTER);
  fill(0, 50);
  text("Ir para o Quiz", qx + qw/2 + 2, qy + qh/2 + 2);
  stroke(0); strokeWeight(4); fill(255);
  text("Ir para o Quiz", qx + qw/2, qy + qh/2);
  noStroke();

  float dotY = py + ph + 20;
  float dotStart = px + pw/2 - (nomesAtivos.length * 22) / 2;
  for (int i = 0; i < nomesAtivos.length; i++) {
    if (i == parteAtual) {
      fill(corAtual); stroke(255); strokeWeight(2);
      ellipse(dotStart + i * 26, dotY, 16, 16);
    } else {
      fill(200, 200, 220, 180); noStroke();
      ellipse(dotStart + i * 26, dotY, 11, 11);
    }
  }
  noStroke();
  desenharBotaoVoltar();
}

void desenharTelaDigitacao() {
  if (telaQuiz >= respostasDigitacao.length) {
  fimQuizDigitacao = true;
  return;
}
  image(fundoDigitacao, 0, 0, width, height);

  // Imagens
  if (telaQuiz < 9) {
    image(procarionte, 158, 185, 450, 354);
    PImage[] c = {citoplasmaP, membrana_plasmatica, parede_celularP,
                  capsula, flagelo, ribossomos, plasmideos, fimbrias, nucleoide};
    image(c[telaQuiz], 158, 185, 450, 354);

 } else if (telaQuiz < 20) {
    image(celula, 188, 180, 380, 380);
    PImage[] c = {nucleo, nucleolo, mitocondria, golgi, rugoso,
                  liso, lisossomo, centriolo, bicamada, citoplasma, citoesqueleto};
    image(c[telaQuiz - 9], 188, 180, 380, 380);

  } else {
    image(eucarionte_veg, 120, 150, 500, 400);
    PImage[] c = {cloroplasto, vacuolo_central, RER, REL,
                  nucleo_veg, mitocondria_veg, golgi_veg, parede_celular};
    image(c[telaQuiz - 20], 120, 150, 500, 400);
  }

  // Texto digitado
  textFont(fonteImpact);
  fill(0); textSize(34);
  textAlign(LEFT, TOP);
  text(texto, 650, 350);

  // Pontos e tentativas
  fill(30, 120, 255); textSize(20);
  text("Pontos: " + pontosDigitacao, 160, 105);
  fill(0);
  text("Tentativa: " + tentativas + "/3", 160, 135);

  // cursor
  textSize(34); fill(0);
  if (caixativa && frameCount % 6 < 3)
    text("|", 650 + textWidth(texto), 350);

  // Feedback
  if (resultado.equals("Correto!")) {
    fill(90, 210, 120); textSize(28);
    text(resultado, 810, 520);
  } else if (resultado.equals("Incorreto!")) {
    fill(220, 70, 70); textSize(28);
    text(resultado, 810, 520);
    fill(0); textSize(28);
    text(respostaCorreta, 650, 350);
  }

  // Fim do quiz digitação
  if (fimQuizDigitacao) {
    fill(30, 120, 255); textSize(32);
    text("Ir para o Quiz Final ->", 580, 485);
    textSize(22);
    text("Total de pontos: " + pontosDigitacao, 580, 520);
  }

  // troca automática
  if (esperando && millis() - tempoRespostaD > 800) {
    telaQuiz++;
    texto = ""; resultado = ""; respostaCorreta = "";
    tentativas = 0; esperando = false;
    if (telaQuiz >= respostasDigitacao.length) {
      fimQuizDigitacao = true;
    }
  }
}

void desenharTelaMultipla() {
  image(fundoMultipla, 0, 0);

  // fim do meu quiz
  if (fimQuizMultipla) {
    fill(30, 50, 120);
    textSize(round(32 * sy));
    textAlign(CENTER, CENTER);
    text("Quiz finalizado!", width/2, height/2 - 40);
    text("Pontuação final: " + pontuacaoMultipla + "/" + perguntas.length, width/2, height/2 + 10);
    return;
  }

  // pergunta
  fill(30, 50, 120);
  textSize(round(25 * sy));
  textAlign(LEFT, TOP);
  text(perguntas[perguntaAtual], pergX, pergY, pergW, pergH);

  // placar
  textSize(round(16 * sy));
  textAlign(RIGHT, TOP);
  text("Questão " + (perguntaAtual + 1) + "/" + perguntas.length, width - 20, 10);

  // pontuação
  fill(0, 150, 80);
  text("Pontuação: " + pontuacaoMultipla + "/" + perguntas.length, width - 20, 30);

  // Alternativas
  desenharBotaoMultipla(0, altXA, altY1, altWEsq);
  desenharBotaoMultipla(1, altXB, altY1, altWDir);
  desenharBotaoMultipla(2, altXA, altY2, altWEsq);
  desenharBotaoMultipla(3, altXB, altY2, altWDir);

  // Brilho correta quando erra
  if (mostrandoFeedback && respostaSelecionada != respostasMultipla[perguntaAtual]) {
    brilhoAlpha += brilhoDir;
    if (brilhoAlpha >= 180 || brilhoAlpha <= 60) brilhoDir *= -1;
  }

  // Avança pergunta
  if (mostrandoFeedback) {
    tempoFeedback++;
    if (tempoFeedback >= duracaoFeedback) {
      mostrandoFeedback = false;
      tempoFeedback = 0;
      respostaSelecionada = -1;
      brilhoAlpha = 0;
      brilhoDir = 5;
      perguntaAtual++;
      if (perguntaAtual >= perguntas.length) {
        fimQuizMultipla = true;
      }
    }
  }
}

void desenharBotaoMultipla(int idx, int x, int y, int largura) {
  boolean correto    = (idx == respostasMultipla[perguntaAtual]);
  boolean selecionado = (idx == respostaSelecionada);
  boolean hover = !mostrandoFeedback &&
                  mouseX >= x && mouseX <= x + largura &&
                  mouseY >= y && mouseY <= y + altH;

  noStroke();
  if (mostrandoFeedback) {
    if (selecionado && !correto)   fill(255, 80, 80, 120);
    else if (correto)              fill(0, 220, 100, brilhoAlpha);
    else                           fill(255, 255, 255, 0);
  } else {
    fill(hover ? color(210, 230, 255, 160) : color(255, 255, 255, 0));
  }
  rect(x, y, largura, altH, round(40 * sy));

  if (mostrandoFeedback) {
    if (selecionado && !correto) { stroke(220, 30, 30); strokeWeight(5); }
    else if (correto)            { stroke(0, 210, 80);  strokeWeight(3); }
    else                           noStroke();
    noFill();
    rect(x, y, largura, altH, round(40 * sy));
    noStroke();
  }

  fill(30, 50, 120);
  textSize(round(22 * sy));
  textAlign(LEFT, CENTER);
  text(alternativas[perguntaAtual][idx], x + round(102 * sx), y + altH / 2);
}

void desenharImagensProcar() {
  float imgX = px + pw/2 - 200, imgY = py + ph/2 - 160;
  image(procarionte, imgX, imgY, 400, 320);
  PImage[] camadas = {citoplasmaP, membrana_plasmatica, parede_celularP,
    capsula, flagelo, ribossomos, plasmideos, fimbrias, nucleoide};
  image(camadas[parteAtual], imgX, imgY, 400, 320);
}

void desenharImagensAnimal() {
  float imgX = px + pw/2 - 175, imgY = py + ph/2 - 175;
  image(celula, imgX, imgY, 350, 350);
  PImage[] camadas = {nucleo, nucleolo, mitocondria, golgi, rugoso,
    liso, lisossomo, centriolo, bicamada, citoplasma, citoesqueleto};
  image(camadas[parteAtual], imgX, imgY, 350, 350);
}

void desenharImagensVegetal() {
  float imgX = px + pw/2 - 210, imgY = py + ph/2 - 180;
  image(eucarionte_veg, imgX, imgY, 420, 360);
  PImage[] camadas = {cloroplasto, vacuolo_central, RER, REL,
    nucleo_veg, mitocondria_veg, golgi_veg, parede_celular};
  image(camadas[parteAtual], imgX, imgY, 420, 360);
}

color obterCorCelula() {
  if (estado == 1) return color(#71F2FF);
  if (estado == 2) return color(#71FFD3);
  return color(#71A1FF);
}

void desenharBotao(float x, float y, float w, float h, color c, String texto) {
  noStroke(); fill(0, 25);
  rect(x + 5, y + 5, w, h, 35);
  fill(c); stroke(255); strokeWeight(3);
  rect(x, y, w, h, 35);
  fill(255); stroke(0); strokeWeight(5);
  textFont(createFont("TitanOne-Regular.ttf", 28));
  textSize(28); textAlign(CENTER, CENTER);
  text(texto, x + w/2, y + h/2);
  noStroke();
}

void desenharBotaoNav(float x, float y, String txt, color c, boolean ativo) {
  float w = iw/2 - 5, h = 46;
  noStroke(); fill(0, ativo ? 28 : 10);
  rect(x + 4, y + 4, w, h, 18);
  fill(ativo ? c : color(200));
  stroke(255); strokeWeight(2);
  rect(x, y, w, h, 18);
  textFont(createFont("TitanOne-Regular.ttf", 18));
  textAlign(CENTER, CENTER);
  fill(0, 60); text(txt, x + w/2 + 1, y + h/2 + 1);
  stroke(0); strokeWeight(3);
  fill(ativo ? color(50) : color(150));
  text(txt, x + w/2, y + h/2);
  noStroke();
}

void desenharBotaoVoltar() {
  float x = width - 105, y = 15, tam = 80;
  noStroke(); fill(0, 25);
  rect(x + 4, y + 4, tam, tam, 25);
  fill(255, 190, 190); stroke(255); strokeWeight(3);
  rect(x, y, tam, tam, 25);
  textFont(createFont("TitanOne-Regular.ttf", 36));
  textAlign(CENTER, CENTER); fill(70);
  text("<-", x + tam/2, y + tam/2 - 2);
  noStroke();
}

void mousePressed() {

  player.rewind();
  player.play();


  // menu
 if (estado == 0) {
  if (mouseX > bx && mouseX < bx + bw) {

    if (mouseY > by && mouseY < by + bh) {
      player.rewind();
      player.play();
      entrarCelula(1);
    }

    else if (mouseY > by + espacamento && mouseY < by + espacamento + bh) {
      player.rewind();
      player.play();
      entrarCelula(2);
    }

    else if (mouseY > by + espacamento*2 && mouseY < by + espacamento*2 + bh) {
      player.rewind();
      player.play();
      entrarCelula(3);
    }
  }
  return;
}

  // quiz celulas
  if (estado == 4) {
    // Ir para quiz múltipla ao fim
    if (fimQuizDigitacao) {
      if (mouseX > 580 && mouseX < 1050 && mouseY > 470 && mouseY < 510) {
        estado = 5;
        perguntaAtual = 0;
        pontuacaoMultipla = 0;
        respostaSelecionada = -1;
        mostrandoFeedback = false;
        fimQuizMultipla = false;
      }
      return;
    }
    // Caixa de digitaçao
    if (mouseX > 626 && mouseX < 1098 && mouseY > 279 && mouseY < 376)
      caixativa = true;
    else
      caixativa = false;
    // Botão confirmar
    if (mouseX > 612 && mouseX < 1131 && mouseY > 440 && mouseY < 495) {
      player.rewind(); player.play();
      validarRespostaDigitacao();
    }
    return;
  }

  // meu quiz
  if (estado == 5) {
    if (fimQuizMultipla || mostrandoFeedback) return;
    player.rewind(); player.play();
    int[][] boxes = {{altXA, altY1}, {altXB, altY1}, {altXA, altY2}, {altXB, altY2}};
    int[] larguras = {altWEsq, altWDir, altWEsq, altWDir};
    for (int i = 0; i < 4; i++) {
      if (mouseX >= boxes[i][0] && mouseX <= boxes[i][0] + larguras[i] &&
          mouseY >= boxes[i][1] && mouseY <= boxes[i][1] + altH) {
        respostaSelecionada = i;
        mostrandoFeedback = true;
        tempoFeedback = 0;
        brilhoAlpha = 60;
        if (i == respostasMultipla[perguntaAtual]) {
          pontuacaoMultipla++;
          somAcerto.rewind(); somAcerto.play();
        } else {
          somErro.rewind(); somErro.play();
        }
        break;
      }
    }
    return;
  }

  // botao de voltar
  float vx = width - 105, vy = 15, vtam = 80;
  if (mouseX > vx && mouseX < vx + vtam && mouseY > vy && mouseY < vy + vtam) {
    estado = 0;
    parteAtual = 0;
    return;
  }

  // tela celula
  if (estado >= 1 && estado <= 3) {
    float navY = iy + ih + 14;
    float w = iw/2 - 5, h = 46;

    // Anterior
    if (mouseX > ix && mouseX < ix + w && mouseY > navY && mouseY < navY + h) {
      if (parteAtual > 0) parteAtual--;
      return;
    }
    // Próximo
    if (mouseX > ix + iw/2 + 5 && mouseX < ix + iw && mouseY > navY && mouseY < navY + h) {
      if (parteAtual < nomesAtivos.length - 1) parteAtual++;
      return;
    }
    // Botão Quiz
    float qy = navY + 58, qh = 52;
    if (mouseX > ix && mouseX < ix + iw && mouseY > qy && mouseY < qy + qh) {
      estado = 4;
      telaQuiz = 0;
      texto = ""; resultado = ""; respostaCorreta = "";
      pontosDigitacao = 0; tentativas = 0;
      fimQuizDigitacao = false; esperando = false;
      caixativa = false;
      return;
    }
    // Bolinhas
    float dotY = py + ph + 20;
    float dotStart = px + pw/2 - (nomesAtivos.length * 22) / 2;
    for (int i = 0; i < nomesAtivos.length; i++) {
      if (dist(mouseX, mouseY, dotStart + i * 26, dotY) < 14) {
        parteAtual = i;
        return;
      }
    }
  }
}

void validarRespostaDigitacao() {
  if (esperando) return;
  String digitado = texto.toLowerCase().trim();
  boolean acertou = false;
  for (int i = 0; i < respostasDigitacao[telaQuiz].length; i++)
    if (digitado.equals(respostasDigitacao[telaQuiz][i])) acertou = true;

  if (acertou) {
    resultado = "Correto!";
    somAcerto.rewind(); somAcerto.play();
    if (tentativas == 0)      pontosDigitacao += 30;
    else if (tentativas == 1) pontosDigitacao += 20;
    else                      pontosDigitacao += 10;
    respostaCorreta = "";
    tempoRespostaD = millis(); esperando = true;
  } else {
    tentativas++;
    texto = ""; resultado = "Incorreto!";
    somErro.rewind(); somErro.play();
    if (tentativas >= 3) {
      respostaCorreta = respostasDigitacao[telaQuiz][0];
      tempoRespostaD = millis(); esperando = true;
    }
  }
}


void keyTyped() {
  if (estado != 4 || esperando || fimQuizDigitacao) return;
  if (key == BACKSPACE) {
    if (texto.length() > 0)
      texto = texto.substring(0, texto.length() - 1);
  } else if (key != ENTER && key != RETURN && key != CODED && key != ESC) {
    texto += key;
  }
}


void entrarCelula(int tipo) {
  estado = tipo;
  ultimoEstado = tipo;
  parteAtual = 0;
  if (tipo == 1) {
    nomesAtivos   = nomesP;
    funcoesAtivos = funcoesP;
    nomeCelula    = "Célula Procarionte";
  } else if (tipo == 2) {
    nomesAtivos   = nomesV;
    funcoesAtivos = funcoesV;
    nomeCelula    = "Célula Vegetal";
  } else {
    nomesAtivos   = nomesA;
    funcoesAtivos = funcoesA;
    nomeCelula    = "Célula Animal";
  }
}
