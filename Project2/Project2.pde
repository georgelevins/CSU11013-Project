ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;
String Origin_State_Name;
String Origin_City_Name;
void setup() {
  
  size(1080, 720);
  table = loadTable("flights2k(1).csv", "header");
  Origin_City_Name = "Dallas, TX"; /// EG; FRONT END MAKE Origin_City_Name CHANGE TO 
                            /// Dallas, TX WHEN Dallas is clicked

  for (int i = 0; i < 100; i++) {
    Flight newFlight = new Flight(table.getRow(i));
    if(newFlight.ORIGIN_CITY_NAME.equals(Origin_City_Name))
    {
    flights.add(newFlight);
    println(newFlight.ORIGIN_CITY_NAME);
    }
  }
    
 
   textSize(10);
   frameRate(30);


}

void draw() {
  background (100, 100, 100);
  
 

//void text_ArrayList(Table table) {

 
    
    for (int y = 0; y < flights.size(); y++) {
      Flight flight = flights.get(y);
    
        flightData ="MKT_CARRIER: " + flight.MKT_CARRIER + ", " +
                  "MKT_CARRIER_FL_NUM: " + flight.MKT_CARRIER_FL_NUM + ", " +
                  "ORIGIN: " + flight.ORIGIN + ", " +
                  "DEST: " + flight.DEST + ", " +
                  "CRS_DEP_TIME: " + flight.CRS_DEP_TIME + ", " +
                  "CRS_ARR_TIME: " + flight.CRS_ARR_TIME + ", " +
                  "CANCELLED: " + flight.CANCELLED + ", " +
                  "DIVERTED: " + flight.DIVERTED + ", " +
                  "DISTANCE: " + flight.DISTANCE;
      
     
      fill(0, 0, 250);
      text(flightData, 40, 50 * y);
    }
  }
