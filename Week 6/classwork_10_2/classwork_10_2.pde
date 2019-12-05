int num = 10;
float[] xpos = new float[num];
float[] ypos = new float[num];
float[] xSpeed = new float [num];
float[] ySpeed = new float [num];
float[] hue=new float[num];

void setup() {
  size(600, 600);
  colorMode(HSB);
  //noStroke();
  for (int i = 0; i < num; i++) {
    xpos[i] = width/2;
    ypos[i] = height/2;
    xSpeed[i] = random(-5, 5);
    ySpeed[i] = random(-5, 5);
    hue[i]=random(0, 255);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < num; i++) {
    if (xpos[i] > width - 15 || xpos[i] < 15) {
      xSpeed[i] *= -1;
    }
    if (ypos[i] > height - 15 || ypos[i] < 15) {
      ySpeed[i] *= -1;
    }
    xpos[i] += xSpeed[i];
    ypos[i] += ySpeed[i];
    fill(hue[i], 200, 240); 
    if (mousePressed && dist(mouseX, mouseY, xpos[i], ypos[i])<50 ) {
      fill(hue[i], 200, 240);
    } else {
      hue[i]=random(0, 255);
    }
    ellipse(xpos[i], ypos[i], 30, 30);
  }
}
