// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Recursive Tree (w/ ArrayList)

// A class for a leaf that gets placed at the end of 
// the last branches

class Leaf {
  PVector pos;

  Leaf(PVector l) {
    pos = l.get();
  }

  void display() {
    noStroke();
    fill(50,100);
    ellipse(pos.x,pos.y,4,4);   
  }
}

