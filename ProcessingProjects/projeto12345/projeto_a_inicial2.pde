PImage fundo; //variável da imagem de fundo
PImage fundo_in; //nome game
PFont fonte; //pra fonte das letras
PImage capa_play;
PImage podio;
import http.requests.*; //bibliotec;a requisicoes
import java.util.Set;
boolean sou_host = false;

int tela = 1; //controlar telas
int tela_anterior; //guardar tela anterior para poder usar nas setas de voltar
String codigo_sala = ""; //guardar codigo da sala
String nome = ""; //guardar nome jogador
String codigo_digitado = ""; //guardar codigo digitado
boolean digitando_codigo = false; //verificar se esta digitando codigo
boolean digitando_nome = false; //verificar se esta digitando nome
String firebase_url ="https://citologiaprocessing-default-rtdb.firebaseio.com/";
int pergunta_atual = 0; //controlar pergunta atual
int pontuacao = 0;
boolean mostrando_resposta = false;
char resposta_marcada = ' ';
int tempo_resposta = 0;
String[] ranking_nomes;
int[] ranking_pontos;
int total_players = 0;
int jogadores_online = 1;
boolean espectador = false;
long tempo_pergunta = 0;
float cortina_esq;
float cortina_dir;
int tempo_podio;
int tempo_podio_aberto = 0;
boolean podio_aberto = false;
int centro_x = 500;
int centro_y = 300;

//variaveis perguntas
String[] perguntas = {
  "O nucleo das celulas procarioticas e chamado de:",
};
//alternativas A
String[] alternativaA = {
  "Carioteca",
};
//alternativas B
String[] alternativaB = {
  "Nucleolo",
};
//alternativas C
String[] alternativaC = {
  "Nucleoide",
};
//alternativas D
String[] alternativaD = {
  "Cromoplasto",
};
//guardar respostas corretas
char[] respostas = {
  'C',
};

void setup() {

  size(1000, 600);
  fundo = loadImage("fundo.png"); //carrega imagem da pasta data
  fundo_in = loadImage("fundo_in.png");
  textAlign(CENTER,CENTER); //deixar os textos no centro
  fonte = createFont("Arial Bold", 32); //fonte em negrito
  textFont(fonte); //usar a fonte criada
  capa_play = loadImage("capa_play.png");
  podio = loadImage("podio.png");
  cortina_esq = width/2;
  cortina_dir = width/2;
}

