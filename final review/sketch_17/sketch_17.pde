/*
  try to reproduce the 'twinkling stars' effect in the gif.
 you should use the Star class in order to do this.
 think of the starry sky as a group of star objects that 
 change color over time.
 
 if you can't reproduce it exactly, come as close as you can.
 */

ArrayList<Star> s = new ArrayList<Star>();

void setup() {
  size(600, 600);
  for (int i=0; i<300; i++) {
    s.add(new Star());
  }
}

void draw() {
  background(0);
  for (Star s : s) {
    s.display();
    s.update();
  }
}

class Star {
  float x, y;
  float lightness, difference;

  Star() {
    x=random(0, width);
    y=random(0, height);
    lightness=random(0, 255);
    difference=5;
  }
  void display() {
    fill(lightness);
    println(lightness);
    noStroke();
    ellipse(x, y, 2, 2);
  }
  void update() {
    if (lightness>=254||lightness<=2) {
      difference*=-1;
    }
    lightness+=difference;
  }
}
