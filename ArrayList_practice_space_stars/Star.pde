class Star {

  int x=int(random(-100, 100));
  int y=int(random(-100, 100));
  int z=int(random(-100, 100));

  Star() {
  }

  void display() {
    strokeWeight(3);
    point(x, y, z);
  }
}