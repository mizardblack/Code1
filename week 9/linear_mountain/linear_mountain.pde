PImage img;

void setup() {
  size(600, 600);
  img=loadImage("daddy.jpeg");
  //imageMode(CENTER);
}

void draw() {
  ////color picker
  //background(255);
  //imageMode(CENTER);
  //image(img, width/2, height/2, 300, 300);
  //color c=get(mouseX, mouseY);
  //background(c);
  //image(img, width/2, height/2, 300, 300);
  //imageMode(CENTER);
  //noStroke();
  //fill(c);
  //ellipse(mouseX, mouseY, 50, 50);

  ////mosaic
  //background(255);
  //for (int i=0; i<img.width; i+=30) {
  //  for (int j =0; j<img.height; j+=30) {
  //    color c= img.get(i, j);
  //    noStroke();
  //    fill(c);
  //    rect(i*width/img.width, j*height/img.height, 30, 30);
  //  }
  //}


  ////linear mountains
  background(0);
  for (int i =0; i<img.height; i+=10) {
    noFill();
    beginShape();
    for (int j=0; j<img.width; j+=10) {
      color c=img.get(j, i);
      float b=brightness(c);
      float x=j*width/img.width;
      float y=i*height/img.height;
      stroke(255);
      strokeWeight(2);
      vertex(x, y+map(b, 0, 255, 0, 15));
    }
    endShape();
  }

  ////inclass exercise
  //background(0);
  //for (int i =0; i<img.height; i+=7) {
  //  for (int j =0; j<img.height; j+=7) {
  //    color c= img.get(i, j);
  //    float b=brightness(c);
  //    float x=i*width/img.width;
  //    float y=j*height/img.height;
  //    String n="1";
  //    if (b<=100) {
  //      n="r";
  //    } else {
  //      n="m";
  //    }
  //    fill(255);
  //    text(n, x, y);
  //    noStroke();
  //  }
  //}
}
