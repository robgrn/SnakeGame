Snake snake; // the snake controlled by the player
Controller controller; // allows the snake to be controlled
Food food; // random food blocks for the snake to eat
Timer timer; // controls how fast the snake moves
TopBar topBar;
int gameState; // game status - 0: menu screen, 1: game in progress, 2: game over
int score;

void setup() {
  size(300, 300);
  
  snake = new Snake();
  controller = new Controller(snake);
  topBar = new TopBar();
  food = new Food();
  timer = new Timer(75);
  gameState = 1;
  score = 0;
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
      score++;
    }
  }
  
  food.display();
  snake.display();
  topBar.display();
}

void gameOver() {
  snake.display();
  println(score);
}
