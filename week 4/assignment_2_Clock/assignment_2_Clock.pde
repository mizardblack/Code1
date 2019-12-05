Stars moon_and_sun ;
color b1, b2, c1, c2;
boolean flag=true;
Tree minute;

void setup() {
  moon_and_sun= new Stars(50);
  size(800, 400);
  background(#e0e4cc);
  smooth();
  minute=new Tree();
  b1 = color(36, 117, 146);
  b2 = color(252, 153, 152);
  c1 = color(4, 34, 47);
  c2 = color(118, 37, 73);
}

void draw() {
  background(#FCF6E4);
  ifDay();
  moon_and_sun.drawStars();
  rectMode(CENTER);
  drawGround();
  if (flag) {
    minute.grow(width/2-10, height/2-100, 15, map(minute(), 0, 59, 0,height*2/3), b2, b1);
  } else {
    minute.grow(width/2-10, height/2-100, 15, map(minute(), 0, 59, 0, height*2/3), c2, c1);
  }
}

void drawGround() {
  if (flag) {
    fill(b1);
  } else {
    fill(c1);
  }
  rect(0, height*2/3+60, map(hour(), 0, 12, 0, width), height*2/5);
}

boolean ifDay() {
  boolean day =second()<=52&&second()>23;
  if (day==true) {
    drawSky(0, 0, width, height*2/3, b1, b2);
    flag=true;
  } else if (day =second()>52||second()<=23) {
    drawSky(0, 0, width, height*2/3, c1, c2);
    flag=false;
  }
  return flag;
}

void drawSky(int x, int y, float w, float h, color c1, color c2 ) {
  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i);
  }
}

class Stars {
  float radius;
  Stars(float r) {
    radius = r;
  }

  void drawStars() {
    pushMatrix(); 
    translate(width/2, height*2/3);
    float angle = map(second(), 0, 59, 0, 2*PI);
    rotate(angle);
    noStroke();
    fill(255, 0, 0);
    circle(160, 160, radius);
    fill(255);
    circle(-160, -160, radius);
    popMatrix();
  }
}

class Tree {
  float tall;
  Tree() {
  }

  void grow(int x, int y, float w, float h, color c1, color c2) {
    tall=map(minute(), 0, 59, height*2/3, 0);
    //rectMode(CENTER);
    for (float i = y+h; i >= y; i--) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}
