// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x , float y) {
    mass = m;
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(175,200);
    ellipse(position.x,position.y,mass*2,mass*2);
  }

  PVector repel(Mover m) {
    PVector force = PVector.sub(position,m.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance,1.0,10000.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(-1*strength);                                      // Get force vector --> magnitude * direction
    return force;
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } 
    else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    }

    if (position.y > height) {
      position.y = height;
      velocity.y *= -1;
    } 
    else if (position.y < 0) {
      position.y = 0;
      velocity.y *= -1;
    }

  }

}




