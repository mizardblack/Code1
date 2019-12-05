Ball b;
Paddle p;

void setup() {
  rectMode(CENTER);
  size(500, 500);
  background(255);
  b=new Ball(300,300);
  p =new Paddle(100, mouseY, 10, 60);
}

void draw() {
  background(255);
  b.update();
  b.drawBalls();
  b.checkPaddle(p);
  p.drawPaddle();
}

class Ball {
  float x, y, sx, sy, r;
  Ball(float _x, float _y) { //custmized constructer
    x=_x;
    y=_y;
    sx=random(-5, 5);
    sy = random(-5, 5);
    r = 40;
  }
  void drawBalls() {
    ellipse(x, y, r, r);
  }
  void update() {
    if (x > width - r|| x < r) {
      sx*=-1;
    }
    if (y > width - r|| y < r) {
      sy*=-1;
    }
    x += sx;
    y += sy;
  }
  void checkPaddle(Paddle p) { //pass the actuall Paddle p, so if p is changed, the valuse chaged
    if (y <= mouseY + 30 && y >= mouseY - 30 && x >= 60 && x <= 80) {
      sx*=-1;
    }
  }
}
class Paddle {
  float x, y, w, h;
  Paddle(float _x, float _y, float _w, float _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  void drawPaddle() {
    fill(0);
    rect(x, mouseY, w, h);
  }
  
}
