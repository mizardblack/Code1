ArrayList<Cell> c=new ArrayList<Cell>();

int t = 1;
void setup() {
  size (400, 400);
  background(0);
}

void draw() {
  background(0);
  fill(255);
  for (int i=0; i<c.size(); i++) {
    c.get(i).draw();
  }
  fill(255);
  text("click your mouse to reprodcue the cells", 0, height/2);
}
void mouseClicked() {
  //clean the previous circles
  //background(0);
  if (c.size()>0) {
    for (int i=1; i<c.size(); i++) {

      if (c.get(i).isClickInside()) {
        //get x,y,d. and add cells
        c.remove(i);
        float d=c.get(i).getD()/2;
        float x=c.get(i).getX();
        float y=c.get(i).getY();
        c.add(new Cell(d, x, y));
        println("x=", c.get(i).getX(), "y=", c.get(i).getY(), "d=", c.get(i).getD());
        
      }
    }
  } else {
    //add first cell
    c.add(new Cell(width, width, height));
  }
  //float d = (float)height / t; //diameter of the circlestypetype

  //draw the circles

  //for (int j=1; j<2*t; j+=2) {
  //  for (int l=1; l<2*t; l+=2) {
  //    float x = width * j / (2*t);
  //    float y = height * l / (2*t);
  //    println("...drawing circle at pos with diam: ", x, y, d);
  //    //circle(x, y, d);
  //    c.add(new Cell(d, x, y));
  //  }
  //}

  //t *= 2; // for next time through
}

class Cell {
  float d, x, y;
  Cell(float _d, float _x, float _y) {
    d=_d;
    x=_x;
    y=_y;
  }
  boolean isClickInside() {
    boolean flag=dist(mouseX, mouseY, x, y)<(0.5*d);
    return flag;
  }

  void draw() {
    fill(0);
    stroke(255);
    strokeWeight(2);
    circle(x-d/2, y-d/2, d);
    circle(x+d/2, y-d/2, d);
    circle(x-d/2, y+d/2, d);
    circle(x+d/2, y+d/2, d);
  }

  float getD() {
    return d;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
}