void draw() {
  
  //TELA 9 DRAW PODIO CORTINA
  if(tela == 9){
    background(#050816);
    image(podio,0,0,width,height);
    //POSICOES PODIO
    
    int podio1_x = 500;
    int podio2_x = 230;
    int podio3_x = 770;
    int podio1_y = 160;
    int podio2_y = 260;
    int podio3_y = 310;
    //NOMES TOP
    textAlign(CENTER,CENTER);
    textSize(34);
    // PRIMEIRO
    if(total_players > 0){
      fill(#FFD700);
      text(ranking_nomes[0],podio1_x,podio1_y);
    }
    // SEGUNDO
    if(total_players > 1){
      fill(#C0C0C0);
      text(ranking_nomes[1],podio2_x,podio2_y);
    }
    // TERCEIRO
    if(total_players > 2){
      fill(#cd7f32);
      text(ranking_nomes[2],podio3_x,podio3_y);
    }
    
    //CORTINA ESQUERDA
    fill(#8B0000); // vermelho escuro
    stroke(#C00000);
    strokeWeight(3);
    rect(0,0,cortina_esq,height);
    // linhas da cortina (efeito tecido)
    stroke(120,0,0);
    for(int i = 0; i < cortina_esq; i += 25){
      line(i,0,i,height);
    }
    
    //CORTINA DIREITA
    fill(#8B0000);
    stroke(#C00000);
    rect(width - cortina_dir,0,cortina_dir,height);
    
    // linhas tecido direita
    stroke(120,0,0);
    for(int i = width - int(cortina_dir);
        i < width;
        i += 25){
      line(i,0,i,height);
    }
    
     //ABRIR CORTINAS
    if(cortina_esq > 0){
      cortina_esq -= 3;
    }
    if(cortina_dir > 0){
      cortina_dir -= 3;
    }
    // impedir negativo
    if(cortina_esq < 0){
      cortina_esq = 0;
    }
    if(cortina_dir < 0){
      cortina_dir = 0;
    }
    // quando abrir totalmente
    if(
      cortina_esq == 0 &&
      cortina_dir == 0 &&
      !podio_aberto
    ){
      podio_aberto = true;
      tempo_podio_aberto = millis();
    }
    
    // esperar 3 segundos
    if(
      podio_aberto &&
      millis() - tempo_podio_aberto >= 3000){
      tela = 7;
    }
    }
    
    //TELA 8 DRAW PODIO 123
   if(tela == 8){
    
    background(#06163d);
    botaoVoltar(70,70,90);
    //CARD
    fill(15,20,45,230);
    stroke(0,200,255);
    strokeWeight(4);
    rect(180,120,640,340,35);
    noFill();
    stroke(255,180);
    strokeWeight(2);
    rect(192,132,616,316,28);
    // brilho interno
    stroke(255,80);
    rect(200,140,600,300,24);
    // glow
    fill(0,200,255,45);
    textSize(50);
    textAlign(CENTER, CENTER);
    text(
      "CODIGO DA SALA",501,181);
    
    // principal
    fill(255);
    textSize(48);
    text("CODIGO DA SALA",500,180);
    stroke(120,220,255,180);
    strokeWeight(3);
    line(300,225,700,225);
    fill(0,180,255);
    stroke(255);
    strokeWeight(2);
    rect(490,218,20,14,4);
    // glow
    fill(255,0,200,50);
    textSize(72);
    text("#" + codigo_sala,501,291);
    
    // principal
    fill(#ff6be8);
    textSize(70);
    text("#" + codigo_sala,500,290);
    jogadores_online =
    contarJogadores(codigo_sala);
    fill(0,220,255);
    textSize(28);
    text(
      jogadores_online +" JOGADORES",500,370);
    if(sou_host){
      botao(500,525,200,80,"COMEÇAR");
    }
    
    else{
      fill(#ff6be8);
      textSize(24);
      text("AGUARDANDO A PARTIDA COMEÇAR...",500,490);
    }
    }


////TELA 0  DRAW MENU
if(tela == 0){
    image(fundo_in,0,0,width,height); //Desenha a imagem na tela, ocupando toda tela
    botaoVoltar(70,70,90);
    textSize(30); //tamanho normal menu
    botao(centro_x,220,230,100,"CRIAR SALA");
    botao(centro_x,370,400,100,"ENTRAR EM UMA SALA");
    botao(centro_x,520,330,100,"JOGAR SEM SALA");
  }

  //tela criar sala
  if(tela == 1){
  image(fundo,0,0,width,height);
  botaoVoltar(70,70,90);
  botao(centro_x,510,350,100,"ESPECTAR");
  desenharCodigoSala();
  textSize(35);
  botao(centro_x,350,350,100,"JOGAR");
}
  //tela entrar sala
  if(tela == 2){
    image(fundo,0,0,width,height); //Desenha a imagem na tela, ocupando toda tela
    botaoVoltar(70,70,90);
    botaoAvancar(920,80,90);
    // brilho titulo
    fill(0,200,255,45);
   
    textSize(52);
    textAlign(CENTER, CENTER);
    text("DIGITE O CODIGO",503,184);
    // titulo principal
    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("DIGITE O CODIGO",500,180);
    stroke(120,220,255,180);
    strokeWeight(3);
    line(240,220,760,220);
    fill(0,180,255);
    stroke(255);
    strokeWeight(2);
    rect(490,213,20,14,4);
    noStroke();
    if(digitando_codigo){
      fill(255,0,180,60);
    }
    else{
      fill(0,180,255,40);
    }
    rect(300,250,400,100,25);
    // brilho interno
    noFill();
    stroke(255,180);
    strokeWeight(2);
    rect(308,258,384,84,20);
    noFill(); //sem preenchimento
    //verificar se esta digitando codigo
    if(digitando_codigo){
      stroke(#712D70); //borda rosa
      strokeWeight(4); //grossura borda
    }
    else{
      stroke(0); //borda preta
      strokeWeight(2); //grossura borda
    }
    rect(300,250,400,100,20); //caixa codigo
    fill(#ff6be8); //cor texto digitado
    textSize(42); //tamanho texto digitado
    textFont(fonte); //usar fonte criada
    //mostrar codigo digitado
    if(digitando_codigo){
      text("#" + codigo_digitado + "|",500,300); //mostrar cursor
    }
    else{
      text("#" + codigo_digitado,500,300); //mostrar codigo
    }
  }

  //tela escolher nome
  if(tela == 3){
    image(fundo,0,0,width,height); //Desenha a imagem na tela, ocupando toda tela
    botaoVoltar(70,70,90);
    botaoAvancar(920,80,90);
    stroke(255,255,255,25);
    for(int i = 0; i < width; i += 40){
      line(i,0,i,height);
    }
    for(int j = 0; j < height; j += 40){
      line(0,j,width,j);
    }

       // brilho titulo
    fill(0,200,255,45);
    textSize(52);
    textAlign(CENTER, CENTER);
    text("ESCOLHA SEU NOME",503,184);
    
    // titulo principal
    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("ESCOLHA SEU NOME",500,180);
    stroke(120,220,255,180);
    strokeWeight(3);
    line(240,220,760,220);
    fill(0,180,255);
    stroke(255);    
    strokeWeight(2);    
    rect(490,213,20,14,4);    
    noStroke();
    if(digitando_nome){    
      fill(255,0,180,60);    
    }    
    else{    
      fill(0,180,255,40);    
    }
   
    rect(235,235,530,130,30);
    noFill(); //sem preenchimento

    //verificar se esta digitando nome
    if(digitando_nome){
      stroke(#712D70); //borda rosa
      strokeWeight(4); //grossura borda
    }
    else{
      stroke(0); //borda preta
      strokeWeight(2); //grossura borda
    }

   rect(250,250,500,100,25);
    // brilho interno
    noFill();    
    stroke(255,180);    
    strokeWeight(2);    
    rect(258,258,484,84,20);
    fill(#ff6be8); //cor nome digitado
    textSize(42); //tamanho nome digitado
    textFont(fonte); //usar fonte criada

    //mostrar nome digitado
    if(digitando_nome){
      text(nome + "|",500,300); //mostrar cursor
    }

    else{
      text(nome,500,300); //mostrar nome
    }
  }
  
  // SINCRONIZAR PERGUNTA ONLINE
  if(
  tela == 4 &&
  codigo_sala.length() > 0){
    if(frameCount % 30 == 0){
      pergunta_atual =
      lerPerguntaAtual(
      codigo_sala);
    }
  }
  
  if(codigo_sala.length() > 0){
    
  if(frameCount % 30 == 0){

    String estado =
    lerEstadoSala(
    codigo_sala);

    // QUIZ
    if(
      estado.equals("quiz") &&
      tela != 4
    ){
      tela = 4;
    }

    if(
  estado.equals("resultado") &&
  tela == 4
){

  carregarRanking();
  podio_aberto = false;
  cortina_esq = width/2;
  cortina_dir = width/2;
  tela = 9;

}
}

  if(tela == 4){
  if(sou_host){
    int respostas =
    contarRespostas();
    int total =
    contarJogadores(
    codigo_sala);
    // TODOS RESPONDERAM
    if(
  respostas >= total &&
  total > 0
){

  // esperar todos visualizarem
  if(
    millis() - tempo_pergunta >= 3000
  ){

    tempo_pergunta = millis();
    mostrando_resposta = false;
    resposta_marcada = ' ';
    proximaPergunta();
  }
}
}

    // TIMER 30s
    else if(
      millis() - tempo_pergunta >= 30000){
      tempo_pergunta =millis();
      proximaPergunta();
    }
  }
  image(fundo_in,0,0,width,height);
  int tempoRestante =30 - int((millis() - tempo_pergunta)/1000);
// impedir negativo
if(tempoRestante < 0){
  tempoRestante = 0;
}

// glow externo
fill(0,200,255,45);
textSize(34);
textAlign(CENTER,CENTER);
text(tempoRestante,123,53);

// circulo externo
noFill();
stroke(0,200,255);
strokeWeight(5);
if(tempoRestante <= 5){
  stroke(255,0,0);
}
else{
  stroke(0,200,255);
}
ellipse(120,50,80,80);
// brilho interno
stroke(255,180);
strokeWeight(2);
ellipse(120,50,66,66);

// numero principal
fill(#E54FDC);
textSize(32);
text(tempoRestante,120,50);

    fill(255);
    
    // CAIXA DA PERGUNTA
  stroke(0);  
  strokeWeight(5);  
  fill(255);  
  rect(centro_x-425, 100, 850, 75, 20); 
  
  // brilho branco
  stroke(255);  
  strokeWeight(2);  
  rect(centro_x-425, 100, 850, 75, 20);
      
  // ALTERNATIVA A
  if(mostrando_resposta){  
    if(respostas[pergunta_atual] == 'A'){  
      stroke(0,255,0);  
    }  
    else if(resposta_marcada == 'A'){  
      stroke(255,0,0);  
    }  
    else{  
      stroke(0);  
    }  
  }
  
  else{  
    if(
      mouseX >= centro_x-325 &&
      mouseX <= centro_x+325 &&
      mouseY >= 200 &&
      mouseY <= 275
    ){  
      stroke(#712D70);  
    }  
    else{  
      stroke(0);  
    }  
  }
  
  strokeWeight(6); 
  fill(255); 
  rect(centro_x-325, 200, 650,75, 20);  
  // brilho branco
  stroke(255);  
  strokeWeight(2); 
  rect(centro_x-325, 200, 650,75, 20);
  
  
  // ALTERNATIVA B
  if(mostrando_resposta){  
    if(respostas[pergunta_atual] == 'B'){  
      stroke(0,255,0);  
    }  
    else if(resposta_marcada == 'B'){  
      stroke(255,0,0);  
    }  
    else{  
      stroke(0);  
    }  
  }
  
  else{  
    if(
      mouseX >= centro_x-325 &&
      mouseX <= centro_x+325 &&
      mouseY >= 300 &&
      mouseY <= 375
    ){  
      stroke(#712D70);  
    }  
    else{ 
      stroke(0); 
    }  
  }  
  strokeWeight(6);  
  fill(255);  
  rect(centro_x-325, 300, 650,75, 20);  
  // brilho branco
  stroke(255);  
  strokeWeight(2);  
  rect(centro_x-325, 300, 650,75, 20); 
    
  
  // ALTERNATIVA C
  if(mostrando_resposta){  
    if(respostas[pergunta_atual] == 'C'){  
      stroke(0,255,0);  
    }  
    else if(resposta_marcada == 'C'){  
      stroke(255,0,0);  
    }  
    else{  
      stroke(0);  
    } 
  }
  
  else{  
    if(
      mouseX >= centro_x-325 &&
      mouseX <= centro_x+325 &&
      mouseY >= 400 &&
      mouseY <= 475
    ){  
      stroke(#712D70);  
    }
  
    else{  
      stroke(0);  
    }  
  }
  
  strokeWeight(6);  
  fill(255);  
  rect(centro_x-325, 400, 650,75, 20);  
  // brilho branco
  stroke(255);  
  strokeWeight(2);  
  rect(centro_x-325, 400, 650,75, 20);
  
    
  // ALTERNATIVA D
  if(mostrando_resposta){  
    if(respostas[pergunta_atual] == 'D'){  
      stroke(0,255,0);  
    }  
    else if(resposta_marcada == 'D'){  
      stroke(255,0,0);  
    }  
    else{  
      stroke(0);  
    }  
  }
  
  else{  
    if(
      mouseX >= centro_x-325 &&
      mouseX <= centro_x+325 &&
      mouseY >= 500 &&
      mouseY <= 575
    ){  
      stroke(#712D70);  
    }  
    else{  
      stroke(0);  
    }  
  }  
  
  strokeWeight(6);  
  fill(255);  
  rect(centro_x-325, 500, 650,75, 20);
  
  // brilho branco
  stroke(255);  
  strokeWeight(2);
  rect(centro_x-325, 500, 650,75, 20);
  rect(centro_x-325, 500, 650, 75, 20);
    fill(0);
    textSize(35);
    textAlign(RIGHT, CENTER);
    text("Pontos: " + pontuacao,950,50);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(24); 
  text(perguntas[pergunta_atual],centro_x,137);
  textAlign(LEFT, CENTER);
  textSize(20);
  text("A) " + alternativaA[pergunta_atual],centro_x-325+40,200+37);
  text("B) " + alternativaB[pergunta_atual],centro_x-325+40,300+37);
  text("C) " + alternativaC[pergunta_atual],centro_x-325+40,400+37);
  text("D) " + alternativaD[pergunta_atual],centro_x-325+40,500+37);
}




//resultado singleplayer
  if(tela == 5){
    image(fundo_in,0,0,width,height);
  fill(15,20,45,230);  
  stroke(0,200,255);  
  strokeWeight(4);  
  rect(200,170,600,260,30);  
  noFill();
  stroke(255,180);  
  strokeWeight(2); 
  rect(212,182,576,236,24);

  // brilho
  stroke(255);
  strokeWeight(2);
  rect(200,170,600,260,30);
  fill(0);
  textAlign(CENTER,CENTER);
  
    // glow titulo
  fill(0,200,255,45);  
  textSize(48);  
  text("QUIZ FINALIZADO",503,234);
  
  // titulo principal
  fill(255);  
  textSize(46);
  text("QUIZ FINALIZADO",500,230);
  textSize(34);
  fill(#ff6be8);
  text(pontuacao + " / " + perguntas.length,500,320);  
  fill(0,220,255);
  textSize(24);
  int porcentagem =
  int((pontuacao * 100.0)/perguntas.length);
  text(porcentagem + "% DE ACERTOS",500,380);
  
  stroke(120,220,255,180);
  strokeWeight(3);  
  line(320,270,680,270);  
  fill(0,180,255);  
  stroke(255);  
  strokeWeight(2);  
  rect(490,263,20,14,4);  
  textSize(22);
  fill(#C41031);

  if(porcentagem >= 90){ 
    text("DESEMPENHO PERFEITO",500,445);  
  }  
  else if(porcentagem >= 70){  
    text("EXCELENTE RESULTADO",500,445);  
  }  
  else if(porcentagem >= 50){  
    text("BOM DESEMPENHO",500,445);  
  }  
  else{ 
    text("TENTE NOVAMENTE",500,445); 
  }

  // botoes
  botao(310,520,250,90,"MENU");
  botao(650,520,320,110,"JOGAR NOVAMENTE");
  }
  if(mostrando_resposta){
  if(millis() - tempo_resposta >= 3000){
    mostrando_resposta = false;
    proximaPergunta();

  }
}



  if(tela == 6){
  image(capa_play,0,0,width,height);
  botaoPlay(360,400,200,140);
  }
  
  
  
  
  if(tela == 7){
    image(fundo_in,0,0,width,height);
  fill(15,20,45,230); 
  stroke(0,200,255);  
  strokeWeight(4);  
  rect(25,100,950,365,40);  
  noFill();
  stroke(255,180);  
  strokeWeight(2);  
  rect(35,110,930,345,30);

  // brilho
  stroke(255);
  strokeWeight(2);
  rect(45,120,910,325,30);
  fill(0);
  textAlign(CENTER,CENTER);

    // glow titulo
  fill(0,200,255,45);
  textSize(48);
  text("QUIZ FINALIZADO",500,150);
  
  // titulo principal
  fill(255);
  textSize(46);
  text("QUIZ FINALIZADO",501,151);

  // botoes
  botao(500,540,150,80,"MENU");
  }
  if(mostrando_resposta){
  if(millis() - tempo_resposta >= 3000){
    mostrando_resposta = false;
    proximaPergunta();
  }
} 
  fill(255);
textAlign(LEFT,CENTER);
textSize(18);
for(int i = 0; i < total_players; i++){
  int coluna =i / 10;
  int linha =i % 10;
  int x =70 + coluna * 180;
  int y =210 + linha * 23;
  String texto =(i+1) + "º  " + ranking_nomes[i];
  text(texto,x,y);
  textAlign(RIGHT,CENTER);
  text(ranking_pontos[i],x + 145,y);
  textAlign(LEFT,CENTER);
}
}






void botao(int x,int y,int largura,int altura,String texto){
  boolean hover =
  pow((mouseX-x)/(largura/2.0),2) +
  pow((mouseY-y)/(altura/2.0),2) <= 1;
  // brilho externo
  noStroke();
  if(hover){
    fill(255,20,147,70); // rosa glow
  }
  else{
    fill(0,170,255,50); // azul glow
  }
  ellipse(x,y,largura+35,altura+35);

  // degradê fake
  for(int i = 0; i < 8; i++){
    if(hover){
      fill(255,20,147,18);
    }

    else{
      fill(0,170,255,15);
    }
    ellipse(x,y,largura-(i*2),altura-(i*2));
  }

  // botão principal
  stroke(255);
  strokeWeight(3);
  if(hover){
    fill(#ff1493); // rosa
  }
  else{
    fill(#00aaff); // azul
  }
  ellipse(x,y,largura,altura);

  // brilho interno
  noFill();
  stroke(255,180);
  strokeWeight(2);
  ellipse(x,y,largura-10,altura-10);

  // texto
  fill(255);
  textSize(30);
  textAlign(CENTER,CENTER);
  text(texto,x,y-3);
}




void botaoPlay(float x, float y, float largura, float altura){
  boolean hover =
  mouseX > x &&
  mouseX < x + largura &&
  mouseY > y &&
  mouseY < y + altura;

  // brilho externo
  noStroke();
  if(hover){
    fill(255,0,150,80);
  } else {
    fill(0,150,255,60);
  }
  rect(x-10,y-10,largura+20,altura+20,80);
  // botao principal
  stroke(255);
  strokeWeight(3);
  if(hover){
    fill(#ff1493);
  } else {
    fill(#00aaff);
  }

  rect(x,y,largura,altura,80);
  // triangulo play
  noStroke();
  fill(255);
  triangle(
    x + largura/2 - 20,y + altura/2 - 25,x + largura/2 - 20,y + altura/2 + 25,x + largura/2 + 25,y + altura/2);
}



void desenharCodigoSala(){
  //TITULO
  fill(0,200,255,45);
  textSize(56);
  textAlign(CENTER, CENTER);
  text("CODIGO DA SALA",503,104);
  fill(255);
  textSize(54);
  textAlign(CENTER, CENTER);
  text("CODIGO DA SALA",500,100);


  //LINHA
  stroke(120,220,255,180);
  strokeWeight(3);
  line(240,140,760,140);
  fill(0,180,255);
  stroke(255);
  strokeWeight(2);
  rect(490,133,20,14,4);


  //CODIGO
  fill(140,0,140,80);
  textSize(82);
  textAlign(CENTER, CENTER);
  text("#"+ codigo_sala,504,214);
  fill(#ff6be8);
  textAlign(CENTER, CENTER);
  textSize(82);
  text("#"+ codigo_sala,500,210);


  //LINHA INFERIOR
  stroke(255,0,200,140);
  strokeWeight(3);
  line(240,255,760,255);
  fill(#ff4fd8);
  stroke(255);
  strokeWeight(2);
  rect(490,248,20,14,4);
}




void botaoVoltar(float x,float y,float tamanho){
  boolean hover = dist(mouseX,mouseY,x,y) < tamanho/2;
  // brilho externo
  noStroke();
  if(hover){
    fill(255,0,180,70);
  }
  else{

    fill(0,180,255,55);
  }
  ellipse(x,y,tamanho+22,tamanho+22);

  // circulo principal
  stroke(255);
  strokeWeight(3);

  if(hover){

    fill(#d94dff);
  }
  else{

    fill(#1aa8ff);
  }
  ellipse(x,y,tamanho,tamanho);

  // brilho interno
  noFill();
  stroke(255,220);
  strokeWeight(2);
  ellipse(x,y,tamanho-10,tamanho-10);

  // seta
  noStroke();
  fill(255);
  beginShape();
  vertex(x-22,y);      // ponta esquerda
  vertex(x+2,y-20);    // cima
  vertex(x+2,y-10);    // encaixe cima
  vertex(x+24,y-10);   // haste cima
  vertex(x+24,y+10);   // haste baixo
  vertex(x+2,y+10);    // encaixe baixo
  vertex(x+2,y+20);    // baixo
  endShape(CLOSE);
}




void botaoAvancar(float x,float y,float tamanho){

  boolean hover = dist(mouseX,mouseY,x,y) < tamanho/2;

  // brilho externo
  noStroke();

  if(hover){
    fill(255,0,180,70);
  }

  else{
    fill(0,180,255,55);
  }
  ellipse(x,y,tamanho+22,tamanho+22);

  // circulo principal
  stroke(255);
  strokeWeight(3);
  if(hover){
    fill(#d94dff);
  }

  else{
    fill(#1aa8ff);
  }
  ellipse(x,y,tamanho,tamanho);

  // brilho interno
  noFill();
  stroke(255,220);
  strokeWeight(2);
  ellipse(x,y,tamanho-10,tamanho-10);

  // seta
  noStroke();
  fill(255);
  beginShape();
  vertex(x+22,y);      // ponta direita
  vertex(x-2,y-20);    // cima
  vertex(x-2,y-10);    // encaixe cima
  vertex(x-24,y-10);   // haste cima
  vertex(x-24,y+10);   // haste baixo
  vertex(x-2,y+10);    // encaixe baixo
  vertex(x-2,y+20);    // baixo
  endShape(CLOSE);
}


void verificarResposta(char respostaJogador){
  if(!mostrando_resposta){
    resposta_marcada = respostaJogador;    
    if(codigo_sala.length() > 0){
    marcarResposta(codigo_sala,nome);
}
    mostrando_resposta = true;
    tempo_resposta = millis();
    if(respostaJogador == respostas[pergunta_atual]){    
      pontuacao++;    
      if(codigo_sala.length() > 0){    
        atualizarPontos(codigo_sala,nome,pontuacao);
  }
}
  }
}




void mousePressed(){
 if(tela == 8){
  // clique botão começar
  if(sou_host){

    if(
      pow((mouseX-500)/(200/2.0),2) +
      pow((mouseY-525)/(80/2.0),2) <= 1
    ){

      // reset quiz
      pergunta_atual = 0;
      pontuacao = 0;
      mostrando_resposta = false;
      resposta_marcada = ' ';

      // reset podio
      podio_aberto = false;
      cortina_esq = width/2;
      cortina_dir = width/2;

      // limpar respostas antigas
      limparRespostas(codigo_sala);

      // atualizar pergunta online
      atualizarPerguntaAtual(codigo_sala,0);

      // reset timer
      atualizarTempoPergunta(codigo_sala);
      tempo_pergunta = millis();
      atualizarPerguntaAtual( codigo_sala, 0);
      pergunta_atual = 0;
      // iniciar quiz
      atualizarEstadoSala(codigo_sala,"quiz");
    }
  }
}

    //clicou seta voltar
  if(mouseX >= 10 && mouseX <= 160 &&
     mouseY >= 0 && mouseY <= 150){ 
    tela = 6;
  
  }

  //verificar clique menu
  if(tela == 0){

    //clicou criar sala
    if( pow((mouseX-centro_x)/(230/2.0),2) +
        pow((mouseY-250)/(100/2.0),2) <= 1 ){
    codigo_sala =
      gerarCodigoUnico(); //gerar codigo unico
      criarSalaFirebase(
      codigo_sala); //criar sala firebase      
      sou_host = true;
      tela_anterior = tela; //guardar tela atual
      tela = 1; //ir tela criar sala
    }

    //clicou entrar sala
    if( pow((mouseX-centro_x)/(400/2.0),2) +
        pow((mouseY-370)/(100/2.0),2) <= 1 ){      
      limparCampos();
      tela_anterior = tela; //guardar tela atual
      tela = 2; //ir tela entrar sala
    }

    //clicou jogar sem sala
    if( pow((mouseX-centro_x)/(330/2.0),2) +
        pow((mouseY-490)/(100/2.0),2) <= 1 ){          
      limparCampos();
      tela_anterior = tela; //guardar tela atual
      tela = 3; //ir tela nome
    }
  }

  //verificar clique tela criar sala
  if(tela == 1){
    
    //clicou espectar
if(
  pow((mouseX-500)/(260/2.0),2) +
  pow((mouseY-560)/(80/2.0),2) <= 1
){
  espectador = true;
  tela = 8;
}

    //clicou seta voltar
    if(mouseX >= 10 && mouseX <= 160 &&
       mouseY >= 0 && mouseY <= 150){
      tela = 0; //voltar menu
    }

        //clicou jogar
  if( pow((mouseX-500)/(350/2.0),2) +
    pow((mouseY-350)/(100/2.0),2) <= 1 ){  
    tela_anterior = tela;  
    tela = 3;
  }
  }

  //verificar clique tela entrar sala
  if(tela == 2){

    //clicou seta voltar
    if(mouseX >= 10 && mouseX <= 160 &&
       mouseY >= 0 && mouseY <= 150){
    limparCampos();
      tela = 0; //voltar menu
    }

    //clicou seta avançar
    if(mouseX >= 840 && mouseX <= 990 &&
       mouseY >= 0 && mouseY <= 150){

    //verificar tamanho codigo
    if(codigo_digitado.length() == 8){
    
      //verificar se codigo existe
      if(codigoExiste(
        codigo_digitado)){
        codigo_sala = codigo_digitado;        
        sou_host = false;      
        tela_anterior = tela;
        tela = 3;
    }
}
    }

    //clicou caixa codigo
    if(mouseX >= 300 && mouseX <= 700 &&
       mouseY >= 250 && mouseY <= 350){
      digitando_codigo = true; //ativar digitacao codigo
    }
    else{
      digitando_codigo = false; //desativar digitacao codigo
    }
  }

 //verificar clique tela nome
if(tela == 3){

  //clicou caixa nome
  if(mouseX >= 250 && mouseX <= 750 &&
     mouseY >= 250 && mouseY <= 350){
    digitando_nome = true;
  }

  else{
    digitando_nome = false;
  }

  //clicou seta voltar
  if(mouseX >= 10 && mouseX <= 160 &&
     mouseY >= 0 && mouseY <= 150){
    limparCampos();
    tela = tela_anterior;
  }

  //clicou seta avançar
  if(mouseX >= 840 && mouseX <= 990 &&
     mouseY >= 0 && mouseY <= 150){
       
    if(nome.length() > 0){
      if(codigo_sala.length() > 0){
       entrarSala(codigo_sala,nome);
      }
      tela_anterior = tela;
      tela = 8;
    }
  }
}


  if(!espectador){


   if (tela == 4) {

    // alternativa A
    if (
      mouseX >= centro_x-250 &&
      mouseX <= centro_x+250 &&
      mouseY >= 200 &&
      mouseY <= 275
    ) {
      verificarResposta('A');

    }

    // alternativa B
    if (
      mouseX >= centro_x-250 &&
      mouseX <= centro_x+250 &&
      mouseY >= 300 &&
      mouseY <= 375
    ) {
      verificarResposta('B');

    }

    // alternativa C
    if (
      mouseX >= centro_x-250 &&
      mouseX <= centro_x+250 &&
      mouseY >= 400 &&
      mouseY <= 475
    ) {
      verificarResposta('C');
    }

    // alternativa D
    if (
      mouseX >= centro_x-250 &&
      mouseX <= centro_x+250 &&
      mouseY >= 500 &&
      mouseY <= 575
    ) {
      verificarResposta('D');
    }
  }
  }
  
  if(tela == 5){
  // MENU
  if(
    pow((mouseX-350)/(250/2.0),2) +
    pow((mouseY-520)/(90/2.0),2) <= 1
  ){
    tela = 0;
  }

  // REINICIAR
  if(
    pow((mouseX-650)/(320/2.0),2) +
    pow((mouseY-520)/(90/2.0),2) <= 1
  ){
    pontuacao = 0;
    pergunta_atual = 0;
    mostrando_resposta = false;
    resposta_marcada = ' ';
    tela = 4;
  }
}

  if(tela == 6){
    if(mouseX >= 200 && mouseX <= 800 &&
       mouseY >= 220 && mouseY <= 720){
      tela = 0;
    }
  }
  
//clique menu ranking
if(tela == 7){
  if(
    pow((mouseX-500)/(150/2.0),2) +
    pow((mouseY-540)/(80/2.0),2) <= 1
  ){
    if(codigo_sala.length() > 0){
      atualizarEstadoSala(codigo_sala, "lobby");
    }
    pergunta_atual = 0;
    pontuacao = 0;
    tela = 0;
  }
}
}




void proximaPergunta() {
  mostrando_resposta = false;
  resposta_marcada = ' ';

  if (pergunta_atual < perguntas.length - 1) {
    pergunta_atual++;

    // MULTIPLAYER
    if(codigo_sala.length() > 0){
      atualizarPerguntaAtual(codigo_sala,pergunta_atual);
   }
}
  
else {
  // multiplayer
  if(codigo_sala.length() > 0){
    atualizarEstadoSala(codigo_sala,"resultado");
    carregarRanking();

    // reset animação
    podio_aberto = false;
    cortina_esq = width/2;
    cortina_dir = width/2;
    tempo_podio = millis();
    tela = 9;
  }
  else{
    tela = 5;
  }
  
}
}




void keyPressed(){

  //TELA DIGITAR CODIGO
  if(tela == 2 && digitando_codigo){
    //apagar caractere
    if(keyCode == BACKSPACE &&
       codigo_digitado.length() > 0){
      codigo_digitado =codigo_digitado.substring(0,codigo_digitado.length()-1);
    }

    //transformar letra em maiuscula
    else{
      char tecla =
      Character.toUpperCase(key); //deixar maiuscula

      //aceitar letras e numeros
      if( (tecla >= 'A' && tecla <= 'Z') ||
          (tecla >= '0' && tecla <= '9') ){
        //limitar tamanho
        if(codigo_digitado.length() < 8){
          codigo_digitado += tecla; //adicionar caractere
        }
      }
    }
  }

  //TELA ESCOLHER NOME
  if(tela == 3 && digitando_nome){
    //apagar letra
    if(keyCode == BACKSPACE &&
       nome.length() > 0){
      nome =nome.substring(0,nome.length()-1);
    }
    //nao aceitar ENTER
    else if(key != ENTER &&
            key != RETURN){
      //limitar tamanho nome
      if(nome.length() < 12){
        nome += key; //adicionar letra
      }
    }
  }
}




void limparCampos(){ //funcao limpar campos
  nome = ""; //limpar nome
  codigo_digitado = ""; //limpar codigo digitado
  digitando_nome = false; //desativar digitacao nome
  digitando_codigo = false; //desativar digitacao codigo
}




String gerarCodigoSala(){ //funcao gerar codigo
  String caracteres ="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; //caracteres permitidos
  String codigo = ""; //guardar codigo
  //repetir 8 vezes
  for(int i = 0; i < 8; i++){
    //gerar indice aleatorio
    int indice =int(random(caracteres.length()));
    //adicionar caractere ao codigo
    codigo += caracteres.charAt(indice);
  }
  return codigo; //retornar codigo
}




boolean codigoExiste(String codigo){ //funcao verificar codigo
  //montar url da sala
  String url =firebase_url +"salas/" + codigo + ".json";
  JSONObject resposta; //guardar resposta firebase
  try{
    //carregar json da internet
    resposta = loadJSONObject(url);
  }
  catch(Exception erro){
    //erro conexao
    return false;
  }
  //se resposta for vazia
  if(resposta == null){
    return false; //codigo livre
  }
  return true; //codigo existe
}




String gerarCodigoUnico(){ //funcao gerar codigo unico
  String codigo; //guardar codigo
  do{
    //gerar codigo
    codigo = gerarCodigoSala();
    //repetir enquanto existir
  }
  while(codigoExiste(codigo));
  return codigo; //retornar codigo unico
}




void criarSalaFirebase(String codigo){ //funcao criar sala
 //criar objeto sala
  JSONObject sala = new JSONObject();
  sala.setLong("tempoPergunta",System.currentTimeMillis());
  //salvar tempo criacao
  sala.setLong("tempo",System.currentTimeMillis());
  //salvar status sala
  sala.setBoolean( "ativa", true);
  //salvar codigo host
  sala.setString("codigo", codigo);
  //estado da sala
  sala.setString("estado","lobby");
  // PERGUNTA ATUAL
  sala.setInt( "perguntaAtual",0);
  //players
  JSONObject players = new JSONObject();
  sala.setJSONObject( "players", players);
  //montar url sala
  String url = firebase_url + "salas/" + codigo + ".json";
  //criar requisicao put
  PutRequest put = new PutRequest(url);
  //definir tipo json
  put.addHeader( "Content-Type", "application/json");
  //adicionar dados json
  put.addData(
  sala.toString());
  //enviar requisicao
  put.send();
}




boolean salaExpirada(long tempoSala){ //funcao verificar expiracao
  //guardar tempo atual
  long tempoAtual = System.currentTimeMillis();
  //5 horas em milissegundos
  long cinco_horas = 5L * 60L * 60L * 1000L;
  //verificar expiracao
  if(tempoAtual - tempoSala >= cinco_horas){
    return true; //sala expirada
  }
  return false; //sala ativa
}




void removerSalaFirebase(String codigo){ //funcao remover sala
  //montar url sala
  String url = firebase_url +"salas/" + codigo + ".json";
  //criar requisicao delete
  DeleteRequest delete = new DeleteRequest(url);
  //enviar requisicao
  delete.send();
}




void entrarSala(String codigo, String nome){
  JSONObject jogador = new JSONObject();
  jogador.setString("nome", nome);
  jogador.setInt("pontos", 0);
  String url =firebase_url +"salas/" + codigo +"/players/" + nome + ".json";
  PutRequest put =new PutRequest(url);
  put.addHeader("Content-Type","application/json");
  put.addData( jogador.toString());
  put.send();
}




void atualizarPontos(String codigo,String nome,int pontos){
  String url = firebase_url + "salas/" + codigo + "/players/" + nome + "/pontos.json";
  PutRequest put = new PutRequest(url);
  put.addHeader( "Content-Type", "application/json");
  put.addData( str(pontos));
  put.send();
}




JSONObject lerJogadores(String codigo){
  String url = firebase_url + "salas/" + codigo + "/players.json";
  try{
    JSONObject resposta = loadJSONObject(url);
    return resposta;
  }
  catch(Exception erro){
    println("erro lendo jogadores");
    return null;
  }
}




void atualizarPerguntaAtual(String codigo,int pergunta){
  String url = firebase_url + "salas/" + codigo + "/perguntaAtual.json";
  PutRequest put = new PutRequest(url);
  put.addHeader( "Content-Type", "application/json");
  put.addData(str(pergunta));
  put.send();
}




int lerPerguntaAtual(String codigo){
  String url =firebase_url +"salas/" + codigo + "/perguntaAtual.json";
  try{
    String resposta = join(loadStrings(url), "");
    return int(resposta);
  }
  catch(Exception erro){
    return 0;
  }
}




void atualizarEstadoSala(
String codigo,
String estado){
  String url =firebase_url + "salas/" + codigo +"/estado.json";
  PutRequest put = new PutRequest(url);
  put.addHeader("Content-Type","application/json");
  // STRING JSON
  put.addData("\"" + estado + "\"");
  put.send();
}




String lerEstadoSala(String codigo){
  String url = firebase_url + "salas/" + codigo + "/estado.json";
  try{
    String resposta = join(loadStrings(url), "");
    resposta = resposta.replace("\"","");
    return resposta;
  }
  catch(Exception erro){
    return "erro";
  }
}



void carregarRanking(){
  JSONObject players = lerJogadores(codigo_sala);
  if(players == null){
    return;
  }
  Set<String> chaves = players.keys();  
  String[] nomes = new String[chaves.size()];  
  int indice = 0;  
  for(String chave : chaves){
 
    nomes[indice] = chave;  
    indice++;
  }
  total_players = nomes.length;
  ranking_nomes = new String[total_players];
  ranking_pontos = new int[total_players];
  // carregar dados
  for(int i = 0; i < nomes.length; i++){
    JSONObject jogador = players.getJSONObject(nomes[i]);
    ranking_nomes[i] =  nomes[i];
    ranking_pontos[i] = jogador.getInt("pontos");
  }

  // ordenar ranking
  for(int i = 0; i < total_players-1; i++){
    for(int j = 0; j < total_players-1-i; j++){
      if(ranking_pontos[j] < ranking_pontos[j+1]){

        int tempP =
        ranking_pontos[j];
        ranking_pontos[j] = ranking_pontos[j+1];
        ranking_pontos[j+1] = tempP;

        String tempN =
        ranking_nomes[j];
        ranking_nomes[j] = ranking_nomes[j+1];
        ranking_nomes[j+1] = tempN;
      }
    }
  }
}




int contarJogadores(String codigo){
  JSONObject players = lerJogadores(codigo);
  if(players == null){
    return 0;
  }
  return players.size();
}



void atualizarTempoPergunta(
String codigo){

  String url = firebase_url + "salas/" + codigo + "/tempoPergunta.json";
  PutRequest put = new PutRequest(url);
  put.addHeader( "Content-Type", "application/json");
  put.addData(str(System.currentTimeMillis()));
  put.send();
}




long lerTempoPergunta(String codigo){
  String url = firebase_url + "salas/" + codigo + "/tempoPergunta.json";
  try{
    String resposta =
    join(loadStrings(url), "");
    return Long.parseLong(resposta);
  }
  catch(Exception erro){
    return 0;
  }
}




void marcarResposta(String codigo,String nome){
  String url = firebase_url + "salas/" + codigo + "/respostas/pergunta" + pergunta_atual + "/" + nome + ".json";
  PutRequest put = new PutRequest(url);
  put.addHeader("Content-Type","application/json");
  put.addData("true");
  put.send();
}




int contarRespostas(){
  String url = firebase_url + "salas/" + codigo_sala + "/respostas/pergunta" + pergunta_atual + ".json";

  try{
    JSONObject resposta = loadJSONObject(url);
    if(resposta == null){return 0;
  }
    return resposta.size();
  }
  catch(Exception erro){return 0;
}
}




void limparRespostas(String codigo){
  String url = firebase_url + "salas/" + codigo + "/respostas.json";
  DeleteRequest delete = new DeleteRequest(url);
  delete.send();
}
