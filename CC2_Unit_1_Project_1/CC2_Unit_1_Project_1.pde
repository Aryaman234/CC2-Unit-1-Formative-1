import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer sonic;
ball b = new ball();
boolean fBounce = false;
PImage center;


void setup() {
  size(800, 800);
  background(255);
  center=loadImage("Center.jpeg");

  minim= new Minim(this);
  sonic=minim.loadFile("sonic.mp3", 800);
  sonic.loop();
}

void draw() {
  background(255);
  textSize(20);
  fill(0);
  text("press space to pause music", 50, 30);
  text("press the icon if you want to center the balls", 50, 70);
  image(center, 700, 0, 100, 100 );

  if (fBounce==false)
  {
    b.bounce();
  }
  if (fBounce==true)
  {
    b.bounce2();
  }



  for (int i = 0; i < sonic.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, sonic.bufferSize(), 0, width );
    float x2 = map( i+1, 0, sonic.bufferSize(), 0, width );
    line( x1, 100 + sonic.left.get(i)*50, x2, 100 + sonic.left.get(i+1)*50 );
    line( x1, 750 + sonic.right.get(i)*50, x2, 750 + sonic.right.get(i+1)*50 );
  }

  if (mousePressed)
  {
    if (mouseX>700&&mouseX<800)
    {
      if (mouseY>0&&mouseY<100)
      {
        b.center();
      }
    }
  }
}
void keyPressed()
{
  if (key==' ')
  {
    if ( sonic.isPlaying() )
    {
      sonic.pause();
      fBounce=true;
    } else
    {
      sonic.loop();
      fBounce=false;
    }
  }
}
