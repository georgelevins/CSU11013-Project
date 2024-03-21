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


void setup() {
  
  
  size(1230, 820);
  table = loadTable("flights2k(1).csv", "header");

  Origin_City_Name = "Dallas, TX"; // EG; FRONT END MAKE Origin_City_Name CHANGE TO 
                            // Dallas, TX WHEN Dallas is clicked
  
  
  border = loadImage("border.png");
  map = loadShape("CANADA.svg");
  logo = loadImage("logo.png");
  home = loadImage("home.png");

for (int i = 0; i < 100; i++) {
    Flight newFlight = new Flight(table.getRow(i));
    if(newFlight.ORIGIN_CITY_NAME.equals(Origin_City_Name))
    {
    flights.add(newFlight);
   // println(newFlight.ORIGIN_CITY_NAME);
    }
  
  }
   textSize(10);
   frameRate(30);

  test = new Airports();
}

void mousePressed()  {
 
  
 
  
  
  
  println("Clicked at (" + mouseX + ", " + mouseY + ")");
 
  
  if (mouseX >= DALx - CIRCLE_RAD && mouseX <= DALx + CIRCLE_RAD &&
      mouseY >= DALy - CIRCLE_RAD && mouseY <= DALy + CIRCLE_RAD) {

   for (int i = 0; i < flights.size(); i++) {
    Flight flight = flights.get(i);
      if (flight.ORIGIN_CITY_NAME.equals("Dallas, TX")) {
        displayFlightInfo(flight);
      }
    }
  }
}

  void displayFlightInfo(Flight flight) {
 
  String info = "Flight Carrier: " + flight.MKT_CARRIER + "\n" +
                "Flight Number: " + flight.MKT_CARRIER_FL_NUM + "\n" +
                "Origin: " + flight.ORIGIN + "\n" +
                "Destination: " + flight.DEST + "\n" +
                "Departure Time: " + flight.CRS_DEP_TIME + "\n" +
                "Arrival Time: " + flight.CRS_ARR_TIME + "\n" +
                "Cancelled: " + flight.CANCELLED + "\n" +
                "Diverted: " + flight.DIVERTED + "\n" +
                "Distance: " + flight.DISTANCE;
                println();
                println();
                
  
 
  println(info);
}
void draw() {

 background (0, 125, 255);
  
  image(border, 120, 80);
  shape(map, 195, 130);
  image(logo, -70, -70);
  image(home, -70, 60);
  
  test.drawAirports();

}
