ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;
PImage border;
PShape map;
PImage logo;
PImage home;
Airports test;
String Origin_State_Name;
String Origin_City_Name;
int originCounter = 0;
int destCounter = 0;
boolean showData = false;

boolean drawGraph1 = false; //// //// NEW
boolean drawGraph2 = false;
boolean drawGraph3 = false;
boolean drawGraph4 = false;
String[] cities = null; //// //// NEW

Info info;

void setup() {
 
  size(1630, 820);
  table = loadTable("flights2k(1).csv", "header");

  Origin_City_Name = "Dallas, TX"; 
  border = loadImage("border.png");
  map = loadShape("CANADA.svg");
  logo = loadImage("logo.png");
  home = loadImage("home.png");

for (int i = 0; i < 100; i++) {
    Flight newFlight = new Flight(table.getRow(i));
    if(newFlight.ORIGIN_CITY_NAME.equals(Origin_City_Name))
    {
    flights.add(newFlight);

   originCounter++;
    }
   if(newFlight.DEST_CITY_NAME.equals(Origin_City_Name))
    {
    flights.add(newFlight);
   destCounter++;
    }
  
  }
   textSize(10);
   frameRate(30);
  
  String targetOriginCity = "CA";
  
  info = new Info();
  //info.getTotalFlights();
  //info.getLongestDiversion();
  //String lDAirport = info.getLDAirport(targetOriginCity);
  //println(lDAirport);
  
  ArrayList<String> citiesAL = info.cities();
  cities = citiesAL.toArray(new String[citiesAL.size()]);
}

void mousePressed()  {
 
  println("Clicked at (" + mouseX + ", " + mouseY + ")");

  if (mouseX >= DALx - CIRCLE_RAD && mouseX <= DALx + CIRCLE_RAD &&
      mouseY >= DALy - CIRCLE_RAD && mouseY <= DALy + CIRCLE_RAD) {
      Origin_City_Name = "Dallas, TX";
   for (int i = 0; i < flights.size(); i++) {
    Flight flight = flights.get(i); // iterates through the array list flights 
      if (flight.ORIGIN_CITY_NAME.equals("Dallas, TX")) {
        //displayFlightInfo(flight);
      }
    }
  }
}

void draw() {

 background (0, 125, 255);
  
  image(border, 120, 80);
  shape(map, 195, 130);
  image(logo, -70, -70);
  image(home, -70, 60);

  info.drawGraphs(cities);
} //<>//
