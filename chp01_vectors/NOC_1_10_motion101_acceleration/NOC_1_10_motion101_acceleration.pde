// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A Mover object
Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  // Update the position
  mover.update();
  // Display the Mover
  mover.display(); 
}

