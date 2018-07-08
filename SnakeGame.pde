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
  
  if (millis() >= (deltaTime + updateFrequency)) {
    deltaTime = millis();
    snake.move();
    madeMove = false;
  }
  
  snake.display();
}

void keyPressed() {
  if (!madeMove) {
    madeMove = controller.changeDirection();
  }
}
