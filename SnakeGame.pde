Snake snake;
Controller controller;
Food food;
Timer timer;

int deltaTime;
int updateFrequency;
int gameState;

void setup() {
  size(300, 300);
  
  snake = new Snake();
  controller = new Controller(snake);
  timer = new Timer(150);
  
  gameState = 1; // 0: menu screen, 1: game in progress, 2: game over
  food = new Food();
}

void draw() {
  background(255);
  
  if (gameState == 1) {
    runGame();
  } else if (gameState == 2) {
    gameOver();
  }
}

void keyPressed() {
  /* only one move per interval is allowed...
  prevents snake moving back on itself (an invalid move) */
  controller.changeDirection();
}

void runGame() {
  if (timer.canUpdate()) {
    gameState = snake.move(); // update the snake's position
    controller.moveMade();
    
    if (food.collision()) {
      food = new Food();
      snake.grow();
    }
  }
  
  food.display();
  snake.display();
}

void gameOver() {
  snake.display();
}
