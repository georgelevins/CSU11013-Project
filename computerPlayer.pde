class computerPlayer 
{
  float computerXPos; float computerYPos;
  
  float computerSpeed = 1;
  
  float computerAccelerator;
  
  color paddlecolor = color(50);
  color computerPaddleColour = color(0);

  computerPlayer(int screen_y)
  {
    computerXPos=SCREENX/2;
    computerYPos=0;
  }
  
  void move(float x, int k)
  {
    // 3 lives to start, how to change the speed
    
    if (k == 3) computerAccelerator = 1.5;
    else if (k == 2) computerAccelerator = 3;
    else if (k == 1) computerAccelerator = 6;
    
    if (computerXPos <= x) 
    {
     computerXPos = computerXPos + computerSpeed * computerAccelerator;
    }
    
    if (computerXPos >= x) 
    {
     computerXPos = computerXPos - computerSpeed * computerAccelerator;
    }
  }
  
  void draw() 
  {
    fill(computerPaddleColour);
    rect(computerXPos, computerYPos, COMPUTER_PADDLEWIDTH, COMPUTER_PADDLEHEIGHT); 
  }

}
