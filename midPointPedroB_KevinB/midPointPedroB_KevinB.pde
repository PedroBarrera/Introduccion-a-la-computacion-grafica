int mangulo;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(0);
  drawAxis();
  drawCircle(width/2, height/2, 180, mangulo);
}
 
void drawAxis() {
  stroke(160);
  strokeWeight(1.1);
  line(0, 0, width, height);
  line(0, height, width, 0);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}
 
void mouseMoved(){
  // detecta la posicion del mouse en un angulo de 0 a 45
  mangulo = int(map(mouseX, 0, width, 0, 46));
}
 
void drawCircle(int x0, int y0, int radio, int angulo) {
  int circCol = color(212, 24, 24);
  float limit = radians(angulo);
  int x = radio;
  int y = 0;
  int err = 0;
 
  while (x >= y && atan2(y, x) < limit) {
    set(x0 + x, y0 + y, circCol);
    set(x0 + y, y0 + x, circCol);
    set(x0 - y, y0 + x, circCol);
    set(x0 - x, y0 + y, circCol);
    set(x0 - x, y0 - y, circCol);
    set(x0 - y, y0 - x, circCol);
    set(x0 + y, y0 - x, circCol);
    set(x0 + x, y0 - y, circCol);
 
    y += 1;
    if (err <= 0) {
      err += 2*y + 1;
    }
    if (err > 0) {
      x -= 1;
      err -= 2*x + 1;
    }
  }
}
