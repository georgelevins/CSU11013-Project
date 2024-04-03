PImage background2;
PFont titleText2; 
String airportAbbreviation;

class AirportPage {
  
  AirportPage (String airportAbr) {
    background2 = loadImage("borderForStates.png");
    titleText2 = createFont("Roboto-Regular.ttf", 70);
    textFont(titleText2);
    airportAbbreviation = airportAbr;
  } 

  void draw() {  
    image(background, 174, 106);
    textFont(titleText);
    fill(255, 255, 255);
    //textAlign(CENTER, CENTER);
    text(airportAbbreviation, 340, 160); 
  }
}
