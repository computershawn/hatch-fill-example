// This code sample demonstrates hatch-filling of shapes using @micycle's
// PGS (Processing Geometry Suite) library https://github.com/micycle1/PGS

import micycle.pgs.*;
import processing.svg.*;
import java.util.Date;

int cx, cy;
int wd, ht;
int r = 80;
int FLECKS = 2;
int DIAGONALS = 1;
int NONE = 0;
boolean saving = true;

Side side1, side2, side3;

void setup() {
  size(480, 480);

  wd = width;
  ht = height;
  cx = wd / 2;
  cy = ht / 2;

  PVector [] points1 = new PVector[4];
  PVector [] points2 = new PVector[4];
  PVector [] points3 = new PVector[4];
  PVector [] points = new PVector [6];

  for (int i = 0; i < points.length; i++) {
    float a = TWO_PI * (float) i / points.length;
    points[i] = new PVector(cx + r * cos(a), cy + r * sin(a));
  }

  // 2D Coordinates for each block face
  points1[0] = points[0];
  points1[1] = points[1];
  points1[2] = points[2];
  points1[3] = new PVector(cx, cy);

  points2[0] = points[2];
  points2[1] = points[3];
  points2[2] = points[4];
  points2[3] = new PVector(cx, cy);

  points3[0] = points[4];
  points3[1] = points[5];
  points3[2] = points[0];
  points3[3] = new PVector(cx, cy);

  side1 = new Side(points1, DIAGONALS);
  side2 = new Side(points2, NONE);
  side3 = new Side(points3, FLECKS);

  noLoop();
}

void draw() {
  if (saving) {
    Date d = new Date();
    String ts = Long.toString(d.getTime() / 1000);
    String filename = "output/box-" + ts + ".svg";
    beginRecord(SVG, filename);
  }

  background(0);
  side1.render();
  side2.render();
  side3.render();

  if (saving) {
    saving = false;
    endRecord();
  }
}
