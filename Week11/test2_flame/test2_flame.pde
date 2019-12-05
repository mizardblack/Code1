
ArrayList<Ball> balls = new ArrayList<Ball>();
//ArrayList<Stem> stems = new ArrayList<Stem>();

void setup() {
  size(400, 680);
  rectMode(CENTER);
  for (int i=0; i<200; i++) {
    balls.add(new Ball());
    //stems.add(new Stem());
  }
}

void draw() {
  background(0);

  for (Ball b : balls) {
    b.display();
    b.update();
    b.displayStem();
  }
  
  fill(0);
  triangle(0,0,width/2,0,0,200);
  triangle(width/2,0,width,0,width,200);
}

class Ball {
  float x, y1, y2, y3;
  float angle1;
  float diameter, scalar1, scalar2, scalar3;
  float rdm1, rdm2, rdm3, rdm4;

  Ball() {
    x = random(width/4, width*3/4); 
    y1 = random(60, 130);
    y2 = random(20, 60);
    y3 = random(160, 180);
    diameter= 1.5;
    scalar1=random(1, 2);
    scalar2=random(0.3, 2.5);
    scalar3=random(0.1, 2);
    
    rdm1=random(60,100);
    rdm2=random(200,400);
    rdm3=random(100,200);
    rdm4=random(60,100);
  }

  void display() {
    float ang1 = radians(angle1);

    y1 += (scalar1 * cos(ang1));
    y2 += (scalar2 * sin(ang1));
    y3 += (scalar3 * cos(ang1));
    fill(255);
    noStroke();
    ellipse(x, y1, diameter, diameter);
    ellipse(x, y2, diameter, diameter);
    ellipse(x, y3, diameter, diameter);
  }
  void update() {
    angle1 += random(0.5, 2);
  }
  
  void displayStem(){
    fill(250,50,100);//red
    rect(x,0,0.75,y3*2-rdm1);
    fill(0,180,250);//blue
    rect(x,0,0.75,y2*2-rdm3);
    fill(80,180,150);//green
    rect(x,0,0.75,y1*2-rdm4);
    fill(250);//white
    rect(x+5,0,0.5,y3*2-rdm2);
  }

  //PVector get_Ball_1_Pos() {
  //  PVector pos = new PVector(x, y1);
  //  return pos;
  //}
  //PVector get_Ball_2_Pos() {
  //  PVector pos = new PVector(x, y2);
  //  return pos;
  //}
}

//class Stem {
//  PVector stemPos1, stemPos2, stemPos3;
//  Stem () {
//  }
//  void update(){
//    for (Ball b : balls) {
//      stemPos1 = b.get_Ball_1_Pos();
//      stemPos2 = b.get_Ball_1_Pos();
//      stemPos3 = b.get_Ball_1_Pos();
//    }
//  }
//  void display() {
//    fill(0,0,255);
//    rect(stemPos1.x, 0, 1.5, stemPos1.y*2);
//    rect(stemPos2.x, 0, 1.5, stemPos2.y*2);
//    rect(stemPos3.x, 0, 1.5, stemPos3.y*2);
//  }
//}
