// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  float BallRadius;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    ballRadius = 24;
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 6;
  }

  void update() {

    acceleration = PVector.random2D();
    acceleration.mult(random(2));

    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, ballRadius*2, ballRadius*2);
  }

  void checkEdges() {

    if (position.x > width + ballRadius) {
      position.x = -ballRadius;
    } 
    else if (position.x < -ballRadius) {
      position.x = width + ballRadius;
    }

    if (position.y > height + ballRadius) {
      position.y = -ballRadius;
    } 
    else if (position.y < -ballRadius) {
      position.y = height + ballRadius;
    }
  }
}

