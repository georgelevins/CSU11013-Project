class Player 
{
  int xpos; int ypos;
  color paddlecolor = color(50);
  
  float previousMouseX, previousMouseY;
  
  void setup ()
  {
    previousMouseX = mouseX;
    previousMouseY = mouseY;
  }
  color computerPaddleColour = color(255);

  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  
  void move(int x)
  {
    if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH; 
    else xpos=x;
  }
  
  void draw() 
  {
    float changeInX = mouseX - previousMouseX;
    float changeInY = mouseY - previousMouseY;
    
   // float paddleSpeed = dist(mouseX, mouseY, previousMouseX, previousMouseY) / 
    
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT); 
  }

}
