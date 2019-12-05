PVector pLocation, pSpeed;
float gLocation[];
float gSpeed[];
float scene=1;

void setup() {
  size(400, 400);
  pLocation = new PVector(20, 20);
  pSpeed = new PVector(0, 0);
}

void draw() {
  background(255);
  noFill();
  rect(0, 0, 40, 40);
  rect(width - 40, height - 40, 40, 40);
  fill(0, 0, 0);
  textSize(12);
  text("'>' = Next Scene, '<' = Previous Scene, 'r' = Restart This Scene", 50, 20);
  fill(scene * 25, 0, 0);
  textSize(32);
  text("Scene:" + scene, 20, 80);

  if (pLocation.x>=10 && 
    pLocation.x<=width-10 && 
    pLocation.y>=10 &&
    pLocation.y<=height-10) {
    if (pLocation.x == 10 && pSpeed.x == -1) {
      pSpeed.x++;
    } else if (pLocation.x == width - 10 && pSpeed.x == 1) {
      pSpeed.x--;
    } else if (pLocation.y == 10 && pSpeed.y == -1) {
      pSpeed.y++;
    } else if (pLocation.y == height - 10 && pSpeed.y == 1) {
      pSpeed.y--;
    }
    pLocation.add(pSpeed);
  }
  fill(0, 200, 0);
  for (int i = 0; i < gLocation.length; i++) {
    gLocation[i].add(gSpeed[i]);
    ellipse(gLocation[i].x, gLocation[i].y, 20, 20);
    if ((gLocation[i].x < 10 || 
        gLocation[i].x > width - 10) ||
        (Math.floor(gLocation[i].x) == 50 && 
        gLocation[i].y < 50) ||
        (Math.floor(glocation[i].x) == width - 50 && 
        gLocation[i].y > height - 50)) {
          gSpeed[i].x = gSpeed[i].x * (-1);
    } else if ((gLocation[i].y < 10 || 
                gLocation[i].y > width - 10) ||
                (Math.floor(gLocation[i].y) == 50 && 
                gLocation[i].x < 50) ||
                (Math.floor(gLocation[i].y) == width - 50 && 
                gLocation[i].x > height - 50)) {
          gSpeed[i].y = gSpeed[i].y * (-1);
    }
    if (sq(pLocation.x - gLocation[i].x) + sq(pLocation.y - gLocation[i].y) < 400) {
      pLocation = new PVector(20, 20);
    }
  }
}

void keyTyped(){
  if (key == 'n' && scene != 1) {
    scene--;
  } else if (key == 'm'&& scene <3) {
    scene++;
  }
  if (key == 'n' || key == 'm') {
    gLocation = new float[10];
    gSpeed = new float[10];
    pLocation = new PVector(20, 20);
    for (int n = 0; n < scene * 10; n++) {
      gLocation[n] = new PVector(Math.floor(random(50, width - 50)), Math.floor(random(50, height - 50)));
      gSpeed[n] = new PVector(random(-1, 1), random(-1, 1));
    }
  }
  if (key == 'r') {
    scene = 0;
    gLocation = [];
    gSpeed = [];
    pLocation = createVector(20, 20);
    pSpeed = createVector(0, 0);
  }
}

void keyPressed() {
  if (keyCode === RIGHT_ARROW) {
    pvelocity.x++;
  } else if (keyCode === LEFT_ARROW) {
    pvelocity.x--;
  } else if (keyCode === DOWN_ARROW) {
    pvelocity.y++;
  } else if (keyCode === UP_ARROW) {
    pvelocity.y--;
  }
}
