//eyesTurn for Code1 week 1

//Simone Sun

// Reference: bryan ma, https://github.com/whoisbma/Code_1_FA19/blob/master/w01_intro/w01d_mapping/w01d_mapping.pde#L14
// Reference: unknown, https://www.eyes-only.net/


void setup() {
  size (600, 600);
  background(0);
}

void draw() {
  //clean background
  background(0);
  
  //draw eyes
  int eyeR = (int)map(mouseX, 0, width, 0, 255);
  fill(eyeR);
  float eyeWidth = width/6;
  circle(width/3, height/3, eyeWidth); //left Eye
  circle(2*width/3, height/3, eyeWidth); //right Eye
  noStroke();

  //draw eye balls
  int ballR = (int)map(mouseX, 0, width, 255, 0);
  int ballG = (int)map(mouseY, 0, width, 0, 255);
  int ballB = (int)map(mouseX, 0, width, 0, 255);
  fill(ballR, ballG, ballB, 100);
  float x = mouseX *50/width + width/3.5 ;
  float y = mouseY *50/height + height/3.5;
  circle(x, y, width/12);//left Eye Ball
  float m = mouseX *eyeWidth/2/width + 2*width/3.5+30 ;
  float n = mouseY *eyeWidth/2/height + height/3.5;
  circle(m, n, width/12);//right Eye Ball
  
  //draw a mouth
  rect(width/2-50, 3*height/5, 100, 80);
  if (mouseY>height/2){
    fill(0);//mouth shut
  }
  rect(width/2-50, 3*height/5, 100, 60);
}
