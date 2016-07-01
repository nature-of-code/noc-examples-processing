// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector position;
  
  Particle() {
    position = new PVector(); 
  }
  
  void setposition(float x, float y) {
    position.x = x;
    position.y = y; 
  }
  
  void display() {
    fill(random(255));
    ellipse(position.x,position.y,16,16); 
  }
  
  
}
