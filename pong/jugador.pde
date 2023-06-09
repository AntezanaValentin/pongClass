class Jugadores {
  float x, y;
  PVector pos;
  PVector vel = new PVector(0, 5);


  Jugadores(float x, float y) {
    pos  = new PVector(x, y);
  }

  void subir() {
    pos.sub(vel);
  }
  void bajar() {
    pos.add(vel);
  }

  void mostrar() {
    rect(pos.x, pos.y, 10, 50);
  }
}
