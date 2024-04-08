class AirportInfo {
  int index = 0;
 AirportInfo() {
 }
 
  String getTotalFlights(String airport) {
  
    String targetOriginAirport = airport;
    int totalOriginFlights = totalOriginFlights(targetOriginAirport);
    println("There are " + totalOriginFlights + " flights from " + targetOriginAirport);
    println();
  
    String targetDestAirport = airport;
    int totalDestFlights = totalDestFlights(targetDestAirport);
    return ("There are " + totalOriginFlights + " flights from " + targetOriginAirport + " and " + totalDestFlights + " flights to " + targetDestAirport + " for a total of " + (totalDestFlights + totalOriginFlights) + " flights");
  }

  int totalOriginFlights(String targetOriginAirport) {
  
    int totalFlights = 0;
  
    for (TableRow row : table.matchRows(targetOriginAirport, "ORIGIN")) {
      println(row.getString("ORIGIN") + " -> " + row.getString("DEST"));
      totalFlights++;
    }
  
    return totalFlights;
  }

  int totalDestFlights(String targetDestAirport) {
  
    int totalFlights = 0;
  
    for (TableRow row : table.matchRows(targetDestAirport, "DEST")) {
      println(row.getString("ORIGIN") + " -> " + row.getString("DEST"));
      totalFlights++;
    }
  
    return totalFlights;
  }
  
   void calculateDiversionTimes() {
    
    table.addColumn("DIVERSION_TIME");
    
    int expectedDepTime = 0;
    int actualDepTime = 0;

    TableRow row;
    
    for (int i = 7; i < table.getRowCount(); i++) {
      
      int diversionTime = 0;
      int cancelled = 0;
      
      row = table.getRow(i); // Get rows
      
      expectedDepTime = row.getInt("CRS_DEP_TIME"); // Get departure times
      actualDepTime = row.getInt("DEP_TIME");
      cancelled = row.getInt("CANCELLED");
      
      if ((actualDepTime <= expectedDepTime) || cancelled == 1 ) {
        
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
  
  
  
  String getLDAirport(String targetOriginCity) {
   
    calculateDiversionTimes();
    
    int longestDiversion = 0;
    String longestDiversionCity = "Honolulu, HI";
    int newLD = 0;
    String newLDCity;
    String string = "";
    
    for (TableRow row : table.matchRows(targetOriginCity, "ORIGIN")) {
      
      newLD = row.getInt("DIVERSION_TIME"); //<>//
      newLDCity = row.getString("DEST");
      
      if (newLD > longestDiversion) {
        longestDiversion = newLD;
        longestDiversionCity = newLDCity;
        
        string = "The longest diversion from " + targetOriginCity + " is to " 
          + longestDiversionCity + " and is " + longestDiversion + "mins";
      }
    }
    
          
      return string;
  }

    String getLongestDistanceAsOrigin(String airport) {
      
      

    int longestflight = 0;
    int newflight = 0;
    int arrival;
    int departure;
    String newLDCity;
    String end = "stinky poo town";
    
    
    for (TableRow row : table.matchRows(airport, "ORIGIN")) {
       
       newLDCity = row.getString("DEST");
       departure = row.getInt("DEP_TIME") ;
       arrival = row.getInt("ARR_TIME");
       int startMinutes = ( departure / 100) * 60 + ( departure % 100);
       int endMinutes = (arrival / 100) * 60 + (arrival % 100);
    
    if (startMinutes > endMinutes) {
      
      newflight = (24 * 60 - startMinutes) + endMinutes;
    } else {
      newflight = endMinutes - startMinutes;
    }
      if (newflight > longestflight) {
        end  = newLDCity;
        longestflight = newflight;

      }
    }
    int hours = longestflight/ 60;
    int minutes = longestflight % 60;
   return ("The longest flight is from  "+ airport + " is to " + end + " for "  + hours + ":" + minutes + " hours");
  }
  String getLongestDistanceAsDestination(String airport) {
      
      

    int longestflight = 0;
    int newflight = 0;
    int arrival;
    int departure;
    String newLDCity;
    String start = "stinky poo town";
    
    
    for (TableRow row : table.matchRows(airport, "DEST")) {
       
       newLDCity = row.getString("ORIGIN");
       departure = row.getInt("DEP_TIME") ;
       arrival = row.getInt("ARR_TIME");
       int startMinutes = ( departure / 100) * 60 + ( departure % 100);
       int endMinutes = (arrival / 100) * 60 + (arrival % 100);
    
    if (startMinutes > endMinutes) {
      
      newflight = (24 * 60 - startMinutes) + endMinutes;
    } else {
      newflight = endMinutes - startMinutes;
    }
      if (newflight > longestflight) {
        start = newLDCity;
        longestflight = newflight;

      }
    }
    int hours = longestflight/ 60;
    int minutes = longestflight % 60;
   return ("The longest flight to  "+ airport + " is from " + start + " for "  + hours + ":" + minutes + " hours");
  }
}
