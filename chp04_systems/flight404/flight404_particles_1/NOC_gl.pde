// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

void renderImage(PImage img, Vec3D _pos, float _diam, color _col, float _alpha ) {
  pushMatrix();
  translate( _pos.x, _pos.y, _pos.z );
  tint(red(_col), green(_col), blue(_col), _alpha);
  imageMode(CENTER);
  image(img,0,0,_diam,_diam);
  popMatrix();
}