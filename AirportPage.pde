PImage background2;
PFont titleText2; 
String airportAbbreviation;
String state;

class AirportPage {
  
  AirportPage (String airportAbr, String place) {
    state = place;
    background2 = loadImage("borderForStates.png");
    titleText2 = createFont("Roboto-Regular.ttf", 70);
    textFont(titleText2);
    airportAbbreviation = airportAbr;
  } 

  void draw() {  
    image(background, 174, 106);
    textFont(titleText);
    fill(255, 255, 255);
    textAlign(TOP, LEFT);
    text(airportAbbreviation, 340, 160);
    textSize(fontsize);
    fontsize = 20;
    textSize(fontsize);

    text(airportInfo.getTotalFlights(airportAbbreviation), 180, 410);
    text(airportInfo.getLDAirport(airportAbbreviation), 180, 510);
    text(airportInfo.getLongestDistanceAsOrigin(airportAbbreviation), 180, 610);
    text(airportInfo.getLongestDistanceAsDestination(airportAbbreviation), 180, 680);
  }
}
