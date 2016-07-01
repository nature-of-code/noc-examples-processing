// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker class!

class Walker {
  PVector position;
  PVector velocity;
  PVector acceleration;

  ArrayList<PVector> history;

  PVector noff;


  Walker() {
    position = new PVector(width/2, height/2);
    history = new ArrayList<PVector>();
    noff = new PVector(random(1000), random(1000));
    velocity = new PVector();
    acceleration = new PVector();
  }

  void display() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(position.x, position.y, 16, 16);

    beginShape();
    stroke(0);
    noFill();
    for (PVector v: history) {
      vertex(v.x, v.y);
    }
    endShape();
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {


    acceleration.x = map(noise(noff.x), 0, 1, -1, 1);
    acceleration.y = map(noise(noff.y), 0, 1, -1, 1);
    acceleration.mult(0.1);

    noff.add(0.01, 0.01, 0);

    velocity.add(acceleration);
    velocity.limit(1);
    position.add(velocity);
    

    history.add(position.get());
    if (history.size() > 1000) {
      history.remove(0);
    }

    // Stay on the screen
    position.x = constrain(position.x, 0, width-1);
    position.y = constrain(position.y, 0, height-1);
  }
}

