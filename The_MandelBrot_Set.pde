float aMin = 0.2;  // -2
float aMax = 1;  // 1  
float bMin = 0.2;  // -1.5
float bMax = 1;  // 1.5


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
      
      //determine whether complex number a+bi is in the Mandelbrot or not 
      while (z.absoluteValue()<2.0 && row < 200) {
        //update z to z^2 + c
        z = z.sqr().add(c);
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
  float slope = abs(aMin-aMax)/width;
  return slope*xPixel + aMin;
}

float get_b_value(int yPixel) {
  float slope = -1*abs(bMin-bMax)/height;
  return slope*yPixel + bMax;
}
