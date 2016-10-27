

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  fullScreen();
  //size (1080, 720); 

  noFill();
  strokeWeight(2);
  noStroke();
  colorMode(HSB, 72);
  frameRate(30);
}
float hu = 0;
float t = 0;
float p = 0;
float o = 0;
float u = 0;
void draw() {

  //println(frameCount);

  background(0);

  translate(width / 2, height / 2);
  rotate(o * 4 * .577);
  rotate(p * .577);
  beginShape();
  for (PVector v : points) {
    stroke(hu, 25, 55, 10);
    vertex(v.x, v.y, v.z);
    hu += 10;
    if (hu > 255.0) {
      hu = 0;
    }
  }
  for (float theta=0; theta <= 2 * PI; theta += 0.1) {
    float rad = r(theta, 
      12.0, //a
      t, //b
      t, //m
      2.0, //n1
      cos(-p) * .1 + .5 - sin(t) * 0.5 + 0.1, 
      sin(-p) * 0.5 + 0.1 + sin(t) * 0.5 + 0.1 /.577 //n2
      //n3



      );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    //float z = rad * tan(theta) * 50;
    vertex(x, y);
    points.add(new PVector(x, y));
  }

  for (float theta=0; theta <= 2 * PI; theta += 0.1) {
    float rad = r(theta, 
      12.0, //a
      t * theta, //b
      t, //m
      2.0, //n1
      noise(cos(-t) * .1 + .5 - sin(p) * 0.5 + 0.1, PI * .577), //N2/N3
      noise(sin(-t) * 0.5 + 0.1 / cos(p) * .1 + .5, .577) //n2/N3




      );
    float x2 = rad * cos(theta) * 100;
    float y2 = rad * sin(theta) * 100;
    //float z = rad * tan(theta) * 50;
    vertex(x2, y2);
    //points.add(new PVector(x2, y2));
  }

  for (float theta=0; theta <= 2 * PI; theta += 0.1) {
    float rad = r(theta, 
      1.0, //a
      -t * theta, //b
      -t, //m
      -2.0, //n1
      noise(u, cos(-t) * .1 + .5 * sin(p) * 0.5 + 0.1), //N2/N3
      degrees(noise(sin(-t) * 0.5 + 0.1 / cos(p) * .1 + .5, u)) //n2/N3




      );
    float x3 = rad * cos(theta) * 200;
    float y3 = rad * sin(theta) * 200;
    //float z = rad * tan(theta) * 50;
    vertex(x3, y3);
    //points.add(new PVector(x3, y3));
  }
  for (float theta=0; theta <= 2 * PI; theta += 0.1) {
    float rad = r(theta, 
      PI / -10.0, //a
      t * theta, //b
      t, //m
      2.0, //n1
      noise(cos(-t) * .1 + .5 * sq(sin(-p) * 0.5 + 0.1), .1), //N2/N3
      radians(noise(sin(-t) * 0.5 + 0.1 / pow(cos(-p) * .1 + .5, 3), .5)) //n2/N3




      );
    float x4 = rad * cos(theta) * 300;
    float y4 = rad * sin(theta) * 300;
    //float z = rad * tan(theta) * 50;
    vertex(x4, y4);
    //points.add(new PVector(x4, y4));
  }

  endShape();

  t += .1;
  p += .1;
  o += .01;
  u += random(-100.0, 100.0);
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}