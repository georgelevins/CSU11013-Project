class Button {
  int x, y, w, h;
  String buttonText;
  
  Button(int x, int y, int w, int h, String buttonText) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.buttonText = buttonText;
  }
  
  void display() {
    boolean overButton = isOverButton(x, y, w, h, mouseX, mouseY);
    
    if (overButton) {
      fill(200); 
    } else {
      fill(255);
    }
    rect(x, y, w, h);
    
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(28);
    text(buttonText, x + w/2, y + h/2);
  }
  
  boolean isClicked(int mx, int my) {
    return (mx >= x && mx <= x + w && my >= y && my <= y + h);
  }
}

boolean isOverButton(int buttonX, int buttonY, int buttonWidth, int buttonHeight, int mouseX, int mouseY) {
  return (mouseX >= buttonX && mouseX <= buttonX + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight);
}
