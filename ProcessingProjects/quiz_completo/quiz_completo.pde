String [] perguntas;
String [][] respostas;
int [] respostas_dadas;
int resposta_dada = 0;
int [] respostas_corretas;
int p = 0, score = 0;
boolean finalizado = false;
boolean s_score = false;

void setup(){ 
  size(400,400);
  textSize(20);
  
  perguntas = new String[5]; 
  respostas = new String[5][5];
  respostas_dadas = new int[5];
  respostas_corretas = new int[5];
  inicializa();
}

void botoes(){
  textSize(12);
  
  fill(255,255,0);
  rect(20, 340, 360/3, 20);
  fill(0);
  text("ANTERIOR",40,355);
  
  fill(255,0,0);
  rect(20+360/3, 340, 360/3, 20); 
  fill(255);
  text("FINALIZAR",150,355);
  
  fill(255,255,0);
  rect(20+2*360/3, 340, 360/3, 20); 
  fill(0);
  text("PRÓXIMA",285,355);
  
  textSize(20);
}

void mostraPergunta(int x, int y, int indicePergunta){  
  // mostra a pergunta
  textSize(20); fill(0);
  text("Pergunta " + (p+1), x, y-20);
  text(perguntas[indicePergunta], x, y);  
  // controla a posição vertical
  int yAtual = y + 30; 
  // mostra as respostas
  textSize(16);
  for(int i = 0; i < respostas[indicePergunta].length; i++){
    if(i==respostas_dadas[p]-1) fill(255,0,0); else fill(0);
    text("- " + respostas[indicePergunta][i], x + 20, yAtual);
    yAtual += 25;
  }
}

void keyPressed(){
    if (key == CODED) {
      if (keyCode == RIGHT) if (p<4) {p++; resposta_dada=0;}
      if (keyCode == LEFT)  if (p>0) {p--; resposta_dada=0;}
    }    
    else
    {
      resposta_dada = int(key)-48;
       if (resposta_dada<=5) 
       {
     //    println("pergunta "+ int(int(p)+1) + " resposta dada:" + resposta_dada);
         respostas_dadas[p] = resposta_dada;
       } else println("número de resposta incorreto");
    }
}

void mousePressed(){
  //   rect(20, 340, 360/3, 20); AVANÇA
  if(mouseX>20 && mouseX< 20+360/3 && mouseY>340 && mouseY<340+20) 
    if (p>0) p--;
  //   rect(20+2*360/3, 340, 360/3, 20); RETORNA
  if(mouseX>20+2*360/3 && mouseX< 20+3*360/3 && mouseY>340 && mouseY<340+20) 
    if (p<4) p++;
  //   rect(20+360/3, 340, 360/3, 20); FINALIZA
   if(mouseX>20+360/3 && mouseX<20+360/3+360/3 && mouseY>340 && mouseY<340+20) 
     if (p==4){
       score();
       finalizado= true;
   }
}

void barraProgresso(){
  fill(200);
  rect(20, 370, 360, 10);
  fill(50, 200, 100);
  float progresso = (p+1)/5.0;
  rect(20, 370, 360 * progresso, 10);
}

void score(){
  // cálculo do score
  score = 0;
  for (int i=0; i<5; i++) {
    if(respostas_corretas[i] == respostas_dadas[i]){
      score++;
    }
  }  
  s_score = true;
}

void finaliza(){

  fill(255);
  rect(0,0,width,height);

  fill(0);
  text("Score: "+score+"/5",20,20);
  text("GABARITO",20,50);

  int x = 20;
  int y = 70;

  for(int i=0;i<5;i++){

    text(perguntas[i],x,y);
    y += 20;

    text("Correta: "+respostas[i][respostas_corretas[i]-1],x+20,y);
    y += 20;

    if(respostas_dadas[i]!=0){
      text("Sua resposta: "+respostas[i][respostas_dadas[i]-1],x+20,y);
    }else{
      text("Sua resposta: Não respondida",x+20,y);
    }

    y += 30;
  }
}

void draw(){
    background(255);
    fill(0); 
    botoes();
    mostraPergunta(20,40,p); 
    barraProgresso();
    if (finalizado) finaliza();
}
