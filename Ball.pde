class Ball 
{
  float x; float y;
  float dx; float dy;
  
  int playerCount;
  int playerLives;
  int computerCount;
  int computerLives;
  
  int radius;
  color ballColor = color(200, 100, 50);
  
  Ball()
  {
       x = random(SCREENX/4, SCREENX/2);
       y = random(SCREENY/4, SCREENY/2);
       dx = random(1, 2); dy = random(1, 2);
       radius=5;
       
       playerLives =3;
       computerLives =3;
  }
  
  void move()
  {
    x = x+dx; y = y+dy;
  }
  
  float xCalibur ()
  {
    return x;
  }
   
  void draw()
  {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }
  
  void collide(Player tPlayer)
  {
   if(y+radius >= tPlayer.ypos &&
      y-radius<tPlayer.ypos+PADDLEHEIGHT &&
      x >=tPlayer.xpos &&
      x <= tPlayer.xpos+PADDLEWIDTH)
      {
        println("collided!");
        dy=-dy * 2; 
      }
  }
  
  void collide(computerPlayer tPlayer)
  {
   if(y+radius >= tPlayer.computerYPos &&
      y-radius<tPlayer.computerYPos+COMPUTER_PADDLEHEIGHT &&
      x >=tPlayer.computerXPos &&
      x <= tPlayer.computerXPos+COMPUTER_PADDLEWIDTH)
      {
        println("collided!");
        dy=-dy * 1.15; 
      }
  }

  
  void collideWalls()
  {
     if(x-radius <=0)
        dx=-dx;
     else if(x+radius>=SCREENX)
   dx=-dx; 
  }
  
  void reset()
  {
    if (mousePressed)
    {
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = random(1, 2); dy = random(1, 2);
      radius=5;
    }
    
    else if (y-radius <=0) // Top
    {
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = random(1, 2); dy = random(1, 2);
      radius=5;
       
      playerCount++; 
      
      if (playerCount >0) 
      {
        playerLives--;
        
        println("The computer has " + playerLives + " lives");
      }
      
      
    if (playerCount>=3)
    {
      text("Player wins", 100, 100);
      noLoop();
    }
    
    }
    
    else if (y+radius>=SCREENY) // Bottom
    {
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = random(1, 2); dy = random(1, 2);
      radius=5;
      
      computerCount++;
    
      if (computerCount >0) 
      {
        computerLives--;
        
        println("The player has " + computerLives + " lives");
      }
    
    if (computerCount>=3)
    {
      text("Computer wins", 100, 100);
      noLoop();
    }
   }
  
  }
  
  int computerLivesReturner ()
  {
    return computerLives;
  }
  
  void speed()
  {
    text("Moving " + Math.abs(dy) + " pixels per second", 20, 20);
  }
}
