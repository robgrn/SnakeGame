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
    fill(80);
    rect(x, y, getPosition(w), getPosition(h));
    
    fill(255);
    textAlign(LEFT, TOP);
    text(score, 10, 10);
  }
  
  int getPosition(int pos) {
    return pos * snake.size;
  }
}
