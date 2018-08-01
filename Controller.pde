class Controller {
  Snake snake; // the snake to control
  boolean canMove = true;
  
  Controller(Snake s) {
    snake = s; // reference snake to be controlled
  }
  
  void up() {
    if (snake.xSpeed != 0) {
      snake.xSpeed = 0;
      snake.ySpeed = -1;
      
      canMove = false;
    }
  }
  
  void down() {
    if (snake.xSpeed != 0) {
      snake.xSpeed = 0;
      snake.ySpeed = 1;
      
      canMove = false;
    }
  }
  
  void right() {
    if (snake.ySpeed != 0) {
      snake.xSpeed = 1;
      snake.ySpeed = 0;
      
      canMove = false;
    }
  }
  
  void left() {
    if (snake.ySpeed != 0) {
      snake.xSpeed = -1;
      snake.ySpeed = 0;
      
      canMove = false;
    }
  }
  
  void changeDirection() {
    /* if one of the moves has been made true
    is returned so no more moves can be
    made during that interval */
    if (canMove) {
      if (keyCode == UP) {
        up();
      } else if (keyCode == DOWN) {
        down();
      } else if (keyCode == RIGHT) {
        right();
      } else if (keyCode == LEFT) {
        left();
      }
    }
  }
  
  void moveMade() {
    canMove = true;
  }
}
