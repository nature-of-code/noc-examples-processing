// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pathfinding w/ Genetic Algorithms

// Rocket class -- this is just like our Boid / Particle class
// the only difference is that it has DNA & fitness

class Rocket {

  // All of our physics stuff
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float recordDist;
  
  float fitness;
  DNA dna;
  
  // Could make this part of DNA??)
  float maxspeed = 6.0;
  float maxforce = 1.0;

  boolean stopped;  // Am I stuck?
  boolean dead; // Did I hit an obstacle?
  
  int finish;       // What was my finish? (first, second, etc. . . )

  //constructor
  Rocket(PVector l, DNA dna_) {
    acceleration = new PVector();
    velocity = new PVector();
    position = l.get();
    r = 2;
    dna = dna_;
    stopped = false;
    finish = 100000;  // Some high number to begin with
    recordDist = width;
  }

  // FITNESS FUNCTION 
  // distance = distance from target
  // finish = what order did i finish (first, second, etc. . .)
  // f(distance,finish) =   (1.0f / finish^1.5) * (1.0f / distance^6);
  // a lower finish is rewarded (exponentially) and/or shorter distance to target (exponetially)
  void calcFitness() {
    float d = recordDist;
    if (d < diam/2) {
      d = 1.0;
    }
    // Reward finishing faster and getting closer
    fitness = (1.0f / pow(finish,1.5)) * (1 / (pow(d,6)));
    
    //if (dead) fitness = 0;
  }

  void setFinish(int f) {
    finish = f;
  }

  // Run in relation to all the obstacles
  // If I'm stuck, don't bother updating or checking for intersection
  void run(ArrayList<Obstacle> o) {
    if (!stopped) {
      update();
      // If I hit an edge or an obstacle
      if ((borders()) || (obstacles(o))) {
        stopped = true;
        dead = true;
      }
    }
    // Draw me!
    display();
  }

   // Did I hit an edge?
   boolean borders() {
    if ((position.x < 0) || (position.y < 0) || (position.x > width) || (position.y > height)) {
      return true;
    } else {
      return false;
    }
  }

  // Did I make it to the target?
  boolean finished() {
    float d = dist(position.x,position.y,target.r.x,target.r.y);
    if (d < recordDist) {
      recordDist = d;
    }
    if (target.contains(position)) {
      stopped = true;
      return true;
    }
    return false;
  }

  // Did I hit an obstacle?
  boolean obstacles(ArrayList<Obstacle> o) {
    for (Obstacle obs : o) {
      if (obs.contains(position)) {
        return true;
      }
    }
    return false;
  }

  void update() {
    if (!finished()) {
      // Where are we?  Our position will tell us what steering vector to look up in our DNA;
      int x = (int) position.x/gridscale;
      int y = (int) position.y/gridscale;
      x = constrain(x,0,width/gridscale-1);  // Make sure we are not off the edge
      y = constrain(y,0,height/gridscale-1); // Make sure we are not off the edge

      // Get the steering vector out of our genes in the right spot
      // A little Reynolds steering here
      PVector desired = dna.genes[x+y*(width/gridscale)].get();
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired,velocity);
      acceleration.add(steer);
      acceleration.limit(maxforce);
      
      velocity.add(acceleration);
      velocity.limit(maxspeed);
      position.add(velocity);
      acceleration.mult(0);
    }
  }

  void display() {
    //fill(0,150);
    //stroke(0);
    //ellipse(position.x,position.y,r,r);
    float theta = velocity.heading() + PI/2;
    fill(200,100);
    stroke(0);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
  void highlight() {
    stroke(0);
    line(position.x,position.y,target.r.x,target.r.y);
    fill(255,0,0,100);
    ellipse(position.x,position.y,16,16);
 
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  boolean stopped() {
    return stopped;
  }

}
