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
flujoPantallas una;
int scl = 2;
ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  size(640, 480);

  cam= new Capture (this, width/scl, height/scl);
  opencv = new OpenCV(this, width/scl, height/scl); 
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  una= new flujoPantallas();
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
  una.display();
}

void captureEvent(Capture c) {
  c.read();
}
void keyPressed() {
  if (key=='a'||key=='A') {
    una.cambioPantalla();
  }
}
