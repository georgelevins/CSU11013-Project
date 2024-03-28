PImage background;
PFont titleText;
String[] lines;  
//Button[] buttons;
Button[] buttons = new Button[14];


//Button[] buttons = new Button[3];


class StatePage {
  String state;
  String stateAbbreviation;
  Button[] buttons = new Button[140];
  
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
    state = states[stateNumber];
    stateAbbreviation = stateAbbreviations[stateNumber];
    println("state is: " + state);
    //background = loadImage("borderForStates.png");
    background = loadImage("data/backgrounds/" + stateAbbreviation + ".png");
    
    
    titleText = createFont("Roboto-Regular.ttf", 60);
    //background(0);
    textFont(titleText);
    lines = loadStrings("flights2k(1).csv");
  
    String[] airports = getAirportsForState(stateAbbreviation);
    int xButtonPos = 200;
    int yButtonPos = 250;
    
    
    //Button[] buttons = new Button[140];
    println("GHEIGHWIEHG " + airports.length);
    
    for (int i = 0; i < airports.length; i++) {
        String airport = airports[i];
        println("Airport " + i + " in " + state + ": " + airport); //<>//
        buttons[i] = new Button(xButtonPos, yButtonPos, 120, 40, airport);
        
        yButtonPos = yButtonPos +100;
        if(i==3 || i==7 || i==11) {
          xButtonPos = xButtonPos + 200;
          yButtonPos = 250;
         }
    }
    
    //buttons[0] = new Button(200, 250, 120, 40, "Button 1");
    //buttons[1] = new Button(200, 350, 120, 40, "Button 2");
    //buttons[2] = new Button(200, 450, 120, 40, "Button 3");
    //buttons[3] = new Button(200, 550, 120, 40, "Button 4");
    
    //buttons[4] = new Button(400, 250, 120, 40, "Button 5");
    //buttons[5] = new Button(400, 350, 120, 40, "Button 6");
    //buttons[6] = new Button(400, 450, 120, 40, "Button 7");
    //buttons[7] = new Button(400, 550, 120, 40, "Button 8");
    
    //buttons[8] = new Button(600, 250, 120, 40, "Button 1");
    //buttons[9] = new Button(600, 350, 120, 40, "Button 2");
    //buttons[10] = new Button(600, 450, 120, 40, "Button 3");
    //buttons[11] = new Button(600, 550, 120, 40, "Button 4");
    
    //buttons[12] = new Button(800, 250, 120, 40, "Button 5");
    //buttons[13] = new Button(800, 350, 120, 40, "Button 6");
    //buttons[14] = new Button(800, 450, 120, 40, "Button 7");
    //buttons[15] = new Button(800, 550, 120, 40, "Button 8");
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


void createButton(int x, int y, int w, int h, String buttonText) {
  // Check if the mouse is over the button
  boolean overButton = isOverButton(x, y, w, h, mouseX, mouseY);
  
  // Draw the button
  if (overButton) {
    fill(200); // Change color when the mouse is over the button
  } else {
    fill(255);
  }
  rect(x, y, w, h);
  
  // Draw the text on the button
  fill(0);
  textAlign(CENTER, CENTER);
  text(buttonText, x + w/2, y + h/2);
}

boolean isOverButton(int buttonX, int buttonY, int buttonWidth, int buttonHeight, int mouseX, int mouseY) {
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
    return true;
  } else {
    return false;
  }
}

  
  void draw() {  
    image(background, 174, 106);
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].display();
    }
    
    //image(background, 174, 106);
    
    //textFont(titleText);
    //fill(255, 255, 255);
    //textAlign(CENTER, CENTER);
    //text(state, 200, 200); 
  }
}
