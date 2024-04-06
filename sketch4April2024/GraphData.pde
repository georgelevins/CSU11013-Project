class GraphData {
  
  int[] totalOriginFlights() {
    
    int[] totalOriginFlights = new int[cities.length];
    String targetOriginCity = "";
    
    for(int i = 0; i < cities.length; i++) {
    
      targetOriginCity = cities[i];
      totalOriginFlights[i] = info.totalOriginFlights(targetOriginCity);
    }
    
    return totalOriginFlights;
  }
  
  int[] totalDestFlights() {
    
    int[] totalDestFlights = new int[cities.length];
    String targetDestCity = "";
    
    for(int i = 0; i < cities.length; i++) {
    
      targetDestCity = cities[i];
      totalDestFlights[i] = info.totalDestFlights(targetDestCity);
    }

    return totalDestFlights;
  }
  
  ArrayList<String> cities() {
    
    ArrayList<String> cityArrayList = new ArrayList<String>();
    
    TableRow result = table.getRow(0);
    String city = result.getString("DEST_CITY_NAME");
    cityArrayList.add(city);
    
    String element;
 
    for (int i = 0; i< table.getRowCount(); i++) {
      
      result = table.getRow(i);
      element = result.getString("DEST_CITY_NAME");
      
      if(!cityArrayList.contains(element)) {
        cityArrayList.add(element); 
      }
    }

    return cityArrayList;
  }
  
  ArrayList<String> dates2k() {
    
    ArrayList<String> dates = new ArrayList<String>();
    
    TableRow initialRow = table.getRow(0);
    String randomDate = initialRow.getString("FL_DATE");
    
    String[] dateStructure = randomDate.split("/");
    
    for (int i = 1; i <= 31; i++) {
      
      if (i < 10) {
        dates.add(dateStructure[0] + "/0" + i + "/" + dateStructure[2]);
      } else {
        dates.add(dateStructure[0] + "/" + i + "/" + dateStructure[2]);
      }
    }

    return dates;
  }
  
  ArrayList<String> dates100k() {
    
    ArrayList<String> dates = new ArrayList<String>();
    
    TableRow initialRow = table.getRow(0);
    String randomDate = initialRow.getString("FL_DATE");
    
    String[] dateStructure = randomDate.split("/");
    
    for (int i = 1; i <= 31; i++) {
      
      if (i < 10) {
        dates.add(dateStructure[0] + "/" + i + "/" + dateStructure[2]);
      } else {
        dates.add(dateStructure[0] + "/" + i + "/" + dateStructure[2]);
      }
    }

    return dates;
  }
  
  Integer[] flightsPerDay(String[] dates) {
    
    Integer[] flightsPerDay = new Integer[dates.length];
    String date = "";

    for (int i = 0; i < dates.length; i++) {
      
      Integer fPD = 0;
      date = dates[i];
      
      for (TableRow row : table.matchRows(date, "FL_DATE")) {
        fPD++;
      }
      
     flightsPerDay[i] = fPD;
    }
    
    return flightsPerDay;
  }
  
  ArrayList<String> longestFlights() {
    
    ArrayList<String> longestFlights = new ArrayList<String>();
    
    // Return top 10 longestFlights
    return longestFlights;
  } 
}
