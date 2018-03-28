
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer player;
FFT fft;

float spin;

void setup() {

  size(512, 300);

  minim = new Minim(this);
  player = minim.loadFile("goh.wav");
  fft = new FFT( player.bufferSize(), player.sampleRate() );
  player.play();
}


void draw() {
  background(10, 10, 10,100);
  strokeWeight(2);
  stroke(255);
  fft.forward( player.mix );
  for (int i = 0; i < fft.specSize(); i++)
  {
    line(i,height,i,height- fft.getBand(i)*3);
  }
}