// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Stay Within Circle
// "Made-up" Steering behavior to stay within walls

Vehicle v;
boolean debug = true;


PVector circleposition;
float circleRadius;



void setup() {
  size(640, 360);
  v = new Vehicle(width/2, height/4);
  
  circleposition = new PVector(width/2,height/2);
  circleRadius = height/2-25;
}

void draw() {
  background(255);

  if (debug) {
    stroke(175);
    noFill();
    ellipse(circleposition.x,circleposition.y, circleRadius*2,circleRadius*2);
  }

  v.boundaries();
  v.run();
}

void mousePressed() {
  debug = !debug;
}

