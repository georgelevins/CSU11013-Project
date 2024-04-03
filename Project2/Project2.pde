ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;
PImage border;
PImage map;
PImage logo;
PImage home;
PImage currentImage;
PImage statesPage;
States test;
StatePage StateIn;
boolean[] stateClicked;

 float[] stateX = {
  759, 522, 401, 672, 301, 489, 925, 917, 851, 810, 
  328, 393, 714, 756, 655, 591, 787, 676, 947, 880, 
  943, 771, 644, 719, 672, 464, 575, 348, 929, 905, 
  478, 884, 862, 570, 802, 611, 314, 862, 950, 842, 
  569, 758, 574, 413, 912, 868, 340, 831, 701, 476
};

float[] stateY = {
  462, 605, 419, 431, 357, 350, 270, 326, 533, 458, 
  656, 256, 331, 328, 303, 364, 372, 477, 193, 322, 
  257, 269, 234, 459, 365, 202, 312, 315, 235, 294, 
  428, 257, 395, 206, 320, 416, 234, 297, 279, 428, 
  261, 406, 487, 333, 224, 356, 174, 346, 253, 278
};

void setup() {
  
  size(1230, 820);
  table = loadTable("flights2k(1).csv", "header");

  border = loadImage("border.png");
  logo = loadImage("logo.png");
  home = loadImage("home.png");
  map = loadImage("CANADA.png");
  statesPage = loadImage("borderForStates.png");

  for (int i = 0; i < 20; i++) {
    Flight newFlight = new Flight(table.getRow(i));
    flights.add(newFlight);
  }
   textSize(10);
   frameRate(30);

  test = new States();
  stateClicked = new boolean[50];
  
  
  
  for (int i = 0; i < stateClicked.length; i++)
  {
    stateClicked[i] = false;
    statePressed = false;
  }
 
 
  
}





void mousePressed()  { //<>//
  if (mouseX >= -70 && mouseX <= -70 + home.width && mouseY >= 60 && mouseY <= 60 + home.height) { //<>//
    for (int i = 0; i < stateClicked.length; i++) {
      stateClicked[i] = false;
      statePressed = false;
    }
  }  //<>//
  for (int i = 0; i < stateClicked.length; i++) //<>//
  {
    if (!stateClicked[i] && dist(mouseX, mouseY, stateX[i], stateY[i]) <= CIRCLE_RAD/2)
    {
      stateClicked[i] = true;
     
      //print(i);
      StateIn = new StatePage(i);
      
      
      
    }
  } 
  }
  
  
  
boolean statePressed = false;
  
  
void draw() {
 background (0, 125, 255);
  
  image(border, 120, 80);
  image(logo, -70, -70);
  image(home, -70, 60);
  image(map, 195, 130);
  
  for (int i = 0; i < stateClicked.length; i++)
  {
    if (stateClicked[i])
    {
       //image(statesPage, 174, 106);
       
       StateIn.draw();
       statePressed = true;
       //break;
    }
    else if (!stateClicked[i] && statePressed == false)
    {
      test.drawStates();
    }
  }
}
