Snake snake;
Controller controller;
int deltaTime;
int updateFrequency;
boolean madeMove;

void setup() {
  size(200, 200);
  
  snake = new Snake();
  controller = new Controller(snake);
  deltaTime = millis();
  updateFrequency = 500;
  madeMove = false;
}

void draw() {
  background(255);
  
  // only move the snake once per interval
  if (millis() >= (deltaTime + updateFrequency)) {
    deltaTime = millis(); // reset delta time
    snake.move(); // update the snake's position
    madeMove = false; // allow another move to me made during the next interval
  }
  
  // draw the snake
  snake.display();
}

void keyPressed() {
  /* only one move per interval is allowed...
  prevents snake moving back on itself (an invalid move) */
  if (!madeMove) {
    madeMove = controller.changeDirection();
  }
}
