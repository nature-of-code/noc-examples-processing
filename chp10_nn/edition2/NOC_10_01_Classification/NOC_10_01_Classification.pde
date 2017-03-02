// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Classifier classifier;

void setup() {
  size(640, 360);
  background(127);
  classifier = new Classifier(0.4, 1);
  translate(width/2, height/2);
  classifier.display();
}


void draw() {
  translate(width/2, height/2);

  float x = random(-width/2, width/2);
  float y = random(-height/2, height/2);

  int category = classifier.classify(x, y);
  noStroke();
  fill(0);
  if (category > 0) {
    fill(255);
  } else {
    fill(0);    
  }
  ellipse(x, y, 8, 8);
}