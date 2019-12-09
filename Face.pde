class Face {
  PVector vector;
  color c;
  int cInt;
  
  Face(PVector vector, color c, int cInt) {
    this.vector = vector;
    this.c = c;
    this.cInt = cInt;
    
    //println(vector.x + " " + vector.y + " " + vector.z + " " + cInt);
  }
  
  void turnX(float angle) {
    PVector v2 = new PVector();
    v2.y = round(vector.y * cos(angle) - vector.z * sin(angle));
    v2.z = round(vector.y * sin(angle) + vector.z * cos(angle));
    v2.x = round(vector.x);
    vector = v2;
  }

  void turnZ(float angle) {
    PVector v2 = new PVector();
    v2.x = round(vector.x * cos(angle) - vector.y * sin(angle));
    v2.y = round(vector.x * sin(angle) + vector.y * cos(angle));
    v2.z = round(vector.z);
    vector = v2;
  }

  void turnY(float angle) {
    PVector v2 = new PVector();
    v2.x = round(vector.x * cos(angle) - vector.z * sin(angle));
    v2.z = round(vector.x * sin(angle) + vector.z * cos(angle));
    v2.y = round(vector.y);
    vector = v2;
  }
  
  void show() {
    pushMatrix();
    fill(c);
    noStroke();
    rectMode(CENTER);
    translate(0.5 * vector.x, 0.5 * vector.y, 0.5 * vector.z);
    if(vector.x != 0) {
      rotateY(HALF_PI);
    } else if(vector.y != 0) {
      rotateX(HALF_PI);
    }
    square(0, 0, 1);
    popMatrix();
  }
  
  
  
  
  
}
