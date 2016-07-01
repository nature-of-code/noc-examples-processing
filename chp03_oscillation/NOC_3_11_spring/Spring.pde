// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation

// Class to describe an anchor point that can connect to "Bob" objects via a spring
// Thank you: http://www.myphysicslab.com/spring2d.html

class Spring { 

  // position
  PVector anchor;

  // Rest length and spring constant
  float len;
  float k = 0.2;

  // Constructor
  Spring(float x, float y, int l) {
    anchor = new PVector(x, y);
    len = l;
  } 

  // Calculate spring force
  void connect(Bob b) {
    // Vector pointing from anchor to bob position
    PVector force = PVector.sub(b.position, anchor);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;

    // Calculate force according to Hooke's Law
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    b.applyForce(force);
  }

  // Constrain the distance between bob and anchor between min and max
  void constrainLength(Bob b, float minlen, float maxlen) {
    PVector dir = PVector.sub(b.position, anchor);
    float d = dir.mag();
    // Is it too short?
    if (d < minlen) {
      dir.normalize();
      dir.mult(minlen);
      // Reset position and stop from moving (not realistic physics)
      b.position = PVector.add(anchor, dir);
      b.velocity.mult(0);
      // Is it too long?
    } 
    else if (d > maxlen) {
      dir.normalize();
      dir.mult(maxlen);
      // Reset position and stop from moving (not realistic physics)
      b.position = PVector.add(anchor, dir);
      b.velocity.mult(0);
    }
  }

  void display() { 
    stroke(0);
    fill(175);
    strokeWeight(2);
    rectMode(CENTER);
    rect(anchor.x, anchor.y, 10, 10);
  }

  void displayLine(Bob b) {
    strokeWeight(2);
    stroke(0);
    line(b.position.x, b.position.y, anchor.x, anchor.y);
  }
}

