//Test 1 for Code1 week 1

//Simone Sun

// Reference: bryan ma, https://github.com/whoisbma/Code_1_FA19/blob/master/w01_intro/w01d_mapping/w01d_mapping.pde#L14

int t = 1;

void setup() {
  size (600, 600);
  background(0);
}

void draw() {
  fill(map(mouseX, 0, width, 0, 255));
  circle(width/3, height/3, width/6); //leftEye
  circle(2*width/3, height/3, width/6); //rightEye
  noStroke();
  // map the fill color of a rect to mouseX, from 255 to 0.
  
  float leftEyeX = map(mouseX, 0, width, width/3-width/48, width/3+width/48);
  float leftEyeY = map(mouseX, 0, height, height/3-width/24, height/3+width/24);
  float rightEyeX = map(mouseX, 0, width, 2*width/3-width/48, 2*width/3+width/48);
  float rightEyeY = map(mouseX, 0, height, height/3-width/24, height/3+width/24);
  fill(map(mouseX, 0, width, 255, 0));
  circle(leftEyeX, leftEyeY, width/12); //leftEyeBall
  circle(rightEyeX, rightEyeY, width/12); //rightEyeBall

}

void mouseClicked() {
  //clean the previous circles
  background(0);

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
      fill(0, 0, 0, 0);
      stroke(255);
      strokeWeight(2);
      circle(x, y, d);
    }
  }
  t *= 2; // for next time through
}
