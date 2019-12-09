class Side {
  int x, y, z;
  int[][] colors;
  int cInt;
  
  Side(int x, int y, int z, int cInt) {
    this.x = x;
    this.y = y;
    this.z = z;
    colors = new int[dim][dim];
    this.cInt = cInt;
    
    update();
  }
  
  void update() {
    int index = 0;
    int index2 = 0;
    for(Cube c: cubes) {
       if(x != 0 && c.x != 0) {
         if(x > 0 && c.x > 0) {
           for(Face f: c.faces) {
             if(f.vector.x > 0) {
               colors[index2][index] = f.cInt;
               index++;
               if(index == 3) {
                 index = 0;
                 index2++;
               }
             }
           }
         } else if(x < 0 && c.x < 0) {
           for(Face f: c.faces) {
             if(f.vector.x < 0) {
               colors[index2][index] = f.cInt;
               index++;
               if(index == 3) {
                 index = 0;
                 index2++;
               }
             }
           }
         }
       } else if(y != 0 && c.y != 0) {
         if(y > 0 && c.y > 0) {
           for(Face f: c.faces) {
             if(f.vector.y > 0) {
               colors[index2][index] = f.cInt;
               index++;
               if(index == 3) {
                 index = 0;
                 index2++;
               }
             }
           }
         } else if(y < 0 && c.y < 0) {
           for(Face f: c.faces) {
             if(f.vector.y < 0) {
               colors[index2][index] = f.cInt;
               index++;
               if(index == 3) {
                 index = 0;
                 index2++;
               }
             }
           }
         }
       } else if(z != 0 && c.z != 0) {
         if(z > 0 && c.z > 0) {
           for(Face f: c.faces) {
             if(f.vector.z > 0) {
               colors[index2][index] = f.cInt;
               index++;
               if(index == 3) {
                 index = 0;
                 index2++;
               }
             }
           }
         } else if(z < 0 && c.z < 0) {
           for(Face f: c.faces) {
             if(f.vector.z < 0) {
               colors[index2][index] = f.cInt;
               index++;
               if(index == 3) {
                 index = 0;
                 index2++;
               }
             }
           }
         }
       }
    }
    
    //printArray();
  }
  
  void printArray() {
    for(int i = 0; i < dim; i++) {
      for(int j = 0; j < dim; j++) {
        print(colors[i][j] + " ");
      }
      println();
    }
    println();
  }
}
