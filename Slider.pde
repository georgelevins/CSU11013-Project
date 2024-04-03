class Slider {
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
  
  // Display the slider
  void draw() {
    // Draw the slider track
    fill(200);
    rect(x, y, length, height);
    
    // Calculate the position of the slider handle based on its value
    float handleX = map(value, minValue, maxValue, x, x + length - handleSize);
    
    // Draw the slider handle
    fill(100);
    rect(handleX, y, handleSize, height);
  }
  
  // Update the value of the slider based on mouse interaction
  void update() {
 float handleX = map(value, minValue, maxValue, x, x + length - handleSize);
  if ((mousePressed && mouseX > handleX || mousePressed && mouseX < handleX) && mouseX < handleX + handleSize && mouseY > y && mouseY < y + height) {
    // Calculate the new value of the slider based on mouse position
    float newValue = map(mouseX, x, x + length - handleSize, minValue, maxValue);
    value = constrain(newValue, minValue, maxValue);
}
}
}
