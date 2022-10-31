import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

void setup()
{
  size(800, 640, P3D);
  minim = new Minim(this);
  jingle = minim.loadFile("music.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  colorMode(HSB, 255, 255, 255);
}

void draw()
{
  background(0);

  fft.forward( jingle.mix );

  for (int i = 0; i < fft.specSize(); i++)
  {
    stroke(i/4, 255, 255);
    line(0, height, width/2, 300 - fft.getBand(i)*8);
    line(width, height, width/2, 300 - fft.getBand(i)*8);
  }
}
