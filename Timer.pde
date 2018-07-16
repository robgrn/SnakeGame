class Timer {
  int lastUpdate; // time of previous update
  int interval; // period between each update in milliseconds
  
  Timer(int interval_) {
    lastUpdate = millis();
    interval = interval_;
  }
  
  int getDelta() {
    return millis() - (lastUpdate + interval);
  }
  
  boolean canUpdate() {
    if (getDelta() > interval) {
      lastUpdate = millis();
      return true;
    } else {
      return false;
    }
  }
}
