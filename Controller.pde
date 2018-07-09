class Controller {
  Snake snake; // the snake to control
  
  Controller(Snake s) {
    snake = s; // reference snake to be controlled
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
    
    /* if one of the moves has been made true
    is returned so no more moves can be
    made during that interval */
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
