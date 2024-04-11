//Created by George Levins
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
int buttonsLeftToRender;

//import processing.video.*;
//Movie transition;




//println("goerge");


//Button[] buttons = new Button[numberOfAirportsInState];


//Button[] buttons = new Button[3];


class StatePage { //<>// //<>//
  //Movie myMovie;
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
    //myMovie = movie;
    
    //myMovie.loop();
    //myMovie.play();
    //transition = new Movie(this, "swap.mp4");
    
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
    
    buttonsLeftToRender = airports.length + 1;
    
    for (int i = 0; i < airports.length; i++) {
        String airport = airports[i];
        println("Airport " + i + " in " + state + ": " + airport); //<>// //<>//
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
    
    totalPagesNeeded = ceil(float(airports.length)/16);
    println("total pages needed " + totalPagesNeeded);
    
    
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
    
    if(!firstTimeDrawing) {
    for (int i = 0; i < buttons.length; i++) {
      if (buttons[i].isClicked(mouseX, mouseY)) {
        if (mousePressed) {
          println("clicked");
          // = i;
          

          AirportIn = new AirportPage(buttons[i].buttonText);
          airportPressed = true;
          //delay(500);
        }
      }
    }
    }
    //right arrow
    if (mouseX >= 950 && mouseX <= 950 + 38 && mouseY >= 130 && mouseY <= 130 + 66 && totalPagesNeeded>1 && mousePressed) {
      println("right arrow clicked");
      delay(1000);
      if(pageNumber<totalPagesNeeded) {
        pageNumber++;
      }
    }
    
    ////left arrow
    //if (mouseX >= 200 && mouseX <= 200 + 38 && mouseY >= 130 && mouseY <= 130 + 66 && totalPagesNeeded>1 && mousePressed) {
    //  println("left arrow clicked");
    //  delay(200);
    //  if(1<pageNumber) {
    //    pageNumber--;
    //  }
    //}
    
    
}
  //void movieEvent(Movie m) {
  //  m.read();
  //}


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
    //if(firstTimeDrawing) delay(1000);
    
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
  
  //void draw() {

  //  image(myMovie, 0, 0, width, height);

    
  //  image(background, 174, 106);
    
  //  //if(totalPagesNeeded>1) {
  //  //  //println("show buttons");
  //  //  if(pageNumber==1) {
  //  //    //image(arrowleft, 200, 130);
  //  //    image(arrowright, 950, 130);
  //  //  }
  //  //  if (pageNumber>1 && pageNumber<totalPagesNeeded) {
  //  //    image(arrowleft, 200, 130);
  //  //    image(arrowright, 950, 130);
  //  //  }
  //  //} 

  //  //if (pageNumber == 1) {
  //  //    for (int i = 0; i < 15; i++) {
  //  //      //println("button: " + i);
  //  //      buttons[i].display();
  //  //      buttonsLeftToRender = buttonsLeftToRender - 16;
  //  //}
    
  //  //for (int i = 0; i < buttons.length; i++) {
  //  //  buttons[i].display();
  //  //}
  //  //if(firstTimeDrawing) delay(1000);
    
  //  //if (totalPagesNeeded>1) {
  //  //  if (pageNumber == 1) {
  //  //    for (int i = 0; i < 15; i++) {
  //  //      println("button: " + i);
  //  //      buttons[i].display();
  //  //      buttonsLeftToRender = buttonsLeftToRender - 16;
  //  //    }
  //  //  } else if (pageNumber > 1 && pageNumber < (buttons.length + 1)) {
  //  //    for (int i = 0; i < 15; i++) {
          
  //  //      println("button: " + i);
  //  //      buttons[pageNumber * 16 + i].display();
  //  //      buttonsLeftToRender = buttonsLeftToRender - 16;
  //  //    }
  //  //  } else if (pageNumber == totalPagesNeeded) {
  //  //     for (int i = 0; i < buttonsLeftToRender -1; i++) {
  //  //      buttons[pageNumber * 16 + i].display();
  //  //    }
  //  //  }
  //  //}

  //  //mouseClicked();
  //  for (int i = 0; i < buttons.length; i++) {
  //    buttons[i].display();
  //  }
  //  //if(firstTimeDrawing) delay(1000);
    
  //  mouseClicked();
  //  if(airportPressed) {
  //    AirportIn.draw();
  //    //airportFocus = null;
  //  } else {
  //  mouseClicked();
  //  for (int i = 0; i < buttons.length; i++) {
  //    buttons[i].display();
  //  }
  //    textFont(titleText);
  //    fill(255, 255, 255);
  //    textAlign(CENTER, CENTER);
  //    //text(state, 340, 160); 
  //    text(state, 174+(882)/2-20, 160);
      
  //  }
    
  //  //image(background, 174, 106);
  //  firstTimeDrawing = false;
  //}
}
