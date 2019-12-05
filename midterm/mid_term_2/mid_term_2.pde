ArrayList<Traps> traps = new ArrayList<Traps>();
Me me;
void setup() {
  me=new Me();
  size(1000, 680);
  noStroke();
  traps = new ArrayList<Traps>();
  traps.add(new Traps());
}

void draw() {
  background(255);
  me.move();
  me.drawMe();

  if (me.win()) {
    text("you won!",height/2,width/2);
  }
  
  
  rect(485, 485, 40, 40);
  for (int i = traps.size()-1; i >= 0; i--) { 
    Traps trap = traps.get(i);
    trap.move();
    trap.display();
    //if (trap.finished()) {
    //  // Items can be deleted with remove()
    //  trap.remove(i);
    //}
  }
}

class Traps {
  int x, y, speed;
  int[] ran={215, 485, 245, 285, 315, 345, 385, 415, 445};
  Traps() {
    x=ran[(int)random(0, ran.length-1)];
    y=ran[(int)random(0, ran.length-1)];
    speed=5;
  }
  void move() {
   if (x > width-215|| x < 215) {
    speed *= -1;
  }
  x += speed;
  }
  void display() {
    fill(0, 0, 255);
    circle(x, y, 30);
  }
}

class Me {
  float myX, myY, mySpeed;
  Me() {
    myX=150;
    myY=485;
    mySpeed=5;
  }
  void drawMe() {
    fill(255, 0, 0);
    circle(myX, myY, 30);
  }
  void move() {
    if (keyPressed) {
      if (key ==CODED) {
        if (myY== width-215 &&(myX<= width-215&&myX>=150)) {
          if (keyCode==LEFT) {
            myX-=mySpeed;
          } else if (keyCode==RIGHT) {
            myX+=mySpeed;
          }
        } else if (myY< width-215 && myY>215) {
          if (myX<= width-215&&myX>=215) {
            if (keyCode==LEFT) {
              myX-=mySpeed;
            } else if (keyCode==RIGHT) {
              myX+=mySpeed;
            } else if (keyCode==UP) {
              myY-=mySpeed;
            } else if (keyCode==DOWN) {
              myY+=mySpeed;
            }
          }
        } else if (myY==215&&(myX<= width-215&&myX>=215)) {
          if (keyCode==LEFT) {
            myX-=mySpeed;
          } else if (keyCode==RIGHT) {
            myX+=mySpeed;
          }
        }
      }
    }
  }
  boolean win() {
    if (myX>490&&myY==215) {
      return true;
    } else {
      return false;
    }
  }
}
