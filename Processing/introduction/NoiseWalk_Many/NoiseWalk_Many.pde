// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker[] w;

void setup() {
  size(600, 400);

  w = new Walker[10];
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < w.length; i++) {
    w[i].walk();
    w[i].display();
  }
}

