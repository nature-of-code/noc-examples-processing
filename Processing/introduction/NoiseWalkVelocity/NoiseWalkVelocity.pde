// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

Walker w;

void setup() {
  size(400,400);
  smooth();
  frameRate(30);

  // Create a walker object
  w = new Walker();

}

void draw() {
  background(255);
  // Run the walker object
  w.walk();
  w.display();
}



