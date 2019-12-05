ArrayList<Buildings> blocks = new ArrayList<Buildings>();
Me ball;
int r;

void setup() {
  ball=new Me();
  size(1000, 680, P3D);
  noStroke();
  blocks = new ArrayList<Buildings>();
}

void draw() {
  background(0);
  //translate(width/2, 280, 0);
  lights();
  //rotateX(radians(435));
  //rotateZ(radians(map(mouseX, -1000, 0, 0, -360)));
  r= (int)random(0, 60);
  ball.move();
  ball.drawMe();
  
 
  if (r==5) {
    blocks.add(new Buildings(random(0, 5), random(0, 5)));
  }
  for (int i = blocks.size()-1; i >= 0; i--) { 
    Buildings block = blocks.get(i);
    block.move();
    println("y=", block.getY());
    block.display();
    if (block.finished()) {
      // Items can be deleted with remove()
      blocks.remove(i);
    }
  }
}

class Buildings {
  float x, y, z, w, a, speed, h, s, l;
  Buildings(float _w, float _a) {
    speed=1;
    x=width/2;
    y=0;
    w=_w;
    a=_a;
    h=random(0, 255);
  }
  void move() {
    pushMatrix();
    y+=speed;
    //z+=speed;
    translate(width/2, y, z);
    popMatrix();
    w+=speed;
    a+=speed/3;
    s+=speed;
    l+=speed;
  }
  void display() {
    fill(h, s, l);
    translate(0,y, 0);
    box(w, a, a);
  }
  boolean finished() {
    if (y >=height) {
      return true;
    } else {
      return false;
    }
  }
  float getY() {
    return y;
  }
}

class Me {
  float myX, myY, myA, mySpeed;
  Me() {
    myX=width/2;
    myY=height-70;
    myA=50;
    mySpeed=5;
  }
  void drawMe() {
    fill(255, 0, 0);
    translate(myX, myY, 0);
    box(myA);
  }
  void move() {
    if (keyPressed) {
      if (key ==CODED) {
        if (keyCode==LEFT && myX>0) {
          myX-=mySpeed;
        } else if (keyCode==RIGHT && myX<width-myA) {
          myX+=mySpeed;
        }
      }
    }
  }
}
