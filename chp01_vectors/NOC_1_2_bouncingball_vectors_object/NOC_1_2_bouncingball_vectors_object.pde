// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-2: Bouncing Ball, with PVector!

Ball b;

void setup() {
  size(200, 200);
  b = new Ball();
}

void draw() {
  background(255);
  b.update();
  b.display();
}

