class ComplexNum {
  //fields
  float a, b; // real and imaginary parts
  
  //constructor
  ComplexNum(float rp, float ip) {
    this.a = rp;
    this.b = ip;
  }
  
  //methods
  void printMe() {  // prints something like "6 + 2i"
    println(this.a, " + ", this.b + "i");
  }
  
  float absoluteValue() {
    return sqrt(pow(this.a, 2) + pow(this.b, 2));
  }
  
  ComplexNum add(ComplexNum other) {
    ComplexNum n = new ComplexNum(this.a + other.a, this.b + other.b);
    return n;
  }
  
  ComplexNum sqr() {
    ComplexNum n = new ComplexNum(a*a-b*b, 2*a*b);
    return n;
  }
}
