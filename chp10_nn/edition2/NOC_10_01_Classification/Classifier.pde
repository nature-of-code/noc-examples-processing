// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

class Classifier {
  float a, b;

  Classifier(float a_, float b_) {
    a = a_;
    b = b_;
  }

  // The function to describe a line 
  float f(float x) {
    return a * x + b;
  }

  void display() {
    // Draw the line
    strokeWeight(2);
    stroke(0);
    float x1 = -width/2;
    float y1 = f(x1);
    float x2 = width/2;
    float y2 = f(x2);
    line(x1, y1, x2, y2);
  }

  int classify(float x, float y) {
    if (y < f(x)) {
      return -1;
    } else {
      return 1;
    }
  }
}