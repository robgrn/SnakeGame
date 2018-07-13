class Food {
  int x;
  int y;
  
  Food() {
    x = (int) random(0, 15) * snake.size;
    y = (int) random(0, 15) * snake.size;
  }
  
  void display() {
    noStroke();
    fill(255, 0, 255);
    rectMode(CORNER);
    rect(x, y, snake.size, snake.size);
  }
  
  boolean collision() {
    if ((snake.snakeBlocks[0][0] == x) && (snake.snakeBlocks[0][1] == y)) {
      return true;
    }
    
    return false;
  }
}
