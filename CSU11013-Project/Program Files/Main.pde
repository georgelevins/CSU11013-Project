
ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;
PImage border;
PShape map;
PImage logo;
PImage home;
Airports test;


void setup() {
  
  size(1230, 820);
  table = loadTable("flights2k(1).csv", "header");

  border = loadImage("border.png");
  map = loadShape("CANADA.svg");
  logo = loadImage("logo.png");
  home = loadImage("home.png");

  for (int i = 0; i < 20; i++) {
    Flight newFlight = new Flight(table.getRow(i));
    flights.add(newFlight);
  }
   textSize(10);
   frameRate(30);

  test = new Airports();
}

void mousePressed()  {
  println("Clicked at (" + mouseX + ", " + mouseY + ")");
  }
  
void draw() {
 background (0, 125, 255);
  
  image(border, 120, 80);
  shape(map, 195, 130);
  image(logo, -70, -70);
  image(home, -70, 60);
  
  test.drawAirports();
  
  
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
    }
//  }
