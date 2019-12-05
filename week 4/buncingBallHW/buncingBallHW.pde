Ball b1;

void setup() {
  size(800, 600);
  //size(360, 675);
  b1 = new Ball();
  b1.resetBall();
  b1.resetGameTimer();
}

void draw() {
  background(255);
  if (millis() >b1.targetTime) {
    b1.resetBall();
  }
  drawYou();
  b1.updateBall();
  b1.drawBalls();
  b1.drawUI();
}

void drawYou() {
  fill(255, 0, 0);
  text("YOU", width/2, height-10);

  rectMode(CENTER);
  rect(mouseX, mouseY, 30, 15);
  ellipse(mouseX-30, mouseY, 50, 40);
}

class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float radiusStart;
  float radius = 50;

  float targetTime;
  float timeToReset = 3000;

  float endGameTime;
  float timeToEndGame = 10000;

  int score = 10;

  Ball() {
    x = width/2;
    y = height/2;
    xSpeed = random(-2, 2);
    ySpeed = random(-20, 20);
  }

  void drawBalls() {
    fill(255, 0, 0);
    ellipse(x, y, radius * 2, radius * 2);
  }

  void updateBall() {
    //the closer, the ball is bigger
    radius=map(y, 0, height, 0, 70);

    if (x > width - radius|| x < radius) {
      xSpeed *= -1;
    }
    if ((mouseX-55>x || x>mouseX+15) && y == mouseY-radius-30 ) { //didn't hit the ball
      
    } else if (mouseX-55<x && x<mouseX+15 && y==mouseY-radius-30) { //hit the ball
    }

    x += xSpeed;
    y += ySpeed;
  }

  void resetBall() {
    radiusStart = random(50, 100);
    x = random(radiusStart, width - radiusStart);
    y = radius;
    xSpeed = random(-2, 2);
    ySpeed = random(-20, 20);
    targetTime = millis() + timeToReset;
  }


  void drawUI() {
    textSize(32);
    fill(0);

    text("Push the ball to prevent yourself from being hit!", 50, 50);
    text("score 10 points in 10 seconds!", 50, 100);
    text("score: " + score, 50, 150); 
    text("time: " + ((endGameTime - millis())/1000), 300, 150);

    if (millis() > endGameTime) {
      background(0);
      fill(255);
      if (score<=0) {
        text("You're dead! click to play again", 150, 200);
      } else {
        text("You won! click to play again", 150, 200);
      }
    }
  }

  void shoot() {
    // if ball is pushed, increment the score and reset the target
    if (y<mouseY-30-radius) {
      score--;
      background(0);
      resetBall();
    }

    // if game is over, click to restart
    if (millis() > endGameTime) {
      resetGameTimer();
      resetBall();
      score = 10;
    }
  }
  void resetGameTimer() {
    endGameTime = millis() + timeToEndGame;
  }
}

void mousePressed() {
  b1.shoot();
}
