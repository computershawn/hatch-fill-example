// Hatch 1: Parallel diagonal lines
PShape hatch1() {
  PShape patternFill = createShape();
  patternFill.beginShape(LINES);
  patternFill.noFill();
  float angle = PI / 6;
  for (int j = 0; j < 80; j++) {
    float x1 = j * 5;
    float x2 = x1 + ht * tan(angle);
    //line(x1, 0, x2, ht);
    patternFill.vertex(x1, 0);
    patternFill.vertex(x2, ht);
  }
  patternFill.endShape();

  return patternFill;
}

// Hatch 2: Flecks in random locations and orientations
PShape hatch2() {
  PShape patternFill = createShape();
  patternFill.beginShape(LINES);
  patternFill.noFill();
  for (int j = 0; j < 2000; j++) {
    float a = random(TWO_PI);
    float x = 150 + random(wd - 300);
    float y = 150 + random(ht - 300);
    float dx = 1.5 * cos(a);
    float dy = 1.5 * sin(a);
    patternFill.vertex(x + dx, y + dy);
    patternFill.vertex(x - dx, y - dy);
  }
  patternFill.endShape();

  return patternFill;
}
