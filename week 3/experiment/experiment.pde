import processing.sound.*;
Sound s;
int x;

void setup() {
  size(500, 200);
  SinOsc dou = new SinOsc(this);
  dou.play(120, 0.2);
  dou = new SinOsc(this);
  dou.play(125, 0.2);
  s = new Sound(this);
}

void draw() {
  background(0);
  makeKeys();
  interactive(mouseX, mouseY);
  fill(255, 200, 0);
  textSize(20);
  textAlign(CENTER);
  text("YAMAHA", width/2, 30);
}

void makeKeys() {
  for (float i=0; i< 1; i+=0.1 ) {
    fill(255);
    stroke(0);
    rect(lerp(0, width, i), 50, 50, 100);
  }
  for (float i=-0.1; i< 1; i+=0.1 ) {
    //if(i==0.2 || i==0.6){}
    //else{
    fill(0);
    stroke(255);
    rect(lerp(0, width, i)+35, 45, 30, 50);
    //}
  }
}

void interactive(float x, float y) {
  for (float i=0; i< 1; i+=0.1 ) {
    if (dist(x-25, y-50, lerp(0, width, i), 50)<25 || dist(x-25, y-100, lerp(0, width, i), 50)<25 ||dist(x-25, y+50, lerp(0, width, i), 50)<25 ) {
      fill(0);
      stroke(0);
      rect(lerp(0, width, i), 50, 50, 100);
      fill(255);
      stroke(0);
      rect(lerp(0, width, i)+3, 60, 50, 100);

      fill(0);
      stroke(255);
      rect(lerp(0, width, i)+35, 45, 30, 50);
      rect(lerp(0, width, i)-15, 45, 30, 50);
    }
  }
}

void mousePressed() {
  s.stop();
}
