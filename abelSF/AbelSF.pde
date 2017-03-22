float vidaTotalEsquerra = 100;
float vidaRestantEsquerra = 100;
float ampleBarraEsquerra, ampleBarraEsquerraTotal;

float vidaTotalDreta = 100;
float vidaRestantDreta = 100;
float ampleBarraDreta, ampleBarraDretaTotal;

PImage fons;

PImage tortuga, tortugaNoFerRes, tortugaCopDePuny, tortugaPatada, tortugaDefensa;
int tortugaX, tortugaY;
int comptadorTortuga;
int tortugaAmple, tortugaAlt;

PImage sonic, sonicNoFerRes, sonicCopDePuny, sonicPatada, sonicDefensa;
int sonicX, sonicY;
int comptadorSonic;

void setup() {
  size (1000, 450);

  ampleBarraEsquerraTotal = width/2-32;
  ampleBarraDretaTotal = width/2-62;

  fons = loadImage("FonsSF.jpg");

  tortugaNoFerRes = loadImage("TortugaNoFerRes.png");
  tortuga=tortugaNoFerRes;
  tortugaCopDePuny = loadImage("TortugaAtac1.png");
  tortugaPatada = loadImage("TortugaAtac2.png");
  tortugaDefensa = loadImage("Tortuga Defensa.png");
  tortugaAmple=80;
  tortugaAlt=100;
  tortugaX = 50;
  tortugaY = height/2+height/7;

  sonicNoFerRes = loadImage("SonicNoFerRes.png");
  sonic=sonicNoFerRes;
  sonicCopDePuny = loadImage("SonicAtac1.png");
  sonicPatada = loadImage("SonicAtac2.png");
  sonicDefensa = loadImage("SonicDefensa.png");
  sonicX = width-130;
  sonicY = height/2+height/7;
}

void draw() {
  image(fons, 0, 0, width, height);
  dibuixarBarres();
  dibuixarTortuga();
  dibuixarSonic();
  comptadorTortuga++;
  comptadorSonic++;
}

void dibuixarSonic() {
  image(sonic, sonicX, sonicY, 80, 100);
  if (comptadorSonic>=4) {
    sonic=sonicNoFerRes;
  }
}
void dibuixarTortuga() {
  image(tortuga, tortugaX, tortugaY, tortugaAmple, tortugaAlt);
  if (comptadorTortuga>=4) {
    tortuga=tortugaNoFerRes;
    tortugaAmple=80;
  }
}

void mouSonic() {
  if (key==CODED) {
    if (keyCode==RIGHT) {
      sonicX=sonicX+10;
    }
    if (keyCode==LEFT) {
      sonicX=sonicX-10;
    }
    if (keyCode==DOWN) {
      sonic=sonicDefensa;
      comptadorSonic=-6;
    }
  }
  if (key=='1') {
    sonic=sonicCopDePuny;
    comptadorSonic=0;
  }
  if (key=='2') {
    sonic=sonicPatada;
    comptadorSonic=0;
  }
}
void mouTortuga() {
  if (key=='d') {
    tortugaX=tortugaX+10;
  }
  if (key=='a') {
    tortugaX=tortugaX-10;
  }
  if (key=='x') {
    tortuga=tortugaCopDePuny;
    comptadorTortuga=0;
    tortugaAmple=110;
  }
  if (key=='z') {
    tortuga=tortugaPatada;
    comptadorTortuga=0;
  }
  if (key=='s') {
    tortuga=tortugaDefensa;
    comptadorTortuga=-6;
  }
}

void dibuixarBarres() {
  stroke(255, 255, 255);
  noFill();
  rect(30, 30, width/2-30, height/20);
  rect(width/2+30, 30, width/2-60, height/20);
  fill(255, 0, 0);
  rect(31, 31, width/2-32, height/20-2);
  rect(width/2+31, 31, width/2-62, height/20);
  fill(255, 255, 0);
  ampleBarraEsquerra = ampleBarraEsquerraTotal*(vidaRestantEsquerra/vidaTotalEsquerra);
  rect(31, 31, ampleBarraEsquerra, height/20-2);
  ampleBarraDreta = ampleBarraDretaTotal*(vidaRestantDreta/vidaTotalDreta);
  rect(width/2+31+(width/2-62-ampleBarraDreta), 30, width/2-62-(width/2-62-ampleBarraDreta), height/20);
}

void keyPressed() {
  mouTortuga();
  mouSonic();
}

    // qualsevol merda