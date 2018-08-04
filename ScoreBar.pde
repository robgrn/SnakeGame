class ScoreBar {
  int x;
  int y;
  int w;
  int h;
  int score;
  
  ScoreBar() {
    x = 0;
    y = 0;
    w = width/snake.size;
    h = 2;
    score = 0;
  }
  
  void display() {
    noStroke();
    fill(240);
    rect(x, y, getPosition(w), getPosition(h));
  }
  
  int getPosition(int pos) {
    return pos * snake.size;
  }
}
