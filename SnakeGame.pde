Snake snake;
Controller controller;
int deltaTime;
int updateFrequency;
boolean madeMove;
int gameState;

void setup() {
  size(300, 300);
  
  snake = new Snake();
  controller = new Controller(snake);
  deltaTime = millis();
  updateFrequency = 150;
  madeMove = false;
  gameState = 1; // 0: menu screen, 1: game in progress, 2: game over
}

void draw() {
  background(255);
  
  if (gameState == 1) {
    // only move the snake once per interval
    if (millis() >= (deltaTime + updateFrequency)) {
      deltaTime = millis(); // reset delta time
      gameState = snake.move(); // update the snake's position
      madeMove = false; // allow another move to me made during the next interval
    }
    
    // draw the snake
    snake.display();
  } else if (gameState == 2) {
    snake.display();
    text("GAME OVER", 20, 20);
  }
}

void keyPressed() {
  /* only one move per interval is allowed...
  prevents snake moving back on itself (an invalid move) */
  if (!madeMove) {
    madeMove = controller.changeDirection();
  }
}
