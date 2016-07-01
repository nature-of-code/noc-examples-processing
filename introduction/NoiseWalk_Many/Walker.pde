// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker class!

class Walker {
  PVector position;

  PVector noff;

  Walker() {
    position = new PVector(width/2, height/2);
    noff = new PVector(random(1000),random(1000));
  }

  void display() {
    strokeWeight(2);
    fill(127);
    stroke(0);
    ellipse(position.x, position.y, 48, 48);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    
    position.x = map(noise(noff.x),0,1,0,width);
    position.y = map(noise(noff.y),0,1,0,height);
    
    noff.x += 0.01;
    noff.y += 0.01;
  }
}

