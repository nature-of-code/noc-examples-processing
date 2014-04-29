class Ball {
  PVector location;
  PVector velocity;

  Ball() {
    location = new PVector(100, 100);
    velocity = new PVector(2.5, 5);
  }

  void update() {
    // Add the current speed to the location.
    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }
  void display() {
    // Display circle at x location
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
}

