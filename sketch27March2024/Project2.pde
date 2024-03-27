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

Info info;

void setup() {
 
  size(1630, 820);
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

   originCounter++;
    }
   if(newFlight.DEST_CITY_NAME.equals(Origin_City_Name))
    {
    flights.add(newFlight);
   // println(newFlight.ORIGIN_CITY_NAME);
   destCounter++;
    }
       // println(newFlight.ORIGIN_CITY_NAME);
    
//for (int i = 0; i < 100; i++) {
//    Flight newFlight = new Flight(table.getRow(i));
//    if(newFlight.DEST_CITY_NAME.equals(Origin_City_Name))
//    {
//    flights.add(newFlight);
//   // println(newFlight.ORIGIN_CITY_NAME);
//   destCounter++;
//    }
  
  }
   textSize(10);
   frameRate(30);

  //test = new Airports();
  //println("destination counter" + destCounter);
  //println("origin counter" + originCounter);
  
  info = new Info();
  //info.getTotalFlights();
  
  info.getLongestDiversion(); // GETS LONGEST DIVERSION IN THE WHOLE FILE, NOT IN A SPECIFIC AIRPORT
}

void mousePressed()  {
 
  println("Clicked at (" + mouseX + ", " + mouseY + ")");
 //if (mouseX >= AUSx - CIRCLE_RAD && mouseX <= AUSx + CIRCLE_RAD &&
 //     mouseY >= AUSy - CIRCLE_RAD && mouseY <= AUSy + CIRCLE_RAD) {
 //   Origin_City_Name = "Dallas, TX";
 //  for (int i = 0; i < flights.size(); i++) {
 //   Flight flight = flights.get(i); // iterates through the array list flights 
 //     if (flight.ORIGIN_CITY_NAME.equals("Austin, TX")) {
 //       displayFlightInfo(flight);
 //     }
 //  }
      
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

//  void displayFlightInfo(Flight flight) {
 
//  String info = "Flight Carrier: " + flight.MKT_CARRIER + "\n" +
//                "Flight Number: " + flight.MKT_CARRIER_FL_NUM + "\n" +
//                "Origin: " + flight.ORIGIN + "\n" +
//                "Destination: " + flight.DEST + "\n" +
//                "Departure Time: " + flight.CRS_DEP_TIME + "\n" +
//                "Arrival Time: " + flight.CRS_ARR_TIME + "\n" +
//                "Cancelled: " + flight.CANCELLED + "\n" +
//                "Diverted: " + flight.DIVERTED + "\n" +
//                "Distance: " + flight.DISTANCE;
//                println();
//                println();
                
  
 
//  println(info);
//}
void draw() {

 background (0, 125, 255);
  
  image(border, 120, 80);
  shape(map, 195, 130);
  image(logo, -70, -70);
  image(home, -70, 60);
  
  //test.drawAirports();
  showData();

}

void showData() {
  
  if ((mouseX >= DALx - CIRCLE_RAD && mouseX <= DALx + CIRCLE_RAD &&
       mouseY >= DALy - CIRCLE_RAD && mouseY <= DALy + CIRCLE_RAD) && mousePressed) {
         showData = true;
  }
  
  if (showData) {
  text("Pink = number of origin flights. Blue = number of destination flights", 1100, 100);
  // first bar
  fill(255, 0, 255);
  rect(1100, 220, 20, -originCounter * 10);
  // second bar
  fill(0, 255, 255);
  rect(1130, 220, 20, -destCounter * 10);
  }
  
  fill(0,0,0); // Y-Axis
  rect(1090, 80, 5, 160);

  fill(0,0,0); // X-Axis
  rect(1075, 220, 100, 5);
} //<>// //<>//
