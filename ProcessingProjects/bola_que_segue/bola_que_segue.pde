
int t = 100;

void setup() {
  size(600,600);
}

void draw() {
  if (mouseButton == LEFT) fill(255,0,0); else
    if (mouseButton == RIGHT) fill(0,255,0); else
      if (mouseButton == CENTER) fill (0,0,255);
  ellipse(mouseX, mouseY,t,t);
}

void mousePressed(){
  if (mouseButton == LEFT) t=t+4;
  if (mouseButton == RIGHT) t=t-4;
}
