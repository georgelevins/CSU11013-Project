Flight flight1;
ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;

void setup() {
  
  size(1080, 720);
  
  table = loadTable("flights2k(1).csv", "header");
}

void draw() {
  
  background(255);
  
  print_ArrayList(table); //<>//
}

void print_ArrayList(Table t) {
  
  for (int i = 0; i < t.getRowCount(); i++) {
    Flight newFlight = new Flight(t.getRow(i));
    flights.add(newFlight);
    
    for (int y = 0; y < flights.size(); y++) {
      Flight flight = flights.get(y);
      
      String flightData = "MKT_CARRIER: " + flight.MKT_CARRIER + ", " + //<>//
                      "MKT_CARRIER_FL_NUM: " + flight.MKT_CARRIER_FL_NUM + ", " +
                      "ORIGIN: " + flight.ORIGIN + ", " +
                      "DEST: " + flight.DEST + ", " +
                      "CRS_DEP_TIME: " + flight.CRS_DEP_TIME + ", " +
                      "CRS_ARR_TIME: " + flight.CRS_ARR_TIME + ", " +
                      "CANCELLED: " + flight.CANCELLED + ", " +
                      "DIVERTED: " + flight.DIVERTED + ", " +
                      "DISTANCE: " + flight.DISTANCE;
      
      textSize(12);
      fill(0, 48, 120);
      text(flightData, 40, y * 50);
    }
  }
}
