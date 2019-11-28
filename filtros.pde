class filtros implements colores {

  color r, g, b;

  filtros(color r_, color g_, color b_) {

    r=r_;
    g=g_;
    b=b_;
  }

  void display() {
    switch(key) {
    case 'r':
      Red();
      break;

    case 'b':
      Blue();
      break;

    case 'g':
      Green();
      break;


    case 'f':
      Gray();
      break;


    case 'c':
      Cyan();
      break;
    }
  }

  void Red() {
    tint(r, g, b);
  }



  void Blue() {
    tint(r, g, b);
  }

  void Green() {
    tint(r, g, b);
  }

  void Gray() {
    tint(r, g, b);
  }

  void Cyan() {
    tint(r, g, b);
  }
}
