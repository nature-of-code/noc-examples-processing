// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Particle p;

void setup() {
  size(640,360);
  p = new Particle(new PVector(width/2,20));
  background(255);
  smooth();
}

void draw() {
  background(255);
  
  p.run();
  if (p.isDead()) {
    p = new Particle(new PVector(width/2,20));
    //println("Particle dead!"); 
  }
}



