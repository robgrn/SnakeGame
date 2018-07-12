Snake snake;
Controller controller;
int deltaTime;
int updateFrequency;
boolean madeMove;
int gameState;
PFont font;

void setup() {
  size(300, 300);
  
  snake = new Snake();
  controller = new Controller(snake);
  deltaTime = millis();
  updateFrequency = 150;
  madeMove = false;
  gameState = 1; // 0: menu screen, 1: game in progress, 2: game over
  font = createFont("Helvetica", 36);
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
  if (!madeMove) {
    madeMove = controller.changeDirection();
  }
}

void runGame() {
  // only move the snake once per interval
  if (millis() >= (deltaTime + updateFrequency)) {
    deltaTime = millis(); // reset delta time
    gameState = snake.move(); // update the snake's position
    madeMove = false; // allow another move to me made during the next interval
  }
  
  // draw the snake
  snake.display();
}

void gameOver() {
  snake.display();
  
  textFont(font);
  textAlign(CENTER);
  text("GAME OVER", (width / 2), (height / 2));
  
  stroke(0);
  fill(255);
  rectMode(CENTER);
  rect((width/2), (height/2)+30, 100, 30);
  
  noStroke();
  fill(0);
  textSize(18);
  text("Again?", (width/2), (height/2) + 30 + (18/3));
}
