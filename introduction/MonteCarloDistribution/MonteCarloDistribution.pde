// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net

float[] vals;
float[] norms;

void setup () {
  size (400, 300);
  
  vals = new float[width];
  norms = new float[width];
}

void draw () {
  background(100);
  
  float n = montecarlo();
  
  int index = int (n * width);
  vals[index]++;
  stroke(255);
  
  boolean normalization = false;
  float maxy = 0.0;
  
  for (int x = 0; x < vals.length; x++) {
    line (x, height, x, height-norms[x]);
    if (vals[x]>height) normalization = true;
    if (vals[x]>maxy) maxy = vals[x];
  }
  
  for (int x = 0; x < vals.length; x++) {
    if (normalization) norms[x] = (vals[x] / maxy) * (height);
    else norms[x] = vals[x];
  }
}

float montecarlo () {
  boolean foundone = false;
  int hack = 0;
  
  while (!foundone && hack < 10000) {
    float r1 = (float) random (1);
    float r2 = (float) random (1);
    float y = r1 * r1;
    
    if (r2 < y) {
      foundone = true;
      return r1;
    }
    
    hack++;
  }
  
  return 0;
}
