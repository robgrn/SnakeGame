class Snake {
  int[][] position = new int[50][2]; // positions of all blocks of the snake
  int size = 20;                     // each block size of the snake
  int bodyLength = 3;                // current length of the snake
  
  /*
   * xSpeed and ySpeed determine the direction of the snake.
   * Snake can only move in one direction, so either xSpeed or ySpeed
   * will be 0.
   */
  int xSpeed = size;                // positive moves right, negative moves left
  int ySpeed = 0;                   // positive moves down, negative moves up
  
  Snake() {
    position[0][0] = 40;
    position[0][1] = 0;
    position[1][0] = 20;
    position[1][1] = 0;
    position[2][0] = 0;
    position[2][1] = 0;
  }
  
  /**
   * Moves the snake based on the size of the snake.
   */
  void move() {
    for (int i = bodyLength - 1; i > 0; i--) {
      position[i][0] = position[i-1][0];
      position[i][1] = position[i-1][1];
    }
    
    position[0][0] += xSpeed;
    position[0][1] += ySpeed;
  }
  
  /**
   * Displays the snake.
   */
  void display() {
    noStroke();
    fill(0);
    
    for (int i = 0; i < bodyLength; i++) {
      rect(position[i][0], position[i][1], size, size);
    }
  }
}