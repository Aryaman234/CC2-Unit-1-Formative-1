import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer sonic;
ball b = new ball();


void setup() {
  size(800, 800);
  background(255);

  minim= new Minim(this);
  sonic=minim.loadFile("sonic.mp3", 800);
  sonic.loop();
}

void draw() {
  background(255);
  textSize(20);
  fill(0);
  text("press space to pause music", 50, 30);
  
 b.bounce();
  for (int i = 0; i < sonic.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, sonic.bufferSize(), 0, width );
    float x2 = map( i+1, 0, sonic.bufferSize(), 0, width );
    line( x1, 100 + sonic.left.get(i)*50, x2, 100 + sonic.left.get(i+1)*50 );
    line( x1, 750 + sonic.right.get(i)*50, x2, 750 + sonic.right.get(i+1)*50 );
  }
if(mousePressed)
{
  
}
}
void keyPressed()
{
  if ( sonic.isPlaying() )
  {
    sonic.pause();
  } else
  {
    sonic.loop();
  }
}
