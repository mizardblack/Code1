/* 
 the program below draws three circles whose oscillation 
 is slightly off from one another. 
 
 instead of drawing the circles one by one, create a loop 
 that will draw 30 circles to the canvas to create the 
 wave pattern as shown in the example gif. use the iteration
 variable (e.g. 'i') from your loop to adjust the beginning 
 angle of each circle and space them out over the x-axis. 
 finally, adjust the amplitude so that the wave goes from 
 the top of the canvas to the bottom.
 */

ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(600, 600);
  for (int i=0; i<30; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(0);
  for (int i = balls.size()-1; i >= 0; i--) { 
    Ball ball = balls.get(i);
    ball.display(10*i);
    ball.update(0.4*i);
  }
}

class Ball {
  float angle = 0.0;
  float offset = height/2;
  float amplitude = height/2;
  float speed = 0.01;
  float y;
  Ball () {
  }
  void display(float j) {
    ellipse(10+1.9*j, y, 20, 20);
  }
  void update(float i) {
    angle += speed;
    y = offset + sin(angle+i) * amplitude;
  }
}
