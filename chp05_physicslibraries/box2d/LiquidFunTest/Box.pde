// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A rectangular box
class Box {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  
  ParticleGroup pg;

  // Constructor
  Box(float x, float y) {
    w = random(1, 3);
    h = random(1, 3);

    PolygonShape shape = new PolygonShape();
    Vec2 pos = box2d.coordPixelsToWorld(x, y);
    shape.setAsBox(w, h, pos, 0);
    ParticleGroupDef pd = new ParticleGroupDef();
    pd.shape = shape;
    pg = box2d.world.createParticleGroup(pd);
  }

  // Drawing the box
  void display() {

  }
}

