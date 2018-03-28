//pressing mouse to add a star.
//pressing any key to remove a star.

ArrayList<Star> Stars;
float space;

void setup() {
  size(700, 700, P3D); 
  Stars = new ArrayList<Star>();
}

void draw() {
  background(255); 
  translate(width/2, height/2, 300);
  rotateZ(space);
  rotateY(-space);
  for (Star s : Stars) {
    s.display();
  }
  space+=0.004;
}

void mousePressed() {
  Stars.add(new Star());
}

void keyPressed() {
  Stars.remove(0);
}