// The Nature of Code
// http://natureofcode.com
// Spring 2014
// New 3D Physics Test with bRigid and jBullet

// bRigid provides classes for an easier handling of jBullet in Processing. 
// bRigid is thought as a kind of Processing port for the bullet physics simulation library written in C++. 
// This library allows the interaction of rigid bodies in 3D. 
// Geometry/ Shapes are build with Processing PShape Class, for convinient display and export 
// (c) 2013 Daniel Köhler, daniel@lab-eds.org

// This basic example is adapted from bRigid ones to demonstrate a bit more manual control over drawing
// Ultimately this example should probably employ the box2d for processing methodology of wrapping BObject inside a "Particle" class.

import javax.vecmath.Vector3f;
import javax.vecmath.Matrix4f;

import peasy.*;
import bRigid.*;
import com.bulletphysics.linearmath.Transform;
import com.bulletphysics.dynamics.RigidBody;

// Simple camera stuff
PeasyCam cam;

// Physics world
BPhysics physics;
// Stored geometry
BBox box;

// Extends of physics world
// This world is not scaled, which may be a problem
Vector3f min = new Vector3f(-320, -250, -320);
Vector3f max = new Vector3f(320, 250, 320);

public void setup() {
  size(640, 360, P3D);

  cam = new PeasyCam(this, 600);

  // Create a rigid physics engine with a bounding box
  physics = new BPhysics(min, max);
  // Set gravity
  physics.world.setGravity(new Vector3f(0, 500, 0));

  // Create the first rigidBody as Box or Sphere
  // BBox(PApplet p, float mass, float dimX, float dimY, float dimZ)
  box = new BBox(this, 1, 50, 50, 50);
}

public void draw() {
  background(51);
  lights();

  // Note the library is taking care of translating world relative to center 
  noFill();
  stroke(0);
  box(max.x - min.x, max.y-min.y, max.z-min.z);

  // Randomly make new boxes
  if (random(1)<0.1) {
    // Starting point
    Vector3f pos = new Vector3f(0, min.y, 0);
    // Re-use the rigidBody of the box for performance resons
    // BObject(PApplet p, float mass, BObject body, Vector3f center, boolean inertia)
    BObject r = new BObject(this, 100, box, pos, true);
    // Add body to the physics engine
    physics.addBody(r);
  }

  // Update physics engine every frame
  physics.update();

  // Debug draw the entire world
  //physics.display();

  for (BObject b : physics.rigidBodies) {
    // Debug draw each invididual object
    //b.display(200, 200, 200);
    
    // Now accessing jBullet directly to draw a box
    RigidBody rb = b.rigidBody;
    Transform trans = new Transform();
    // Get the shape's Transformation
    rb.getMotionState().getWorldTransform(trans);
    // Now we get its transformation matrix
    Matrix4f out = new Matrix4f();
    trans.getMatrix(out);  
    
    pushMatrix();
    // Apply that matrix before drawing the box
    applyMatrix(out.m00, out.m01, out.m02, out.m03, out.m10, out.m11, out.m12, out.m13, out.m20, out.m21, out.m22,     out.m23, out.m30, out.m31, out.m32, out.m33);
    fill(200, 200, 200);
    box(50);
    popMatrix();
  }
}

