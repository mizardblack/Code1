/*
this sketch draws an ellipse that has a 25% chance of 
 moving up, left, down or right.
 
 use arrays to create a group of these 'random walkers'
 instead of only displaying one. replace the position 
 variables with arrays and loop to give them values, 
 increment their positions, and draw their corresponding 
 ellipses.
 */

int dim=3;
float[] x=new float[dim];
float[] y=new float[dim];


void setup() {
  background(0);
  size(600, 600);
  for (int i=0; i<dim; i++) {

    x[i]= width/2;
    y[i]= width/2;
  }
  frameRate(15);
}

void draw() {
  //background(255);
  for (int i=0; i<dim; i++) {


    float r = random(4);
    fill(0);
    stroke(255);
    ellipse(x[i], y[i], 20, 20);

    if (int(r) == 0) {
      x[i] += 5;
    } else if (int(r) == 1) {
      x[i] -= 5;
    } else if (int(r) == 2) {
      y[i] += 5;
    } else if (int(r) == 3) {
      y[i] -= 5;
    }
  }
}
