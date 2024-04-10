class GraphData {
  
  void main() { 
    
    ArrayList<String> citiesAL = graphData.cities();
    cities = citiesAL.toArray(new String[citiesAL.size()]);
    ArrayList<String> datesAL = graphData.dates100k();
    dates = datesAL.toArray(new String[datesAL.size()]);
    
    tOF = totalOriginFlights();
    tDF = totalDestFlights();
    flightsPD = graphData.flightsPerDay(dates);
    longestDiversions = longestDiversions(graphData.getLDAirportArray(targetCity));
    routesA = routeFinderA(targetCity);
    routeFlightsA = routeFlightsA(routesA, targetCity);
    routesD = routeFinderD(targetCity);  
    routeFlightsD = routeFlightsD(routesD, targetCity);
    dailyFlights = dailyFlights(dates, targetCity);
}
  
  Integer[] totalOriginFlights() {
    
    Integer[] totalOriginFlights = new Integer[cities.length];
    String targetOriginCity = "";
    
    for(int i = 0; i < cities.length; i++) {
    
      targetOriginCity = cities[i];
      totalOriginFlights[i] = totalOriginFlights(targetOriginCity);
    }
    
    return totalOriginFlights;
  }
  
  Integer[] totalDestFlights() {
    
    Integer[] totalDestFlights = new Integer[cities.length];
    String targetDestCity = "";
    
    for(int i = 0; i < cities.length; i++) {
    
      targetDestCity = cities[i];
      totalDestFlights[i] = totalDestFlights(targetDestCity);
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
    String initialDate = initialRow.getString("FL_DATE");
    
    String[] dateStructure = initialDate.split("/");
    
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
  
  Integer[] dailyFlights(String[] dates, String targetCity) {
    
    Integer[] dailyFlights = new Integer[dates.length];
    String date = "";

    for (int i = 0; i < dates.length; i++) {
      
      Integer fPD = 0;
      date = dates[i];
      
      for (TableRow row : table.matchRows(date, "FL_DATE")) {
        
        if (targetCity.equals(row.getString("ORIGIN_CITY_NAME")) || targetCity.equals(row.getString("ORIGIN_CITY_NAME")))
        fPD++;
      }
      
     dailyFlights[i] = fPD;
    }
    
    return dailyFlights;
  }
  
  String[] routeFinderA(String targetCity) {
    
    ArrayList<String> routesAL = new ArrayList<String>();
    
    ArrayList<OriginCity> al = new ArrayList<OriginCity>();
    
    TableRow initialRow = table.matchRow(targetCity, "ORIGIN_CITY_NAME");
    OriginCity originCity = new OriginCity(initialRow.getString("ORIGIN_CITY_NAME"), initialRow.getString("DEST_CITY_NAME"));
    al.add(originCity);
    
    for (TableRow row : table.matchRows(targetCity, "ORIGIN_CITY_NAME")) {

      originCity = new OriginCity(row.getString("ORIGIN_CITY_NAME"), row.getString("DEST_CITY_NAME"));
      
      boolean found = false;
      
      for (OriginCity oc : al) {
          if (originCity.getDestCity().equals(oc.getDestCity())) {
              found = true;
              break;
          }
      }
      
      if (!found) {
          al.add(originCity);
      }
    }
    
    for (OriginCity oc : al) {
      routesAL.add(oc.getDestCity());
    }
    
    String[] routesA = null;
    routesA = routesAL.toArray(new String[routesAL.size()]);
    
    return routesA;
  }
  
  String[] routeFinderD(String targetCity) {
    
    ArrayList<String> routesAL = new ArrayList<String>();
    
    ArrayList<OriginCity> al = new ArrayList<OriginCity>();
    
    TableRow initialRow = table.matchRow(targetCity, "DEST_CITY_NAME");
    OriginCity originCity = new OriginCity(initialRow.getString("ORIGIN_CITY_NAME"), initialRow.getString("DEST_CITY_NAME"));
    al.add(originCity);
    
    for (TableRow row : table.matchRows(targetCity, "DEST_CITY_NAME")) { //<>//

      originCity = new OriginCity(row.getString("ORIGIN_CITY_NAME"), row.getString("DEST_CITY_NAME"));
      
      boolean found = false;
      
      for (OriginCity oc : al) {
          if (originCity.getOriginCity().equals(oc.getOriginCity())) {
              found = true;
              break;
          }
      }
      
      if (!found) {
          al.add(originCity);
      }
    }
    
    for (OriginCity oc : al) {
      routesAL.add(oc.getOriginCity());
    }
    
    String[] routesD = null;
    routesD = routesAL.toArray(new String[routesAL.size()]);
    
    return routesD;
  }
  
  Integer[] routeFlightsA(String[] routes, String targetCity) {
    
    Integer[] routeFlightsA = new Integer[routes.length];
    
    int i = 0;
    int j = 0;
    
    for (String s : routes) {
      
      j = 0;
      
      for (TableRow row : table.matchRows(targetCity, "ORIGIN_CITY_NAME")) {

        if (s.equals(row.getString("DEST_CITY_NAME"))) {
          j++;
        }
      }

      routeFlightsA[i] = j;
      i++;
    }
    
    return routeFlightsA;
  }
  
  Integer[] routeFlightsD(String[] routes, String targetCity) {
    
    Integer[] routeFlightsD = new Integer[routes.length];
    
    int i = 0;
    int j = 0;
    
    for (String s : routes) {
      
      j = 0;
      
      for (TableRow row : table.matchRows(targetCity, "DEST_CITY_NAME")) {

        if (s.equals(row.getString("ORIGIN_CITY_NAME"))) {
          j++;
        }
      }

      routeFlightsD[i] = j;
      i++;
    }
    
    return routeFlightsD;
  }
  
  ArrayList<String> flightsPerAirportDest(String targetCity) {
    
    ArrayList<String> flightsPerAirportDest = new ArrayList<String>();
  
    return flightsPerAirportDest;
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
      
      newLD = row.getInt("DIVERSION_TIME");
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
  
  String[] getLDAirportArray (String targetOriginCity) {
        
    ArrayList<String> arr = new ArrayList<String>();
    
    calculateDiversionTimes();
    
    int longestDiversion = 0;
    String longestDiversionCity = "Los Angeles, CA";
    int newLD = 0;
    String newLDCity;
    String string = "";
    
    for (TableRow row : table.matchRows(targetOriginCity, "ORIGIN_CITY_NAME")) {
     
      newLD = row.getInt("DIVERSION_TIME");
      newLDCity = row.getString("DEST_CITY_NAME");
      
      if (newLD != 0) {
        string = newLD + "/" + newLDCity;
        arr.add(string);
      }
    }
    
    String[] output = null;
    output = arr.toArray(new String[arr.size()]);

    return output;
  }
  
  String[] longestDiversions(String[] longestDiversion) {
    
    String[] string = new String[10];
    
    Arrays.sort(longestDiversion, (s1, s2) -> {
      
        int time1 = Integer.parseInt(s1.split("/")[0]);
        int time2 = Integer.parseInt(s2.split("/")[0]);
        return Integer.compare(time2, time1);
    });

    for (int i = 0; i < Math.min(10, longestDiversion.length); i++) {
      
        String[] parts = longestDiversion[i].split("/");
        int time = Integer.parseInt(parts[0]);
        String city = parts[1];
        string[i] = (time + "/" + city);
    }
    
    return string;
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
      totalFlights++;
    }
  
    return totalFlights;
  }
  
  int totalDestFlights(String targetDestAirport) {
  
    int totalFlights = 0;
  
    for (TableRow row : table.matchRows(targetDestAirport, "DEST_CITY_NAME")) {
      totalFlights++;
    }
  
    return totalFlights;
  }
}

class TimeCity {
  int time;
  String city;

  public TimeCity(int time, String city) {
      this.time = time;
      this.city = city;
  }
}

class OriginCity {
 String originCity;
 String destCity;
 
 OriginCity(String originCity, String destCity) {
   this.originCity = originCity;
   this.destCity = destCity;
 }
 
 String getOriginCity() {
   return this.originCity; 
 }
 
 String getDestCity() {
   return this.destCity; 
 }
}
