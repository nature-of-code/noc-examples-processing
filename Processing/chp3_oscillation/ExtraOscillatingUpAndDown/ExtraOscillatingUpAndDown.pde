float angle = 0;
void setup() {
  size(400,400); 
}

void draw() {
 background(255);
  float y = sin(angle);
  
  fill(127);
  line(width/2,height/2,width/2,y);
  ellipse(width/2,y,16,16);
}
