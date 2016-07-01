// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float r;
  
  Particle(float x, float y, float r_) {
    acceleration = new PVector(0,0.01);
    velocity = PVector.random2D();
    velocity.mult(0.5);
    position = new PVector(x,y);
    lifespan = 255.0;
    r = r_;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0);
    fill(0);
    rectMode(CENTER);
    rect(position.x,position.y,r,r);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


