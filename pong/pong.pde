boolean arriba1 = false;
boolean arriba2 = false;
boolean abajo1 = false;
boolean abajo2 = false;

Jugadores p1;
Jugadores p2;
Ball pelota;

void setup() {
  size(800, 400);
  p1 = new Jugadores(5, height/2 - 25);
  p2 = new Jugadores(width - 15, height/2 - 25);
  pelota = new Ball();
}

void keyPressed() {
  if (keyCode == 'W' || keyCode == 'w') {
    arriba1 = true;
  }
  if (keyCode == UP) {
    arriba2 = true;
  }
  if (keyCode == 'S' || keyCode == 's') {
    abajo1 = true;
  }
  if (keyCode == DOWN) {
    abajo2 = true;
  }
}

void keyReleased() {
  if (keyCode == 'W' || keyCode == 'w') {
    arriba1 = false;
  }
  if (keyCode == UP) {
    arriba2 = false;
  }
  if (keyCode == 'S' || keyCode == 's') {
    abajo1 = false;
  }
  if (keyCode == DOWN) {
    abajo2 = false;
  }
}

void mover() {
  if (arriba1 == true) {
    p1.subir();
  }
  if (arriba2 == true) {
    p2.subir();
  }
  if (abajo1 == true) {
    p1.bajar();
  }
  if (abajo2 == true) {
    p2.bajar();
  }
  if (arriba1 == true && arriba2 == true) {
    p1.subir();
    p2.subir();
  }
  if (abajo1 == true && abajo2 == true) {
    p1.bajar();
    p2.bajar();
  }
  if (arriba1 == true && abajo2 == true) {
    p1.subir();
    p2.bajar();
  }
  if (abajo1 == true && arriba2 == true) {
    p1.bajar();
    p2.subir();
  }
}

void limitar() {
  if (p1.pos.y <= 0) {
    p1.pos.y = 0;
  }
  if (p2.pos.y <= 0) {
    p2.pos.y = 0;
  }
  if (p1.pos.y >= height - 50) {
    p1.pos.y = height - 50;
  }
  if (p2.pos.y >= height - 50) {
    p2.pos.y = height - 50;
  }
}

void draw() {
  background(0);
  mover();
  limitar();
  p1.mostrar();
  p2.mostrar();
  pelota.rebote();
  pelota.rebotePaleta(p1.pos.x, p1.pos.y, p1.anc, p1.alt, (p1.pos.y + p1.alt/2) - pelota.pos.y, p1.alt/2, -p1.alt/2, -PI/4, PI/4);
  pelota.rebotePaleta(p2.pos.x, p2.pos.y, p2.anc, p2.alt, (p2.pos.y + p2.alt/2) - pelota.pos.y, p2.alt/2, -p2.alt/2, 3/4*PI, 5/4*PI);
  pelota.mover();
  pelota.mostrar();
  if (pelota.pos.x <= 0 || pelota.pos.x >= width) {
    pelota.reinicio();
  }
}
