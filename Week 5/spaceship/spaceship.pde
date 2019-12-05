//reference from: https://processing.org/examples/arraylistclass.html

// Create an empty ArrayList (will store Ball objects)
ArrayList<Ball> balls;
int ballWidth = 100;
float x, y, angle;
float scalar;
Yolk p;

void setup() {
  p = new Yolk();
  size(640, 620);
  noStroke();
  rectMode(CENTER);
  scalar=1;

  // Start by adding one element
  balls = new ArrayList<Ball>();

}

void draw() {

  background(0);

  //show instructions
  textSize(60);
  fill(120, 222, 273);
  strokeWeight(60);  
  text("Fried Egg Spaceship", width/2-280, height/2-30); 
  fill(30, 132, 183);
  textSize(40);
  strokeWeight(10);  
  text("press key 'N' to spin,", width/2-190, height/2+60);
  fill(0, 102, 153);
  textSize(30);
  text("use keys ARROWS to MOVE.", width/2-195, height/2+100);

  p.drive();

  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    }
  }

  if (key == 'n' || key == 'N') {
    // A new ball object is added to the ArrayList (by default to the end)
    balls.add(new Ball(p.getXp(), p.getYp(), p.getWp()));
  }
}

// Simple bouncing ball class
class Ball {

  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 20;

  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
  }

  void move() {
    float ang = radians(angle);
    println(angle);

    x = p.getXp() + (scalar * 2*cos(ang));
    y = p.getYp() + (scalar * sin(ang));
    scalar=map(y, 0, height, 0, 100);
    w=map(y, 0, height, 0, 100);
    angle++;
  }

  boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    // Display the circle
    fill(255, life);
    //stroke(0,life);
    ellipse(x, y, w, w);
  }
}  

//yolk class
class Yolk {
  int pSpeed, Xp, Yp;
  float Wp, Hp;
  Yolk() {
    pSpeed=5;
    Xp=width/2;
    Yp=height/2;
    Wp=25;
    Hp=25;
  }

  void drive() {
    if (keyPressed) {
      if (key ==CODED) {
        if (keyCode==UP) {
          Yp-=pSpeed;
          Hp=map(Yp, 0, height, 0, 100);
          Wp=map(Yp, 0, height, 0, 100);
        } else if (keyCode==DOWN) {
          Yp+=pSpeed;
          Hp=map(Yp, 0, height, 0, 100);
          Wp=map(Yp, 0, height, 0, 100);
        } else if (keyCode==LEFT) {
          Xp-=pSpeed;
        } else if (keyCode==RIGHT) {
          Xp+=pSpeed;
        }
      }
    }
    if (Xp<0) {
      Xp=width;
    } else if (Xp>width) {
      Xp=0;
    } else if (Yp<0) {
      Yp=height;
    } else if (Yp>height) {
      Yp=0;
    }
    fill(255, 204, 0);
    ellipse(Xp, Yp, Wp, Hp);
  }
  public float getXp() {
    return Xp;
  }
  public float getYp() {
    return Yp;
  }
  public float getWp() {
    return Wp;
  }
}
