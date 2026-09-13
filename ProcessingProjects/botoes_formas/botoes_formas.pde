void setup() {
  size(300,300);
}
void draw() {
  fill(255,0,0); // vermelho
  rect(0,200,100,100); // botão 1 
  fill(0,255,0); // verde
  rect(100,200,100,100); // botão 2
  fill(0,0,250); // azul
  rect(200,200,100,100); // botão 3
  fill(0); // preto
  rect(30,30,50,50); // botão 4
}

void mousePressed(){
  if((mouseX <100) && (mouseY > 200)) { fill(255,0,0); 
  ellipse(170,130,60,60);
  }
  if((mouseX > 100) && (mouseX < 200) && (mouseY > 200)) { fill(0,255,0);
  rect(170, 130, 60,60);
  }
  if((mouseX > 200) && (mouseY > 200)) { fill(0,0,255);
  triangle(190, 120, 240, 190, 140, 190);
  }
  if((mouseX > 30) && (mouseX < 80) && (mouseY > 30) && (mouseY < 80)) background(175,175,175);
}
