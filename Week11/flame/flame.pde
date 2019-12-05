
ArrayList<Ball> balls = new ArrayList<Ball>();


void setup() {
  size(800, 600);
  //balls.add(new Ball());
  for (int i=0; i<100; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(0);

  for (Ball b : balls) {
    b.applyForce();
    b.update();
    b.display();
  }
}

//void mousePressed() {
//  balls.add(new Ball());
//}

class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector f ;

  float size = 3;

  Ball() {
    pos = new PVector(random(100, width-100), height/2);
    vel = new PVector(0, random(-5, 5));//??
    acc = new PVector(0, 0);//?
    if (vel.x>=0) {
      f = new PVector(0, -0.5);
    } else if (vel.x<0) {
      f = new PVector(0, 0.5);
    }
  }


  void update() {
    vel.add(acc);//??
    pos.add(vel);
    acc.mult(0);
    
    if (pos.x < size/2) {
      pos.x = size/2;
      vel.x *= -1;
    } else if (pos.x > width - size/2) {
      pos.x = width - size/2;
      vel.x *= -1;
    }

    if (pos.y > height - size/2) {
      pos.y = height - size/2;
      vel.y *= -1;
    } else if (pos.y <size/2) {
      pos.y = size/2;
      vel.y *= -1;
    }
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }

  void applyForce() {
    acc.add(f);
  }
}
