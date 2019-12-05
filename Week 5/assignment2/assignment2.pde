int pSpeed, Xp, Yp;
float Wp, Hp, x, y, angle;
float scalar;
float g, b, a;

void setup() {
  size(440, 660);
  noStroke();
  rectMode(CENTER);
  scalar=10;
  pSpeed=5;
  Xp=width/2;
  Yp=height/2;
  Wp=25;
  Hp=25;
}

void draw() {

  background(0);
  for (float i=0; i<width+50; i+=40) {
    for (float j=-25; j<height; j+=40) {
      g=map(j, 0, height, 100, 0);
      b=map(j, 0, height, 150, 0);

      fill(0, g, b);
      rect(i, j, 35, 35);
      float ang=radians(angle);
      x = i + (scalar *2* cos(ang))+15;
      y = j + (scalar /2* sin(ang))+10;
      scalar=map(y, 0, height, 0, 30);

      fill(0, 102, 153);
      rect(x, y, scalar, scalar);
      angle+=0.05;
    }
  }

  if (keyPressed) {
    if (key ==CODED) {
      if (keyCode==UP) {
        Yp-=pSpeed;
        Hp=map(Yp, 0, height, 0, 50);
        Wp=map(Yp, 0, height, 0, 50);
      } else if (keyCode==DOWN) {
        Yp+=pSpeed;
        Hp=map(Yp, 0, height, 0, 50);
        Wp=map(Yp, 0, height, 0, 50);
      } else if (keyCode==LEFT) {
        Xp-=pSpeed;
      } else if (keyCode==RIGHT) {
        Xp+=pSpeed;
      }
    }
  }
  if (Xp<0) {
    Xp=width;
  } else if (Xp>width) {
    Xp=0;
  } else if (Yp<0) {
    Yp=height;
  } else if (Yp>height) {
    Yp=0;
  }
  a=map(Yp,0,height,0,300);
  fill(255, 204, 0, a);
  rect(Xp, Yp, Wp, Hp);
}
