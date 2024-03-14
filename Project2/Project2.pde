Flight flight1;
ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;

void setup() {
  
  size(1080, 720);
  
  table = loadTable("flights2k(1).csv", "header");

  text_ArrayList(table);
  exit();
}

void draw() {
  background (0);
  
  frameRate(1);
}

void text_ArrayList(Table table) {

  for (int i = 0; i < 20; i++) {
    Flight newFlight = new Flight(table.getRow(i));
    flights.add(newFlight);
    
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
      
      textSize(16);
      fill(0, 0, 255);
      text(flightData, 40, 50 * y);
    }
  }
}
