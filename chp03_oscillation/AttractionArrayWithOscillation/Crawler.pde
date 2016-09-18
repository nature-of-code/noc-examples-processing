// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Attraction

// A class to describe a thing in our world, has vectors for position, velocity, and acceleration
// Also includes scalar values for mass, maximum velocity, and elasticity

class Crawler {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Oscillator osc;
    
  Crawler() {
    acc = new PVector();
    vel = new PVector(random(-1,1),random(-1,1));
    pos = new PVector(random(width),random(height));
    mass = random(8,16);
    osc = new Oscillator(mass*2);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();  
    f.div(mass);
    acc.add(f);
  }

  // Method to update position
  void update() {
    vel.add(acc);
    pos.add(vel);
    // Multiplying by 0 sets the all the components to 0
    acc.mult(0);
    
    osc.update(vel.mag()/10);
  }
  
  // Method to display
  void display() {
    float angle = vel.heading2D();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(angle);
    ellipseMode(CENTER);
    stroke(0);
    fill(175,100);
    ellipse(0,0,mass*2,mass*2);
    
    osc.display(pos);
    popMatrix();
    
  }
}