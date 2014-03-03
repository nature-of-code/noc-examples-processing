// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Basic example of falling rectangles

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.particle.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;


void setup() {
  size(640, 360,P2D);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);

  // Create ArrayLists	
  boundaries = new ArrayList<Boundary>();
  boxes = new ArrayList<Box>();

  box2d.world.setParticleRadius(0.15f);
  box2d.world.setParticleDamping(0.2f);


  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(width/4, height-5, width/2-50, 10));
  boundaries.add(new Boundary(3*width/4, height-50, width/2-50, 10));
}

void mousePressed() {
  Box b = new Box(mouseX, mouseY);
  boxes.add(b);
}


void draw() {
  background(255);



  // We must always step through time!
  box2d.step();

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }
  for (Box b: boxes) {
    //b.display();
  }


  Vec2[] positionBuffer = box2d.world.getParticlePositionBuffer();
  if (positionBuffer != null) {
    for (int i = 0; i < positionBuffer.length; i++) {
      Vec2 pos = box2d.coordWorldToPixels(positionBuffer[i]);
      stroke(0);
      strokeWeight(2);
      point(pos.x, pos.y);
    }
  }

  fill(0);
  text(frameRate, 10, 60);
}

