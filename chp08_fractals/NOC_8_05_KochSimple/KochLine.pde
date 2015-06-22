// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Koch Curve
// A class to describe one line segment in the fractal
// Includes methods to calculate midPVectors along the line according to the Koch algorithm

class KochLine {

  // Two PVectors,
  // a is the "left" PVector and 
  // b is the "right PVector
  PVector start;
  PVector end;

  KochLine(PVector a, PVector b) {
    start = a.get();
    end = b.get();
  }

  void display() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }

  PVector kochA() {
    return start.get();
  }


  // This is easy, just 1/3 of the way
  PVector kochB() {
    PVector v = PVector.sub(end, start);
    v.div(3);
    v.add(start);
    return v;
  }    

  // More complicated, have to use a little trig to figure out where this PVector is!
  PVector kochC() {
    PVector a = start.get(); // Start at the beginning
    
    PVector v = PVector.sub(end, start);
    v.div(3);
    a.add(v);  // Move to point B

    v.rotate(-radians(60)); // Rotate 60 degrees
    a.add(v);  // Move to point C

    return a;
  }    

  // Easy, just 2/3 of the way
  PVector kochD() {
    PVector v = PVector.sub(end, start);
    v.mult(2/3.0);
    v.add(start);
    return v;
  }

  PVector kochE() {
    return end.get();
  }
}
