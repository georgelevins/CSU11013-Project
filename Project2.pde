Flight flight1;
ArrayList<Flight> flights = new ArrayList<Flight>();
int x;
Table table;

void setup() {
  table = loadTable("flights2k(1).csv", "header");
for (int i = 0; i < table.getRowCount(); i++) {
    Flight newFlight = new Flight(table.getRow(i));
    flights.add(newFlight);
    
    
  for (int y = 0; y < flights.size(); y++) {
    Flight flight = flights.get(y);
    println("MKT_CARRIER: " + flight.MKT_CARRIER);
    println("MKT_CARRIER_FL_NUM: " + flight.MKT_CARRIER_FL_NUM);
    println("ORIGIN: " + flight.ORIGIN);
    println("ORIGIN_CITY_NAME: " + flight.ORIGIN_CITY_NAME);
    println("ORIGIN_STATE_ABR: " + flight.ORIGIN_STATE_ABR);
    println("ORIGIN_WAC: " + flight.ORIGIN_WAC);
    println("DEST: " + flight.DEST);
    println("DEST_CITY_NAME: " + flight.DEST_CITY_NAME);
    println("DEST_STATE_ABR: " + flight.DEST_STATE_ABR);
    println("CRS_DEP_TIME: " + flight.CRS_DEP_TIME);
    println("DEP_TIME: " + flight.DEP_TIME);
    println("CRS_ARR_TIME: " + flight.CRS_ARR_TIME);
    println("ARR_TIME: " + flight.ARR_TIME);
    println("CANCELLED: " + flight.CANCELLED);
    println("DIVERTED: " + flight.DIVERTED);
    println("DISTANCE: " + flight.DISTANCE);
  }
  }


}
