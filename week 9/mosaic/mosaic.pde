PImage img;

void setup() {
  size(600, 600);
  img=loadImage("daddy.jpeg");
  //imageMode(CENTER);
}

void draw() {
  //mosaic
  background(255);
  for (int i=0; i<img.width; i+=30) {
    for (int j =0; j<img.height; j+=30) {
      color c= img.get(i, j);
      noStroke();
      fill(c);
      rect(i*width/img.width, j*height/img.height, 30, 30);
    }
  }
}
