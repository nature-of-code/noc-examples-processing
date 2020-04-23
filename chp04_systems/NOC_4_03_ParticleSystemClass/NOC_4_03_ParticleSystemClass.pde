// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ParticleSystem ps;
PVector current;

void setup() {
  size(640,360);
  PVector origin= new PVector(width/2,50);
  ps = new ParticleSystem(origin);
}

void draw() {
  background(255);
  current = new PVector(mouseX,mouseY);
  ps.addParticle(current);
  ps.run();
}