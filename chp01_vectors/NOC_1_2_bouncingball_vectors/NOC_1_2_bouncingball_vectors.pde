// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-2: Bouncing Ball, with PVector!
PVector position;
PVector velocity;
float ballRadius = 8;

void setup() {
  size(200,200);
  background(255);
  position = new PVector(100,100);
  velocity = new PVector(2.5,5);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // Add the current speed to the position.
  position.add(velocity);

  if ((position.x > width - ballRadius) || (position.x < ballRadius)) {
    velocity.x = velocity.x * -1;
  }
  if ((position.y > height - ballRadius) || (position.y < ballRadius)) {
    velocity.y = velocity.y * -1;
  }

  // Display circle at x position
  stroke(0);
  fill(175);
  ellipse(position.x, position.y, ballRadius*2, ballRadius*2);
}


