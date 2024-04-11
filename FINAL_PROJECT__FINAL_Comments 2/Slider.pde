class Slider {
  //Created by Harry Fitzpatrick
  int x, y; 
  int length, height;
  int handleSize;
  int minValue, maxValue; 
  float value;
  
  // Constructor
  Slider(int x, int y, int length, int height, int minValue, int maxValue) {
    this.x = x;
    this.y = y;
    this.length = length;
    this.height = height;
    this.minValue = minValue;
    this.maxValue = maxValue;
    this.value = minValue;
    this.handleSize = height;
  }
  
//SLider
  void draw() {
    // Draw the slider track
    fill(200);
    rect(x, y, length, height);
    
    float handleX = map(value, minValue, maxValue, x, x + length - handleSize);
    

    fill(100);
    rect(handleX, y, handleSize, height);
  }
  
  void update() {
 float handleX = map(value, minValue, maxValue, x, x + length - handleSize);
  if (mousePressed && mouseX > x && mouseX < handleX + handleSize && mouseY > y && mouseY < y + height) {
    float newValue = map(mouseX, x, x + length - handleSize, minValue, maxValue);
    value = constrain(newValue, minValue, maxValue);
}
}
}
