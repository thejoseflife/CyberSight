class Animation {
  float angle = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int dir;
  boolean animating = false;
  boolean finished = false;

  Animation(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }
  
  Animation reverseAnimation() {
    return new Animation(x, y, z, -dir);
    
  }
  
  void start() {
    animating = true;
    finished = false;
    angle = 0;
    moving = true;
  }
  
  boolean finished() {
    return finished;
  }

  void update() {
    if(animating) {
      angle += dir * speed;
      if(abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;
        moving = false;
        if(abs(z) > 0) {
          turnZ(z, dir);
        } else if(abs(x) > 0) {
          turnX(x, dir);
        } else if(abs(y) > 0) {
          turnY(y, dir);
        }
      }
    }
  }
}
