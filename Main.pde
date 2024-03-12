Player thePlayer;
computerPlayer theComputerPlayer;
Ball theBall;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  theComputerPlayer = new computerPlayer(SCREENY-MARGIN-PADDLEHEIGHT);
  
  theBall = new Ball();
  ellipseMode(RADIUS);
}

void draw() 
{
  background(255);
  
  theBall.move();
  
  float l = theBall.xCalibur();
  int k = theBall.computerLivesReturner();
  
  theComputerPlayer.move(l, k);
  theComputerPlayer.move(l, k);
  
  thePlayer.move(mouseX);
  
  theBall.collide(thePlayer);
  theBall.collide(theComputerPlayer);
  theBall.collideWalls();
  theBall.reset();
  theBall.speed();
  
  theBall.draw();
  thePlayer.draw();
  theComputerPlayer.draw();
  
  
}
