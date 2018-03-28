import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float handx;
float handy;
float handz;


void setup() {
  size(400, 400, P3D);
  frameRate(60);
  //receive from.
  oscP5 = new OscP5(this, 7110);
  //send to.
  myRemoteLocation = new NetAddress("127.0.0.1", 9000);
}


void draw() {
  //draw point.
  background(0);
  translate(0, 0, -400);
  stroke(map(handz, -0.5, 0.5, 0, 255));
  strokeWeight(map(handz, -0.5, 0.5, 1, 20));
  point(map(handx, 0, 1, 0, width), map(handy, 0, 1, 0, height), map(handz, -0.5, 0.5, -200, 200));

  //send osc to location every frame.
  OscMessage HandX = new OscMessage("/handx");
   OscMessage HandY = new OscMessage("/handy");
    OscMessage HandZ = new OscMessage("/handz");
  /* add a float to the osc message */
  HandX.add(handx); 
  HandY.add(handy); 
  HandZ.add(handz); 
  /* send the message */
  oscP5.send(HandX, myRemoteLocation);
  oscP5.send(HandY, myRemoteLocation);
  oscP5.send(HandZ, myRemoteLocation);
}

//recieve and parse
void oscEvent(OscMessage m) {
  /* check if theOscMessage has the address pattern we are looking for. */
  if (m.checkAddrPattern("/hand0")==true) {
    /* check if the typetag is the right one. */
    if (m.checkTypetag("siifff")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      handx=m.get(3).floatValue();
      handy=m.get(4).floatValue();
      handz=m.get(5).floatValue();
    }
  }
}