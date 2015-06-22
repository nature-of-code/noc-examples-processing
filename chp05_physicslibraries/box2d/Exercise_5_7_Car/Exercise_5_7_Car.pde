// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example demonstrating revolute joints

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

// An object to describe a Car (a box and two joints)
Car car;

// An object to store information about the uneven surface
Surface surface;

void setup() {
  size(640, 360);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // Create the surface
  surface = new Surface();
  // Create the car
  car = new Car(100, 120);
}

void draw() {
  // We must always step through time!
  box2d.step();

  background(255);

  // Draw the surface
  surface.display();

  // Draw the car
  car.display();
}