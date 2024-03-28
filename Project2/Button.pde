class Button{
  Project2 main;
  PImage img;
  float x, y; 
  float width, height; 
  String label;
  boolean hovered;

   Button(Project2 main, PImage img, float x, float y, float width, float height) {
    this.main = main;
    this.img = img;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    img.resize((int)width, (int)height);
  }
  void draw(){
    if (isHovered()) {
      hovered = true;
    } 
    else {
      hovered = false;
    }
    image(img, x, y);
    
  }
  boolean isHovered() {
    return main.mouseX >= x && main.mouseX <= x + width &&
           main.mouseY >= y && main.mouseY <= y + height;
  }

boolean isClicked() {
    return hovered && main.mousePressed;
  }
}
