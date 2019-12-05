PImage img;

void setup() {
  size(400, 400);
  img=loadImage("daddy.jpeg");
}

void draw() {
  //b&w img
  background(255);
  loadPixels();
  for (int i=0; i <img.pixels.length; i++) {
  float b =brightness(img.pixels[i]);
  color c =color(b);
  pixels[i]=c;
  }
  updatePixels();
}
