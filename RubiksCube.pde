import peasy.*;

PeasyCam cam;

float speed = 0.3;
int dim = 3;
Cube[] cubes = new Cube[dim * dim * dim];
Side[] sides = new Side[6];
boolean solving = false;
boolean moving = false;

Animation[] allMoves = new Animation[] {
  new Animation(0, 1, 0, 1), //D
  new Animation(0, 1, 0, -1), //D'
  new Animation(0, -1, 0, 1), //U
  new Animation(0, -1, 0, -1), //U'
  new Animation(1, 0, 0, 1), //R
  new Animation(1, 0, 0, -1), //R'
  new Animation(-1, 0, 0, -1), //L
  new Animation(-1, 0, 0, 1), //L'
  new Animation(0, 0, 1, 1), //F
  new Animation(0, 0, 1, -1), //F'
  new Animation(0, 0, -1, 1), //B
  new Animation(0, 0, -1, -1) //B'
};
Animation currentMove = allMoves[0];

ArrayList<Animation> moveSequence = new ArrayList<Animation>();

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cubes[index] = new Cube(matrix, x, y, z);
        index++;
      }
    }
  }
  
  /*for(Cube c: cubes) {
    for(Face f: c.faces) {
      print(c.x + " " + c.y + " " + c.z);
      println();
      print(f.vector.x + " " + f.vector.y + " " + f.vector.z + " " + f.cInt);
      println();
    }
  }*/
  
  sides[0] = new Side(1, 0, 0, 1);
  sides[1] = new Side(-1, 0, 0, 3);
  sides[2] = new Side(0, 1, 0, 5);
  sides[3] = new Side(0, -1, 0, 0);
  sides[4] = new Side(0, 0, 1, 4);
  sides[5] = new Side(0, 0, -1, 2);
  
}

void draw() {
  background(255); 

  cam.beginHUD();
  if(solving) {
    fill(0);
    textSize(20);
    text("Solving Cube... \n(Not really but it looks cool)", 50, 50);
  }
  cam.endHUD();

  currentMove.update();

  for(Side s: sides) {
    s.update();
  }

  if(solving && !solved()) {
    if(currentMove.finished() && moveSequence.size() > 0) {
      if(moveSequence.size() == 0) return;
      currentMove = moveSequence.get(moveSequence.size() - 1).reverseAnimation();
      currentMove.start();
      moveSequence.remove(moveSequence.size() - 1);
    }
    if(moveSequence.size() == 0) solving = false;
  }

  rotateY(0.4);
  rotateX(-0.5);
  rotateZ(-0.1);

  scale(50);
  for(Cube c: cubes) {
    push();
    if (c.z != 0 && c.z == currentMove.z) {
      rotateZ(currentMove.angle);
    } else if (c.x != 0 && c.x == currentMove.x) {
      rotateX(currentMove.angle);
    } else if (c.y != 0 && c.y == currentMove.y) {
      rotateY(-currentMove.angle);
    }
    c.show();
    pop();
  }
}


boolean solved() {
  for(Side s: sides) {
    for(int i = 0; i < s.colors.length; i++) {
      for(int j = 0; j < s.colors[0].length; j++) {
        if(s.colors[i][j] != s.cInt)
          return false;
      }
    }
  }
  solving = false;
  return true;
}
