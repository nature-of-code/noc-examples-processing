// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float r = 6;
  boolean highlight;

  Particle(float x, float y) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = new PVector(x, y);
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void intersects(ArrayList<Particle> particles) {
    highlight = false;
    for (Particle other : particles) {
      if (other != this) {
        float d = PVector.dist(other.position, position);
        if (d < r + other.r) {
          highlight = true;
        }
      }
    }
  }
  
  void applyForce(PVector f) {
    acceleration.add(f); 
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    if (highlight) {
      fill(127,0,0);
    }
    ellipse(position.x, position.y, r*2, r*2);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

