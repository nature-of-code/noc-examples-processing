// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    position = new PVector(400,50);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    translate(position.x,position.y);
    float heading = velocity.heading();
    rotate(heading);
    ellipse(0,0,16,16);
    rectMode(CENTER);
    // "20" should be a variable that is oscillating
    // with sine function
    rect(20,0,10,10);
    popMatrix();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }

  }

}



