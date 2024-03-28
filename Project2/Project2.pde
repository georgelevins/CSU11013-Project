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
boolean[] stateClicked;
int currentScreen = 1;
Info info;
String message = "";
String message2 = "";
int fontsize = 48;

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
  info = new Info();
  border = loadImage("border.png");
  logo = loadImage("logo.png");
  home = loadImage("home.png");
  map = loadImage("CANADA.png");
  statesPage = loadImage("borderForStates.png");

  for (int i = 0; i < 1; i++) {
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
  }
 
 
  
}





void mousePressed()  {  //<>// //<>// //<>//
  if (mouseX >= -70 && mouseX <= -70 + home.width && mouseY >= 60 && mouseY <= 60 + home.height) { //<>//
    for (int i = 0; i < stateClicked.length; i++) {
      stateClicked[i] = false;
    }
  }
     //<>//
    
  for (int i = 0; i < stateClicked.length; i++) //<>//
  {
    if (!stateClicked[i] && dist(mouseX, mouseY, stateX[i], stateY[i]) <= CIRCLE_RAD/2)
    {
      stateClicked[i] = true;
    }
  } 
  }
  
public void keyPressed() {
    if (key == '?') {
      currentScreen = 2;
    }
    else if (key == '/') {
      currentScreen = 1;
  }
  else if (key == '.') {
      currentScreen = 3;
}
    else if (key == '@') {
      currentScreen = 4;
}
else if (key == CODED && keyCode == SHIFT) {
   }
   
else if (key != ENTER && key != BACKSPACE) {
      userInput += key;
} 
else if (key == BACKSPACE && userInput.length() > 0) {
      userInput = userInput.substring(0, userInput.length() - 1); // Remove the last character if Backspace is pressed
    }
else if (key == ENTER){
   if ( currentScreen == 4){
     message = info.getTotalFlights(userInput);
     message2 = info.getLDAirport(userInput);
   }
}
  
 
  }



  
void draw() {

    background(255); 
     if (currentScreen == 1) {
      drawScreen1();
    } else if (currentScreen == 2) {
      drawScreen2();
      
    }
    else if (currentScreen == 3) {
      drawScreen3();
    }
    else if (currentScreen == 4) {
      drawScreen4();
    }
  }
  
  
  
void drawScreen1() {
 background (0, 125, 255);
  
  image(border, 120, 80);
  image(logo, -70, -70);
  image(home, -70, 60);
   image(map, 195, 130);
  
  for (int i = 0; i < stateClicked.length; i++)
  {
    if (stateClicked[i])
    {
       image(statesPage, 174, 106);
       break;
    }
    else if (!stateClicked[i])
    {
      test.drawStates();
    }
  }
}


 void drawScreen2(){
  
  textAlign(CENTER, CENTER);
   textSize(30);
    //String textToShow = info.getLongestDiversion();
    //text(textToShow, width/2, height/2);
}

 void drawScreen3(){
  
  textAlign(CENTER, CENTER);
   textSize(30);
    //String textToShow = info.getLongestDistance();
    //text(textToShow, width/2, height/2);
}

    String userInput = "";
    
    
void drawScreen4(){
    background(255); 

    
    fill(200); 
    rect(10, 30, width - 20, 40);
    fill(0);
    textAlign(LEFT, TOP);
    text(userInput, 20, 30);
    textSize(fontsize);
    while (textWidth(message) >1230) {
        fontsize--; // Decrease font size until text fits within maxWidth
        textSize(fontsize);
      }
    text(message, 10, 410);
    text(message2, 10, 510);
    }


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
//void text_ArrayList(Table table) {

 
    
 //   for (int y = 0; y < flights.size(); y++) {
 //     Flight flight = flights.get(y);
    
 //       flightData ="MKT_CARRIER: " + flight.MKT_CARRIER + ", " +
 //                 "MKT_CARRIER_FL_NUM: " + flight.MKT_CARRIER_FL_NUM + ", " +
 //                 "ORIGIN: " + flight.ORIGIN + ", " +
 //                 "DEST: " + flight.DEST + ", " +
 //                 "CRS_DEP_TIME: " + flight.CRS_DEP_TIME + ", " +
 //                 "CRS_ARR_TIME: " + flight.CRS_ARR_TIME + ", " +
 //                 "CANCELLED: " + flight.CANCELLED + ", " +
 //                 "DIVERTED: " + flight.DIVERTED + ", " +
 //                 "DISTANCE: " + flight.DISTANCE;
      
     
 //     fill(0, 0, 250);
 //     text(flightData, 40, 50 * y);

//  }
