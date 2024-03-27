class Info {
  
 Info() {
 }
 
  void getTotalFlights() {
  
    String targetOriginAirport = "Los Angeles, CA";
    int totalOriginFlights = totalOriginFlights(targetOriginAirport);
    println("There are " + totalOriginFlights + " flights from " + targetOriginAirport);
    println();
  
    String targetDestAirport = "Los Angeles, CA";
    int totalDestFlights = totalDestFlights(targetDestAirport);
    println("There are " + totalDestFlights + " flights to " + targetDestAirport);
  }

  int totalOriginFlights(String targetOriginAirport) {
  
    int totalFlights = 0;
  
    for (TableRow row : table.matchRows(targetOriginAirport, "ORIGIN_CITY_NAME")) {
      println(row.getString("ORIGIN_CITY_NAME") + " -> " + row.getString("DEST_CITY_NAME"));
      totalFlights++;
    }
  
    return totalFlights;
  }

  int totalDestFlights(String targetDestAirport) {
  
    int totalFlights = 0;
  
    for (TableRow row : table.matchRows(targetDestAirport, "DEST_CITY_NAME")) {
      println(row.getString("ORIGIN_CITY_NAME") + " -> " + row.getString("DEST_CITY_NAME"));
      totalFlights++;
    }
  
    return totalFlights;
  }
  
    void getLongestDiversion() {
      
      calculateDiversionTimes();
    
    int longestDiversion = 0;
    int newDiversion = 0;
    
    TableRow row;
    
    for (int i = 0; i < table.getRowCount(); i++) {
      
      row = table.getRow(i);
      
      newDiversion = row.getInt("DIVERSION_TIME");
      
      if (newDiversion > longestDiversion) {
        
        longestDiversion = newDiversion;
      }
    }
  
   println("The longest diversion IN THE WHOLE FILE is " + longestDiversion + "mins");
  }

  void calculateDiversionTimes() {
    
    table.addColumn("DIVERSION_TIME");
    
    int expectedDepTime = 0;
    int actualDepTime = 0;

    TableRow row;
    
    for (int i = 0; i < table.getRowCount(); i++) {
      
      int diversionTime = 0;
      int cancelled = 0;
      
      row = table.getRow(i); // Get rows
      
      expectedDepTime = row.getInt("CRS_DEP_TIME"); // Get departure times
      actualDepTime = row.getInt("DEP_TIME");
      cancelled = row.getInt("CANCELLED");
      
      if (actualDepTime <= expectedDepTime || cancelled != 1 ) {
        
        diversionTime = 0;
      } else {
              
        diversionTime = calculateDiversionTime(expectedDepTime, actualDepTime);
      }

      //println(diversionTime);
      
      row.setInt("DIVERSION_TIME", diversionTime);
    }
  }
  
  int calculateDiversionTime(int eDT, int aDT) {

    int differenceMinutes = 0; 
    
    int startTime = eDT;
    int endTime = aDT;
    
    int startMinutes = (startTime / 100) * 60 + (startTime % 100);
    int endMinutes = (endTime / 100) * 60 + (endTime % 100);
    
    if (startMinutes > endMinutes) {
      
      differenceMinutes = (24 * 60 - startMinutes) + endMinutes;
    } else {
      
      differenceMinutes = endMinutes - startMinutes;
    }
    
    return differenceMinutes;
  }
}
