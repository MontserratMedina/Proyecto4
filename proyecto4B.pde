import gab.opencv.*;
import processing.video.*;
import java.awt.*;
PImage cora;
Capture cam;
OpenCV opencv;
filtros Red;
filtros Green;
filtros Blue;
filtros Gray;
filtros Cyan;


int scl = 2;
ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  size(640, 480);

  cam= new Capture (this, width/scl, height/scl);
  opencv = new OpenCV(this, width/scl, height/scl); 
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);

  Red=new filtros(255, 0, 0);
  Blue=new filtros(0, 0, 255);
  Green=new filtros(0, 255, 0);
  Gray=new filtros(100, 100, 100);
  Cyan=new filtros(255, 0, 255);
  cora = loadImage ("cora.png");
  opencv.threshold(70);
  cam.start();
}
void draw() {
  scale(scl);
  image(cora, width/scl+150, height/scl+150);
  cora.resize(150, 150);
  image(cam, 0, 0);
  ellipse(160, 35, 10, 10);
  textSize(10);
  text("r= rojo ", 10, 50);
  text("g= verde", 10, 60);
  text("b= azul ", 10, 70);
  text("f= gris ", 10, 80);
  text("c= cian ", 10, 90);
  textSize(8);
  text("Trata de ubicar la mitad de tu cabeza en la posicion del punto ", 10, 220);
  text("Presiona 'e' para tomar la foto y mira en tu galeria el resultado", 10, 232);
  if (keyPressed) {
    switch(key) {


    case 'r':
      Red.display();
      break;
    case 'b':
      Blue.display();
      break;
    case 'g':
      Green.display();
      break;
    case 'f':
      Gray.display();
      break;
    case 'c':
      Cyan.display();
      break;

    case 'e':
      if (cam.height != 0) {
        opencv.loadImage(cam);
        image(cam, 0, 0);
        Rectangle[] caras = opencv.detect();
        for (int i = 0; i<caras.length; i++) {
          noFill();
          noStroke();
          rect(caras[i].x, caras[i].y, caras[i].width, caras[i].height);
          opencv.threshold(70);
          image(opencv.getOutput().get(caras[i].x, caras[i].y, caras[i].width, caras[i].height), caras[i].x, caras[i].y);
          image(cora, 85, 15);
          save("imagen.jpg");
        }
      }
      break;
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}
