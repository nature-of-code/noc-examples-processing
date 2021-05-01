// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  float ballRadius;
  PVector position;
  PVector velocity;

  Mover() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    ballRadius = 24;
  }

  void update() {
    position.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, ballRadius*2, ballRadius*2);
  }

  void checkEdges() {

    if (position.x > width + ballRadius) {
      position.x = -ballRadius;
    } 
    else if (position.x < -ballRadius) {
      position.x = width + ballRadius;
    }

    if (position.y > height + ballRadius) {
      position.y = -ballRadius;
    } 
    else if (position.y < -ballRadius) {
      position.y = height + ballRadius;
    }
  }
}

