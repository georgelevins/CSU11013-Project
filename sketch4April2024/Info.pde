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
      //println(row.getString("ORIGIN_CITY_NAME") + " -> " + row.getString("DEST_CITY_NAME"));
      totalFlights++;
    }
  
    return totalFlights;
  }
  
  int totalDestFlights(String targetDestAirport) {
  
    int totalFlights = 0;
  
    for (TableRow row : table.matchRows(targetDestAirport, "DEST_CITY_NAME")) {
      //println(row.getString("ORIGIN_CITY_NAME") + " -> " + row.getString("DEST_CITY_NAME"));
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
  
   println("The longest diversion is " + longestDiversion + "mins");
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
    
    for (TableRow row : table.matchRows(targetOriginCity, "ORIGIN_CITY_NAME")) {
      
      newLD = row.getInt("DIVERSION_TIME"); //<>//
      newLDCity = row.getString("DEST_CITY_NAME");
      
      if (newLD > longestDiversion) {
        longestDiversion = newLD;
        longestDiversionCity = newLDCity;
        
        string = "The longest diversion from " + targetOriginCity + " is to " 
          + longestDiversionCity + " and is " + longestDiversion + "mins";
      }
    }
      return string;
  }
  
  //// //// //// //// new STUFF
    
  void drawGraphs(String[] cities) { // Added drawGraphs as a variable
    if (keyPressed) {
      if (key == '1') {
        drawGraph1 = true;
        drawGraph();
      }
    
      if (key == '2') {
        drawGraph2 = true; 
        drawGraph2();
      }
      
      if (key == '3') {
        drawGraph3 = true;
        drawGraph3();
      }
      
      if (key == '4') {
        drawGraph4 = true;
        drawGraph4();
      }
    }
  }

  void drawGraph() {
    
    if (drawGraph1 == true) { ////// Add a space between the flights
    
      fill(255); // Screen
      rect(0, 0, 1630, 820);
      fill(0);
      text("GROUPED BAR CHART OF THE NUMBER OF FLIGHTS PER AIRPORT", 400, 50);
      rect(100, 75, 5, 675);
      rect(100, 750, 1200, 5);
    
      int yDashes = 750;
    
      for (int i = 0; i < 28; i++) {
      
        fill(0); // Dashes on Y-Axis
        rect(105, yDashes, 5, 5);
        yDashes-=25;
      
        if (i < 27) {
          fill(0); 
          text(i*3, 80, yDashes+30);
        }
      }
    
      int xPosGraphs = 120;
      String targetDestAirport = "Los Angeles, CA";
    
      for (int i = 0; i < cities.length; i++) {
      
        targetDestAirport = cities[i];
      
        int totalOriginFlights = info.totalOriginFlights(targetDestAirport);
        int totalDestFlights = info.totalDestFlights(targetDestAirport);
    
        fill(0, 0, 255);
        rect(xPosGraphs, 750, 3, -totalOriginFlights * 3);
    
        fill(0, 255, 0);
        rect(xPosGraphs+3, 750, 3, -totalDestFlights * 3);
      
        xPosGraphs+=10;
      
        if (mouseX >= xPosGraphs-10 && mouseX <= xPosGraphs) {
        
          fill(0);
          text(targetDestAirport, mouseX, mouseY);
        }  
      }
    }
  }
  
  void drawGraph2() {
    
    if (drawGraph2 == true) {
      
      fill(255); // Screen
      rect(0, 0, 1630, 820);
      
      fill(0);
      ellipse(400, 400, 605, 605);
      fill(255);
      ellipse(400, 400, 600, 600);
      fill(0);
      text("Incoming flights", 200, 100);
      
      fill(0);
      ellipse(1100, 400, 605, 605);
      fill(255);
      ellipse(1100, 400, 600, 600);
      fill(0);
      text("Outcoming flights", 900, 100);
    }
  }
  
  void drawGraph3() {
  
    if (drawGraph3 == true) {
    
      fill(255); // Screen
      rect(0, 0, 1630, 820);
      
      fill(0);
      text("LINE PLOT OF NUMBER OF FLIGHTS PER DAY", 100, 100);
      
    }
  }
  
  void drawGraph4() {
    
    if (drawGraph4 == true) {
      
      fill(255); // Screen
      rect(0, 0, 1630, 820);
      
      fill(0);
      text("HORIZONTAL BAR GRAPH OF LONGEST FLIGHTS", 100, 100);
    }
  }
  
  ArrayList<String> cities() {
    
    ArrayList<String> cityArrayList = new ArrayList<String>();
    
    TableRow result = table.getRow(0);
    String city = result.getString("DEST_CITY_NAME");
    cityArrayList.add(city);
    
    String element;
    q
    for (int i = 0; i< table.getRowCount(); i++) {
      
      result = table.getRow(i);
      element = result.getString("DEST_CITY_NAME");
      
      if(!cityArrayList.contains(element)) {
        cityArrayList.add(element); 
      }
    }
    
    for (int i = 0; i < cityArrayList.size(); i++) {
    
      println(cityArrayList.get(i));
    }
    
    return cityArrayList;
  }
  
  ArrayList<Integer> dates() {
    
    ArrayList<Integer> dates = new ArrayList<Integer>();
    
    // Return number of flights per date
    return dates;
  }
  
  ArrayList<String> longestFlights() {
    
    ArrayList<String> longestFlights = new ArrayList<String>();
    
    // Return top 10 longestFlights
    return longestFlights;
  }
}
