// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Mover object
Bob[] bobs = new Bob[20];
Spring[] springs = new Spring[bobs.length-1];

void setup() {
  size(640, 360);
  // Create objects at starting location
  // Note third argument in Spring constructor is "rest length"
  for (int i = 0; i < bobs.length; i++) {
    bobs[i] = new Bob(width/2, i*15); 
    if (i < bobs.length-1) {
      springs[i] = new Spring(15);
    }
  }
  bobs[0].lock = true;
}

void draw() {
  background(255); 


  for (int i = 0; i < bobs.length; i++) {
    // Connect the bob to the spring (this calculates the force)
    if (i < bobs.length-1) {
      springs[i].connect(bobs[i], bobs[i+1]);
      springs[i].displayLine(bobs[i], bobs[i+1]); // Draw a line between spring and bob
      springs[i].constrainLength(bobs[i], bobs[i+1], 1, 25);
    }
    // Constrain spring distance between min and max

    // Update bob
    bobs[i].update();
    // Draw everything

    bobs[i].display();

    bobs[i].drag(mouseX, mouseY);
  }



  fill(0);
  text("click on bob to drag", 10, height-5);
}


// For mouse interaction with bob

void mousePressed() {
  for (Bob b : bobs) {
    b.clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (Bob b : bobs) {
    b.stopDragging();
  }
  //bob.stopDragging();
}

