// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

// A random walker class!

class Walker {
  PVector pos;

  Walker() {
    loc = new PVector(width/2,height/2);
  }

  void render() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(pos.x,pos.y,40,40);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    PVector vel = new PVector(random(-2,2),random(-2,2));
    pos.add(vel);
    
    // Stay on the screen
    pos.x = constrain(pos.x,0,width-1);
    pos.y = constrain(pos.y,0,height-1);
  }
}

