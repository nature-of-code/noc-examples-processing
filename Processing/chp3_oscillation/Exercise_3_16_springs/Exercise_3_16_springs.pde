// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Mover object
Bob[] bobs = new Bob[3];
Spring[] springs = new Spring[bobs.length-1];

void setup() {
  size(640, 360);
  // Create objects at starting location
  // Note third argument in Spring constructor is "rest length"
  for (int i = 0; i < bobs.length; i++) {
    bobs[i] = new Bob(width/2, 100+i*100); 
    if (i < bobs.length-1) {
      springs[i] = new Spring(100);
    }
  }
}

void draw() {
  background(255); 


  for (int i = 0; i < bobs.length; i++) {
    // Connect the bob to the spring (this calculates the force)
    if (i < bobs.length-1) {
      springs[i].connect(bobs[i], bobs[i+1]);
      springs[i].displayLine(bobs[i], bobs[i+1]); // Draw a line between spring and bob
    }
    // Constrain spring distance between min and max
    //spring.constrainLength(bob,30,200);

    // Update bob
    bobs[i].update();
    // Draw everything

    //bobs[i].display();

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

