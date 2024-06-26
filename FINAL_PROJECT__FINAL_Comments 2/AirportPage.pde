//Created by George Levins and Harry Fitzpatrick 
PImage background2;
PFont titleText2; 
String airportAbbreviation;
//String state;

class AirportPage {
  
  AirportPage (String airportAbr) {
    //state = place;
    background2 = loadImage("borderForStates.png");
    titleText2 = createFont("Roboto-Regular.ttf", 70);
    textFont(titleText2);
    airportAbbreviation = airportAbr;
  } 

  void draw() {  
    image(background2, 174, 106);
    textFont(titleText2);
    fill(255, 255, 255);
    textAlign(TOP, LEFT);
    fill(0, 0, 0);
    text(airportAbbreviation, 180, 160);
    
    textSize(fontsize);
    fontsize = 20;
    textSize(fontsize);

    text(airportInfo.getTotalFlights(airportAbbreviation), 180, 310);
    text(airportInfo.getLDAirport(airportAbbreviation), 180, 410);
    text(airportInfo.getLongestDistanceAsOrigin(airportAbbreviation), 180, 510);
    text(airportInfo.getLongestDistanceAsDestination(airportAbbreviation), 180, 610);
  }
}
