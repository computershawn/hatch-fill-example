class Side {
  PVector[] coords;  // Coordinates of the shape
  int fillType;  // Fill type of the shape

  Side(PVector[] _coords, int _fillType) {
    coords = _coords;
    fillType = _fillType;
  }

  // Renders the shape with a hatch fill
  void render() {
    PShape s = createShape();
    s.setStroke(255);
    s.beginShape();
    s.noFill();
    for (int j = 0; j < coords.length; j++) {
      s.vertex(coords[j].x, coords[j].y);
    }
    s.endShape(CLOSE);

    if (fillType != 0) {
      PShape fill;
      color co = color(0);

      fill = createShape();

      if (fillType == 1) {
        // Draw diagonals hatching
        fill = hatch1();
        co = color(255, 0, 255);
      }

      if (fillType == 2) {
        // Draw flecks hatching
        fill = hatch2();
        co = color(0, 255, 255);
      }
      
      // Intersect the shape layer and the hatching layer
      PShape f = PGS_ShapeBoolean.intersect(s, fill);

      // Set the color of the new hatching layer
      PGS_Conversion.setAllStrokeColor(f, co, 1);
      shape(f);
    }

    // Draw the outline of the shape
    shape(s);
  }
}
