// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Class to describe a car

class Car {
  // Our object is one box and two wheels
  Box box;
  Particle wheel1;
  Particle wheel2;

  Car(float x, float y) {
    // Initialize location of the box
    box = new Box(x, y, 100, 30, false);
    // Initialize location of two wheels
    wheel1 = new Particle(x-28, y+16, 12);
    wheel2 = new Particle(x+28, y+16, 12);

    // Define joints
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(box.body, wheel1.body, wheel1.body.getWorldCenter());
    rjd1.motorSpeed = -PI*2;
    rjd1.maxMotorTorque = 300.0;
    rjd1.enableMotor = true;
    box2d.world.createJoint(rjd1);

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(box.body, wheel2.body, wheel2.body.getWorldCenter());
    rjd2.motorSpeed = -PI*2;
    rjd2.maxMotorTorque = 300.0;
    rjd2.enableMotor = true;
    box2d.world.createJoint(rjd2);
  }

  void display() {
    box.display();
    wheel1.display();
    wheel2.display();
  }
}