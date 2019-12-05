Ball b;
Paddle p;

void setup() {
  rectMode(CENTER);
  size(600, 600);
  b = new Ball(width/2, height/2); //constructor returns the instance
  p = new Paddle(50, mouseY, 10, 60);
}

void draw() {
  background(255);

  b.update();
  b.display();
  b.checkPaddle(p);
  p.drawPaddle();
}

class Paddle {
  float x, y, w, h;

  Paddle(float _x, float _y, float _w, float _h) {

    x = _x;
    y = _y;
    w = _w; 
    h = _h;
  }

  void drawPaddle() {
    rect(x, mouseY, w, h);
  }
}

class Ball {
  float x;
  float y;
  float dx; 
  float dy;
  float r;

  Ball(float _x, float _y) {
    x = _x;
    y = _y;
    dx = random(-5, 5);
    dy = random(-5, 5);
    r = 40;
  }

  void update() {
    if (x > width - r/2 || x < r/2) {
      dx *= -1;
    }
    if (y > height - r/2 || y < r/2) {
      dy *= -1;
    }

    x += dx;
    y += dy;
  }

  void checkPaddle(Paddle p) {
    if (y <= mouseY + 30 && y >= mouseY - 30 && x >= 60 && x <= 80) {
      dx *= -1;
    }
  }

  void display() {
    {
      ellipse(x, y, r, r);
    }
  }
}
