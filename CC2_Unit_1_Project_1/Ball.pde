class ball
{
  int ballCount=38;

  float[] ballX = new float[ballCount];
  float[] ballY = new float[ballCount];
  float[] xSpeed = new float[ballCount];
  float[] ySpeed = new float[ballCount];
  float[] size = new float[ballCount];
  float[] r = new float[ballCount];
  float[] g = new float[ballCount];
  float[] b = new float[ballCount];
  ball()
  {

    for (int i = 0; i < ballCount; i++) {
      ballX[i] = random(width);
      ballY[i] = random(100, 750);
      size[i] =random(10, 40);
      //can't choose a color combo. Their all to great. 
      //I suggest seeing them all
      r[i]=random(255);
      b[i]=random(255);
      g[i]=random(255);
      xSpeed[i] = random(-5, 10);
      ySpeed[i] = random(-5, 10);
    }
  }

  void bounce()
  {
    for (int i = 0; i < ballCount; i++) {

      ballX[i] += xSpeed[i];
      if (ballX[i] < 0 || ballX[i] > width) {
        xSpeed[i] *= -1;
      }

      ballY[i] += ySpeed[i];
      if (ballY[i] < 100 || ballY[i] > 750) {
        ySpeed[i] *= -1;
      }
      fill(r[i], 0, 0);
      ellipse(ballX[i], ballY[i], size[i], size[i]);
    }
  }

  void bounce2()
  {
    for (int i = 0; i < ballCount; i++) {

      ballX[i] += xSpeed[i];
      if (ballX[i] < 0 || ballX[i] > width) {
        xSpeed[i] *= -1;
      }

      ballY[i] += ySpeed[i];
      if (ballY[i] < 0 || ballY[i] > height) {
        ySpeed[i] *= -1;
      }
      fill(r[i], 0, 0);
      ellipse(ballX[i], ballY[i], size[i], size[i]);
    }
  }

  void center()
  {

    for (int i = 0; i < ballCount; i++) {
      fill(r[i], 0, 0);
      ellipse(ballX[i], ballY[i], size[i], size[i]);
      ballX[i]=400;
      ballY[i]=400;
    }
  }
}
