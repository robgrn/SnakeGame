class Controller {
  Snake snake;
  
  Controller(Snake s) {
    snake = s;
  }
  
  boolean up() {
    if (snake.xSpeed != 0) {
      snake.xSpeed = 0;
      snake.ySpeed = -snake.size;
      
      return true;
    }
    
    return false;
  }
  
  boolean down() {
    if (snake.xSpeed != 0) {
      snake.xSpeed = 0;
      snake.ySpeed = snake.size;
      
      return true;
    }
    
    return false;
  }
  
  boolean right() {
    if (snake.ySpeed != 0) {
      snake.xSpeed = snake.size;
      snake.ySpeed = 0;
      
      return true;
    }
    
    return false;
  }
  
  boolean left() {
    if (snake.ySpeed != 0) {
      snake.xSpeed = -snake.size;
      snake.ySpeed = 0;
      
      return true;
    }
    
    return false;
  }
  
  boolean changeDirection() {
    boolean madeMove = false;
    
    if (keyCode == UP) {
      madeMove = up();
    } else if (keyCode == DOWN) {
      madeMove = down();
    } else if (keyCode == RIGHT) {
      madeMove = right();
    } else if (keyCode == LEFT) {
      madeMove = left();
    }
    
    return madeMove;
  }
}
