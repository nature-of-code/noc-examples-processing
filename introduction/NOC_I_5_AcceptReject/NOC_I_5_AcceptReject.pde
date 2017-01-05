// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An array to keep track of how often random numbers are picked
float[] randomCounts;

void setup() {
  size(800, 200);
  randomCounts = new float[20];
}

void draw() {
  background(255);

  // Pick a random number and increase the count
  int index = int(acceptreject()*randomCounts.length);
  randomCounts[index]++;

  // Draw a rectangle to graph results
  stroke(0);
  strokeWeight(2);
  fill(127);

  int w = width/randomCounts.length;

  for (int x = 0; x < randomCounts.length; x++) {
    rect(x*w, height-randomCounts[x], w-1, randomCounts[x]);
  }
}

// An algorithm for picking a random number based on monte carlo method
// Here probability is determined by formula y = x
float acceptreject() {
  // Have we found one yet
  boolean foundone = false;
  int hack = 0;  // let's count just so we don't get stuck in an infinite loop by accident
  while (!foundone && hack < 10000) {
    // Pick two random numbers
    float r1 = (float) random(1);
    float r2 = (float) random(1);
    float y = r1*r1;  // y = x*x (change for different results)
    // If r2 is valid, we'll use this one
    if (r2 < y) {
      foundone = true;
      return r1;
    }
    hack++;
  }
  // Hack in case we run into a problem (need to improve this)
  return 0;
}