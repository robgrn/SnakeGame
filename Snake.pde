class Snake {
  int[][] snakeBlocks = new int[225][2]; // positions of all blocks of the snake
  int size = 20;                     // each block size of the snake
  int bodyLength = 2;                // current length of the snake
  
  /*
   * xSpeed and ySpeed determine the direction of the snake.
   * Snake can only move in one direction, so either xSpeed or ySpeed
   * will be 0.
   */
  int xSpeed = 1; // positive moves right, negative moves left
  int ySpeed = 0; // positive moves down, negative moves up
  
  Snake() {
    snakeBlocks[0][0] = 1;
    snakeBlocks[0][1] = 0;
    snakeBlocks[1][0] = 0;
    snakeBlocks[1][1] = 0;
  }
  
  /**
   * Moves the snake based on the size of the snake.
   */
  int move() {
    /* work out the x and y position of the next position of the snake's 'head'
    before adding it to the array of snake parts */
    int newX = snakeBlocks[0][0] + xSpeed;
    int newY = snakeBlocks[0][1] + ySpeed;
    
    /* only if the snake is still within the boundaries of the play area should
    the snake be advanced forward in the chosen direction */
    if (inBoundary(newX, newY) && !hasCollided(newX, newY)) {
      for (int i = bodyLength - 1; i > 0; i--) {
        snakeBlocks[i][0] = snakeBlocks[i-1][0];
        snakeBlocks[i][1] = snakeBlocks[i-1][1];
      }
      
      // add the new block to the front of the snake
      snakeBlocks[0][0] += xSpeed;
      snakeBlocks[0][1] += ySpeed;
      
      return 1;
    } else {
      return 2;
    }
  }
  
  /**
   * Grow snake by 1 block.
   */
  void grow() {
    snakeBlocks[bodyLength][0] = snakeBlocks[bodyLength-1][0];
    snakeBlocks[bodyLength][1] = snakeBlocks[bodyLength-1][1];
    bodyLength++;
  }
  
  /**
   * Displays the snake.
   */
  void display() {
    rectMode(CORNER);
    noStroke();
    fill(0);
    
    for (int i = 0; i < bodyLength; i++) {
      rect(getPosition(snakeBlocks[i][0]), getPosition(snakeBlocks[i][1]), size, size);
    }
  }
  
  /**
   * Checks if the snake will still be within the game boundaries.
   */
  boolean inBoundary(int newX, int newY) {
    if ((newX >= 0) && (newX < 15) && (newY >= 0) && (newY < 15)) {
      return true;
    }
    
    return false;
  }
  
  /**
   * Checks if the snake will collide with itself.
   */
  boolean hasCollided(int newX, int newY) {
    for (int i = 1; i < bodyLength; i++) {
      if ((newX == snakeBlocks[i][0]) && (newY == snakeBlocks[i][1])) {
        return true;
      }
    }
    
    return false;
  }
  
  /**
   * Used to convert grid positions to the correct x and y coordinate
   * to draw at.
   */
  int getPosition(int pos) {
    return pos * size;
  }
}
