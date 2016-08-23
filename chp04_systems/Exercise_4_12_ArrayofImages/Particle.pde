// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float lifespan;

  PImage img;

  // Another constructor (the one we are using here)
  Particle(float x, float y, PImage img_) {
    // Boring example with constant acceleration
    acc = new PVector(0, 0);
    vel = PVector.random2D();
    pos = new PVector(x, y);
    lifespan = 255;
    img = img_;
  }

  void run() {
    update();
    render();
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  // Method to update position
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    lifespan -= 2.0;
  }

  // Method to display
  void render() {
    imageMode(CENTER);
    tint(lifespan);
    image(img, pos.x, pos.y, 32, 32);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
}

