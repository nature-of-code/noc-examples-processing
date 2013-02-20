// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation

// Class to describe an anchor point that can connect to "Bob" objects via a spring
// Thank you: http://www.myphysicslab.com/spring2d.html

class Spring { 

  // Location
  PVector anchor;

  // Rest length and spring constant
  float len;
  float k = 0.1;

  // Constructor
  Spring(int l) {
    len = l;
  } 

  // Calculate spring force
  void connect(Bob b1, Bob b2) {
    // Vector pointing from anchor to bob location
    PVector force = PVector.sub(b1.location, b2.location);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;

    // Calculate force according to Hooke's Law
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    b1.applyForce(force);
    force.mult(-1);
    b2.applyForce(force);
  }

  // Constrain the distance between bob and anchor between min and max
  void constrainLength(Bob b1, Bob b2, float minlen, float maxlen) {
    if (!b1.lock) {
      PVector dir = PVector.sub(b1.location, b2.location);
      float d = dir.mag();
      // Is it too short?
      if (d < minlen) {
        dir.normalize();
        dir.mult(minlen);
        // Reset location and stop from moving (not realistic physics)
        b1.location = PVector.add(b2.location, dir);
        b1.velocity.mult(0);
        // Is it too long?
      } 
      else if (d > maxlen) {
        dir.normalize();
        dir.mult(maxlen);
        // Reset location and stop from moving (not realistic physics)
        b1.location = PVector.add(b2.location, dir);
        b1.velocity.mult(0);
      }
    }
  }


  void displayLine(Bob b1, Bob b2) {
    strokeWeight(2);
    stroke(0);
    line(b1.location.x, b1.location.y, b2.location.x, b2.location.y);
  }
}

