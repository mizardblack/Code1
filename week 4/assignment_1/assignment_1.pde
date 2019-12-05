Object object1;
float rgb[]={0,0,0};

void setup() {
  object1 = new Object();
  size(600, 600, P3D);
  //rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  //object1.spin();
  object1.makeObject();
}

void mousePressed() {
  saveFrame("screenshot.png");
}
class Object {

  float angle; //angle of rotation
  int num; //number of boxes
  float rotateX; //degree of rotateX()
  float rotateY; //degree of rotateY()

  Object() {
    angle=0;
    num=12;
    rotateX=0;
    rotateY=0;
  }

  float[] makeUpColors(float[] rgb) {
    float rColor = map(mouseX, 0, width, 0, 255);
    float gColor = map(mouseY, 0, height, 0, 255);
    float bColor = map(mouseX, 0, width, 0, 255-random(0,255));
    rgb[0]=rColor;
    rgb[1]=gColor;
    rgb[2]=bColor;
    return rgb;
  }

  void makeObject() {
    lights();
    float[] c =object1.makeUpColors(rgb);
    for (int i = 0; i < num; i++) {
      pushMatrix();
      fill(c[0],c[1],c[2]);
      rotateY(angle + PI/24*i);
      rotateX(angle/2 + PI/24*i);
      box(dist(mouseX,mouseY,width/2,height/2));
      popMatrix();
    }
    angle += 0.01;
  }
  
  void spin(){
    float rotateY=map(mouseX, 0, width/2, 0, 360);
    rotateY(rotateY); 
  }
}
