ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;
PImage border;
PImage map;
PImage logo;
PImage home;
PImage currentImage;
PImage barChartIcon;
PImage statesPage;
States test;
StatePage StateIn;
boolean[] stateClicked;
int currentScreen = 1;
Info info;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
AirportInfo airportInfo;
String message = "";
String message2 = "";
int fontsize = 48;
String message3 = "";
String message4 = "";
Slider slider;
Slider slider2;
boolean searchBarMode = false;
boolean showSearchResult = false;
AirportPage AirportIn2;



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
  slider = new Slider(300, 600, 200, 20, 1, 31);
  slider2 = new Slider(720, 600, 200, 20, 1, 31);
  info = new Info();
  airportInfo = new AirportInfo();
  size(1230, 820);
  table = loadTable("flights2k(1).csv", "header");

  border = loadImage("border.png");
  logo = loadImage("logo.png");
  home = loadImage("home.png");
  map = loadImage("CANADA.png");
  barChartIcon = loadImage("barcharticon4.png");
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
  // if search bar is clicked
  if (mousePressed && mouseX >= 160 && mouseX <= 1070 && mouseY >= 30 && mouseY <= 70) {
      //currentScreen = 4;
      searchBarMode = true;
    }
  
  if (mouseX >= -70 && mouseX <= -70 + home.width && mouseY >= 60 && mouseY <= 60 + home.height) { //<>//
    println("home button pressed");
    for (int i = 0; i < stateClicked.length; i++) {
      stateClicked[i] = false;
      statePressed = false;
      airportPressed = false;
      searchBarMode = false;
      showSearchResult = false;
      userInput = "";
    }
  }  //<>//
  
  
  if (statePressed == false) {
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
//    else if (key == '@') {
//      currentScreen = 4;
//}
else if (key == CODED && keyCode == SHIFT) {
   }
   
else if (key != ENTER && key != BACKSPACE) {
      userInput += key;
} 
else if (key == BACKSPACE && userInput.length() > 0) {
      userInput = userInput.substring(0, userInput.length() - 1); // Remove the last character if Backspace is pressed
    }
else if (key == ENTER){
   if ( searchBarMode == true){
     message = info.getTotalFlights(userInput);
     message2 = info.getLDAirport(userInput);
     message3 = info.getLongestDistanceAsOrigin(userInput);
     message4 = info.getLongestDistanceAsDestination(userInput);
     showSearchResult = true;
     
   }
}
//else if (key == BACKSPACE )
//{
//  if (currentScreen == 3)
//  {
//    for (int y = 0; y < flights.size(); y++) {
//      Flight flight = flights.get(y);
    
//        flightData =
//                   "FL_DATE" + flight.FL_DATE +
//                  //"MKT_CARRIER: " + flight.MKT_CARRIER + ", " +
//                  //"MKT_CARRIER_FL_NUM: " + flight.MKT_CARRIER_FL_NUM + ", " +
//                  "ORIGIN: " + flight.ORIGIN + ", " +
//                  "DEST: " + flight.DEST + ", " +
//                  //"CRS_DEP_TIME: " + flight.CRS_DEP_TIME + ", " +
//                  //"CRS_ARR_TIME: " + flight.CRS_ARR_TIME + ", " +
//                  //"CANCELLED: " + flight.CANCELLED + ", " +
//                  "DIVERTED: " + flight.DIVERTED + ", " +
//                  "DISTANCE: " + flight.DISTANCE;
      
     //textSize(25);
     //fill(0,0,250);
     //text(flightData, 210, 615);
     //message5 += flightData;
  //  }
  //}
  
 
  //}

  
 
  }
  
  
  
boolean statePressed = false;

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
    //else if (currentScreen == 4) {
    //  drawScreen4();
    //}
  }

  
