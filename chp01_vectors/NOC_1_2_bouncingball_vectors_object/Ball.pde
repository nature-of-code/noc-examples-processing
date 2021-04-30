class Ball {
  float ballRadius = 8;
  PVector position;
  PVector velocity;

  Ball() {
    position = new PVector(100, 100);
    velocity = new PVector(2.5, 5);
  }

  void update() {
    // Add the current speed to the position.
    position.add(velocity);
    if ((position.x > width - ballRadius) || (position.x < ballRadius)) {
      velocity.x = velocity.x * -1;
    }
    if ((position.y > height - ballRadius) || (position.y < ballRadius)) {
      velocity.y = velocity.y * -1;
    }
  }
  void display() {
    // Display circle at x position
    stroke(0);
    fill(175);
    ellipse(position.x, position.y, ballRadius*2, ballRadius*2);
  }
}

