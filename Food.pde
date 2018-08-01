class Food {
  int x;
  int y;

  /**
   * Uses a quick and simple way to check if the food is generated
   * on a grid space that is already taken by the snake. Keeps trying
   * until an empty random grid space is found. 
   */
  Food() {
    boolean generateAgain = true;
    
    while (generateAgain) {
      generateAgain = false;
      x = (int) random(0, (width/snake.size));
      y = (int) random(topBar.h, (height/snake.size));
      
      for (int i = 0; i < snake.bodyLength; i++) {
        if ((x == snake.snakeBlocks[i][0]) && (y == snake.snakeBlocks[i][1])) {
          println("Collision");
          generateAgain = true;
          break;
        }
      }
    }
  }
  
  void display() {
    noStroke();
    fill(255, 0, 255);
    rectMode(CORNER);
    rect(getPosition(x), getPosition(y), snake.size, snake.size);
  }
  
  boolean collision() {
    if ((snake.snakeBlocks[0][0] == x) && (snake.snakeBlocks[0][1] == y)) {
      return true;
    }
    
    return false;
  }
  
  int getPosition(int pos) {
    return pos * snake.size;
  }
}
