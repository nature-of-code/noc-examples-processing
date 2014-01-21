// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flow Field Following
// Via Reynolds: http://www.red3d.com/cwr/steer/FlowFollow.html

// Using this variable to decide whether to draw all the stuff
boolean debug = true;

PImage img;

// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  img = loadImage("face.jpg");
  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(16);
  vehicles = new ArrayList<Vehicle>();
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
}

void draw() {
  background(255);
  image(img, 0, 0);
  // Display the flowfield in "debug" mode
  if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }

  // Instructions
  fill(0);
  text("Hit space bar to toggle debugging lines.\nClick the mouse to generate a new flow field.", 10, height-20);
}


void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

void mouseDragged() {
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY), 3, 0.3));
}