void drawScreen1() {
 background (0, 125, 255);
  
  image(border, 120, 80);
  image(logo, -70, -70);
  image(home, -70, 60);
  image(map, 195, 130);
  image(barChartIcon, 20, 300);
  
  

    
  fill(200); 
  rect(160, 30, 910, 40);
  fill(0);
  textAlign(LEFT, TOP);
  textSize(fontsize);
  text(userInput, 165, 30);
  textSize(fontsize);
  
  
    while (textWidth(message) >1230) {
        fontsize--; 
        textSize(fontsize);
      }
  
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
  
  if (showSearchResult == true) {
    String airportAbr = info.getOriginAbr(userInput); //<>//
    AirportIn = new AirportPage(airportAbr);
    AirportIn.draw();
    //image(statesPage, 174, 106);  
    //fill(0, 0, 0);
    //textSize(20);
    //text(message, 190, 210);
    //text(message2, 190, 310);
    //text(message3, 190, 410);
    //text(message4, 190, 510);
  }
}
 void drawScreen2(){
  
  textAlign(CENTER, CENTER);
   textSize(30);
    //String textToShow = info.getLongestDiversion();
    //text(textToShow, width/2, height/2);
}

 void drawScreen3(){
    fill(200); 
    rect(10, 30, width - 20, 40);
    fill(0);
    textAlign(LEFT, TOP);
    text(userInput, 20, 30);
  textAlign(CENTER, CENTER);
   textSize(30);
   slider.draw();
   slider.update();
   slider2.draw();
   slider2.update();
   textSize(fontsize);
   String input1 = str(round(slider.value));
   int Day1 = Integer.valueOf(input1);
   String date1 = ("01/" + input1 + "/22" + "00:00");
   text(date1, 410, 410);
   String input2 = str(round(slider2.value));
   int Day2 = Integer.valueOf(input2);
   String date2 = ("01/" + input2 + "/22" + "00:00");
   text(date2, 820, 410);
   if (key == ENTER)
   {
    //  int totalFlights = 0;
  
    //for (TableRow row : table.matchRows(targetOriginAirport, "ORIGIN")) {
    //  println(row.getString("ORIGIN") + " -> " + row.getString("DEST"));
    //  totalFlights++;
    //}
  
    //return totalFlights;
     int counterFROM = 0;
     int counterTO = 0;
       for (int i = 0; i < 1999; i++) {
        Flight newFlight = new Flight(table.getRow(i));
        if(newFlight.ORIGIN.equals(userInput))
        {
        if ( convertDateToDay(newFlight.FL_DATE) >= Day1  &&  convertDateToDay(newFlight.FL_DATE) <= Day2)
        {
        ///print(convertDateToDay(newFlight.FL_DATE));
        ///flights.add(newFlight);
        counterFROM++;
        ///println(newFlight.ORIGIN_CITY_NAME);
        }
        }
        if(newFlight.DEST.equals(userInput))
        {
        if ( convertDateToDay(newFlight.FL_DATE) >= Day1  &&  convertDateToDay(newFlight.FL_DATE) <= Day2)
        {
        ///print(convertDateToDay(newFlight.FL_DATE));
        ///flights.add(newFlight);
        counterTO++;
        ///println(newFlight.ORIGIN_CITY_NAME);
        }
      }
      
       }
   
      //print(counter);
    //   for (int y = 0; y < flights.size(); y++) {
    //  Flight flight = flights.get(y);
    
    //    flightData =
    //               "FL_DATE" + flight.FL_DATE +
    //              //"MKT_CARRIER: " + flight.MKT_CARRIER + ", " +
    //              //"MKT_CARRIER_FL_NUM: " + flight.MKT_CARRIER_FL_NUM + ", " +
    //              "ORIGIN: " + flight.ORIGIN + ", " +
    //              "DEST: " + flight.DEST + ", " +
    //              //"CRS_DEP_TIME: " + flight.CRS_DEP_TIME + ", " +
    //              //"CRS_ARR_TIME: " + flight.CRS_ARR_TIME + ", " +
    //              //"CANCELLED: " + flight.CANCELLED + ", " +
    //              "DIVERTED: " + flight.DIVERTED + ", " +
    //              "DISTANCE: " + flight.DISTANCE;
      
    // fill(0, 0, 250);
    //  textSize(15);
    //  text(flightData, 615, 50 * y);
    //}
      String dateOut = ("the amount of flights from " + userInput + " between these times is: " + counterFROM);
      textSize(25);
      fill(0, 0, 250);
      text(dateOut, 615, 210);
      String dateOutto = ("the amount of flights to " + userInput + " between these times is: " + counterTO);
      textSize(25);
      fill(0, 0, 250);
      text(dateOutto, 615, 180);
   }
  // for (int i = 0; i < 100; i++) {
  //  Flight newFlight = new Flight(table.getRow(i));
  //  if(newFlight.ORIGIN_CITY_NAME.equals(Origin_City_Name))
  //  {
  //  if ( convertDateToDay(newFlight.FL_DATE) >= Day1 &&  convertDateToDay(newFlight.FL_DATE) <= Day2)
  //  {
  //  ///print(convertDateToDay(newFlight.FL_DATE));
  //  flights.add(newFlight);
  //  ///println(newFlight.ORIGIN_CITY_NAME);
  //  }
  //}
  //}
   
}


    String userInput = "";
    
    
void drawScreen4(){
    background(255); 

    
    fill(200); 
    rect(10, 30, width - 20, 40);
    fill(0);
    textAlign(LEFT, TOP);
    textSize(fontsize);
    text(userInput, 20, 30);
    textSize(fontsize);
    while (textWidth(message) >1230) {
        fontsize--; 
        textSize(fontsize);
      }
    //textColor(
    text(message, 10, 410);
    text(message2, 10, 510);
    text(message3, 10, 610);
    text(message4, 10, 710);
    }
public static int convertDateToDay(String dateString) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
        try {
            Date date = dateFormat.parse(dateString);
            return date.getDate(); // Returns the day of the month
        } catch (ParseException e) {
            e.printStackTrace();
            return -1; // Error occurred
        }
    }

  
  
  
  
