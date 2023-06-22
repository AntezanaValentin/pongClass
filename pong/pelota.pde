class Ball {
  PVector pos;
  PVector vel;

  Ball() {
    pos = new PVector(random(width), 50);
    vel = new PVector(3, 3);
  }
  void mover() {
    pos.add(vel);
  }
  void mostrar() {
    ellipse(pos.x, pos.y, 10, 10);
  }

  void rebote() {
    if (pos.y >= height || pos.y <= 0) {
      //vel.rotate(pos.x / 10);
      pos.sub(vel);
      vel.y *= -1;
    }
  }

  void rebotePaleta (float x, float y, float ancho, float alto, float d, float min, float max, float ang1, float ang2) {

    if (pos.y >= y &&
      pos.y <= y + alto &&
      pos.x >= x &&
      pos.x <= x + ancho) {
      float ang = map(d, min, max, ang1, ang2);
      PVector newVel = PVector.fromAngle(ang).mult(5);
      vel = newVel.copy();
    }
  }

  /*void rebotePaleta(float x, float y, float ancho, float alto) {
   float i = 1;
   if (pos.y >= y &&
   pos.y <= y + alto &&
   pos.x >= x &&
   pos.x <= x + ancho) {
   vel.x *= -1;
   if(pos.x <= width/2) {
   pos.x = x + ancho;
   } else {
   pos.x = x;
   }
   vel.y += i;
   }
   }*/
  void reinicio() {
    pos.x = width/2;
    pos.y = height/2;
    vel.y = 1;
  }
}
