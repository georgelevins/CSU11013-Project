PImage background;
PImage arrowleft;
PImage arrowright;
PFont titleText;
String[] lines;  
//Button[] buttons;
Button[] buttons;
//Button[] buttons = new Button[14];
int airportFocus;
boolean airportPressed = false;
AirportPage AirportIn;
boolean firstTimeDrawing = true;
int pageNumber = 1;
int totalPagesNeeded;



//println("goerge");


//Button[] buttons = new Button[numberOfAirportsInState];


//Button[] buttons = new Button[3];


class StatePage { //<>//
  //boolean firstTimeDrawing = true;

  String state;
  String stateAbbreviation;
  //Button[] buttons = new Button[140];
  
  String[] states = {
    "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", 
    "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", 
    "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
    "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", 
    "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", 
    "West Virginia", "Wisconsin", "Wyoming"
  };

  String[] stateAbbreviations = {
    "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", 
    "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
    "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
    "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", 
    "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"
  };
    

  StatePage(int stateNumber) {
    //buttons = new Button[numberOfAirportsInState];
    //println("number of airports: " + numberOfAirportsInState);
    state = states[stateNumber];
    stateAbbreviation = stateAbbreviations[stateNumber];
    println("state is: " + state);
    background = loadImage("borderForStates.png");
    arrowleft = loadImage("arrowleft.png");
    arrowright = loadImage("arrowright.png");
    
    //arrowleft.resize(100, 100);

    //background = loadImage("data/backgrounds/" + stateAbbreviation + ".png");
    
    
    titleText = createFont("Roboto-Regular.ttf", 70);
    //background(0);
    textFont(titleText);
    lines = loadStrings("flights2k(1).csv");
  
    String[] airports = getAirportsForState(stateAbbreviation);
    int xButtonPos = 200;
    int yButtonPos = 250;
    
    
    //Button[] buttons = new Button[140];
    println("GHEIGHWIEHG " + airports.length);
    buttons = new Button[airports.length];
    
    for (int i = 0; i < airports.length; i++) {
        String airport = airports[i];
        println("Airport " + i + " in " + state + ": " + airport); //<>//
        buttons[i] = new Button(xButtonPos, yButtonPos, 120, 40, airport);
        
        yButtonPos = yButtonPos +100;
        if(i==3 || i==7 || i==11 || i==15 || i==19 || i==23 || i==27 || i==31 || i==35 || i==41 || i==45 || i==49 || i==63 ) {
          xButtonPos = xButtonPos + 200;
          yButtonPos = 250;
         }
         
         if(i==15 || i==31 || i==47 || i==63) {
           
           xButtonPos = 200;
           yButtonPos = 250;
         }
         
    }
    
    totalPagesNeeded = ceil(airports.length/16);
    
    
  } 
  
String[] getAirportsForState(String stateAbr) {
  ArrayList<String> airportsList = new ArrayList<String>();
  
  for (int i = 0; i < table.getRowCount(); i++) {
    String originState = table.getString(i, "ORIGIN_STATE_ABR");
    String destState = table.getString(i, "DEST_STATE_ABR");

    if (originState.equals(stateAbr)) {
      String originAirport = table.getString(i, "ORIGIN");
      if (!airportsList.contains(originAirport)) {
        airportsList.add(originAirport);
      }
    }
    if (destState.equals(stateAbr)) {
      String destAirport = table.getString(i, "DEST");
      if (!airportsList.contains(destAirport)) {
        airportsList.add(destAirport);
      }
    }
  }
  
  String[] airportsArray = new String[airportsList.size()];
  airportsList.toArray(airportsArray);
  
  return airportsArray;
}



boolean isOverButton(int buttonX, int buttonY, int buttonWidth, int buttonHeight, int mouseX, int mouseY) {
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
    return true;
  } else {
    return false;
  }
}

  void mouseClicked() {
    //int xPos = mouseX;
    //int yPos = mouseY;
    //print(mouseX + " " + mouseY);
  // Check if the button is clicked
    for (int i = 0; i < buttons.length; i++) {
      if (buttons[i].isClicked(mouseX, mouseY)) {
        if (mousePressed) {
          println("clicked");
          // = i;
          

          AirportIn = new AirportPage(buttons[i].buttonText);
          airportPressed = true;
          delay(500);
        }
      }
    }
}
    
  void draw() {
    if(totalPagesNeeded>1) {
      if(pageNumber==1) {
        image(arrowleft, 200, 130);
      }
      if (pageNumber>1 && pageNumber<totalPagesNeeded) {
        image(arrowright, 950, 130);
      }
    } 

    image(background, 174, 106);

    //mouseClicked();
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].display();
    }
    if(firstTimeDrawing) delay(1000);
    
    mouseClicked();
    if(airportPressed) {
      AirportIn.draw();
      //airportFocus = null;
    } else {
    mouseClicked();
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].display();
    }
      textFont(titleText);
      fill(255, 255, 255);
      textAlign(CENTER, CENTER);
      //text(state, 340, 160); 
      text(state, 174+(882)/2-20, 160);
      
    }
    
    //image(background, 174, 106);
    firstTimeDrawing = false;
  }
}
