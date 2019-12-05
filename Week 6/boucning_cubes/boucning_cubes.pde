int num = 6;
float[] xpos1 = new float[num];
float[] ypos1 = new float[num];
float[] length1= new float[num];
float[] width1= new float[num];
float[] xSpeed1 = new float [num];
color[] hue=new color[num];

float[] xpos2 = new float[num];
float[] ypos2 = new float[num];
float[] length2= new float[num];
float[] width2= new float[num];
float[] ySpeed2 = new float [num];
float[] hue2=new float[num];

int randPos;
int randColor;
int randLeng;
int randWid;
int wid[]={ 40, 60, 80, 100, 120};
int leng[]={ 40, 60, 80, 100, 120};
color colorPalletR[] = {#F41621, #1B80BD, #FBE138, #000000};
int pos[]={20, 60, 100, 140, 180, 220, 260, 300, 340, 380, 420, 460, 500, 540, 580};

void setup() {
  background(#F4F4F4);
  size(400, 600);
  rectMode(CENTER);
  //strokeWeight(5);
  //noStroke();
  for (int i = 0; i < num; i++) {
    randColor = (int)random(colorPalletR.length);
    randPos = (int)random(pos.length);
    randLeng= (int)random(wid.length);
    randWid=(int)random(wid.length);
    if ((i!=0)&&(pos[randPos]== ypos1[i-1])) {
      randPos = (int)random(pos.length);
    }

    xpos1[i] = 100;
    ypos1[i] = pos[randPos];
    length1[i]= leng[randLeng];
    width1[i]= wid[randWid];
    xSpeed1[i] = random(-5, 5);
    hue[i]=colorPalletR[randColor];

    xpos2[i] = pos[randPos];
    ypos2[i] = 80;
    length2[i]= leng[randLeng];
    width2[i]= wid[randWid];
    ySpeed2[i] = random(-5, 5);
    //hue2[i]=colorPalletR[rand];
  }
}

void draw() {
  background(255);
  noStroke();
  for (int i = 0; i < num; i++) {
    fill(255);
    rect(width/2, ypos1[i], width, length1[i]);
    if (xpos1[i] > width - 15 || xpos1[i] < 15) {
      xSpeed1[i] *= -1;
    }
    if (ypos2[i] > height - 15 || ypos2[i] < 15) {
      ySpeed2[i] *= -1;
    }
    //check collision
    //for (int j=0; j<num; j++) {
    //  if (i!=j) {
    //    if (dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<width1[i]*0.5||
    //      dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<length1[i]*0.5||
    //      dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<width2[i]*0.5||
    //      dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<length2[i]*0.5) {
    //      xSpeed1[i] *= -1;
    //      ySpeed2[i] *= -1;
    //    }
    //  }
    //}
    
    if (dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<width1[i]*0.8||
      dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<length1[i]*0.8||
      dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<width2[i]*0.8||
      dist(xpos1[i], ypos1[i], xpos2[i], ypos2[i])<length2[i]*0.8) {
      xSpeed1[i] *= -1;
      ySpeed2[i] *= -1;
    }

    //horizontal cubes
    xpos1[i] += xSpeed1[i];
    fill(hue[i]);
    rect(xpos1[i], ypos1[i], width1[i], length1[i]);
    //fill(255);
    //rect(xpos1[i]-width1[i]/2-5, ypos1[i], 12, length1[i]-20);
    //rect(xpos1[i]+width1[i]/2+5, ypos1[i], 12, length1[i]-20);

    //virtal cubes
    ypos2[i] += ySpeed2[i];
    fill(hue[i]); 
    rect(xpos2[i], ypos2[i], width2[i], length2[i]);

    //fill(255);
    //rect(xpos2[i], ypos2[i]-5-length2[i]/2, width2[i]-20, 12);
    //rect(xpos2[i], ypos2[i]+5+length2[i]/2, width2[i]-20, 12);

    //if (mousePressed && dist(mouseX, mouseY, xpos1[i], ypos2[i])<50 ) {
    //fill(hue1[i], 200, 240);
    //} else {
    //hue1[i]=random(0, 255);
    //}

    fill(0);
    rect(width/2, ypos1[i]-length1[i]/2, width, 10);
    rect(width/2, ypos1[i]+length1[i]/2, width, 10);

    fill(0);
    rect(xpos2[i]-width2[i]/2, height/2, 10, height);
    rect(xpos2[i]+width2[i]/2, height/2, 10, height);
  }
}
