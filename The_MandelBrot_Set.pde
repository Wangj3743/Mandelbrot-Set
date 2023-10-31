float slope1 = 3.0/1000;
float slope2 = -3.0/1000;

void setup() {
  size(1000, 1000);
  noLoop();
  background(255, 255, 255);
  //ComplexNum z = new ComplexNum(6, 2); //represents 6 + 2i
  //ComplexNum w = new ComplexNum(4, 0); //represents 4
}

void draw() {
  for (int x=0; x<1000; ++x) {
    float a = get_a_value(x);
    for (int y=0; y<1000; ++y) {
      // for every sing pixel, decide what color to give it (B/W)
      float b = get_b_value(y);
      
      ComplexNum c = new ComplexNum(a, b);
      ComplexNum z = c;
      int row = 1;
      
      //determine whether complex number a+bi is in the Mandelbrol or not 
      while (z.absoluteValue()<2.0 && row < 200) {
        //update z to z^2 + c
        z = z.sqr();
        z = z.add(c);
        row++;
      }
      if (row == 200) {
        //draw black dot at (x,y) //point()
        fill(0, 0, 0);
        square(x, y, 1);
      }
    }
  }
}

float get_a_value(int xPixel) {
  return slope1*xPixel - 2;
}

float get_b_value(int yPixel) {
  return slope2*yPixel + 1.5;
}
