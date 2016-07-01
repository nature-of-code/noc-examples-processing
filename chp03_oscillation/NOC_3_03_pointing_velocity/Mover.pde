// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  float xoff, yoff;

  float r = 16;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 4;
    xoff = 1000;
    yoff = 0;
  }

  void update() {

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, position);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }

  void display() {
    float theta = velocity.heading();

    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(position.x, position.y);
    rotate(theta);
    rect(0, 0, 30, 10);
    popMatrix();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } 
    else if (position.y < 0) {
      position.y = height;
    }
  }
}


