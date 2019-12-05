int t = 1;
void setup() {
  size (400, 400);
  background(0);
}

void draw() {
  text("click your mouse to reprodcue the cells", 0, height/2);
  fill(255);
}
void mouseClicked() {
  //clean the previous circles
  background(0);
  fill(0);
  stroke(255);
  strokeWeight(2);
  float d = (float)height / t; //diameter of the circlestypetype
  // (int)height = 400
  // (float)height = 400.0

  //draw the circles
  println("starting to draw circles for t = ", t);
  for (int j=1; j<2*t; j+=2) {
    for (int l=1; l<2*t; l+=2) {
      float x = width * j / (2*t);
      float y = height * l / (2*t);
      println("...drawing circle at pos with diam: ", x, y, d);
      circle(x, y, d);
    }
  }
  t *= 2; // for next time through
}
