import java.util.Arrays;

Table table;

String targetCity = "Los Angeles, CA";
boolean callGraphs = false;
String[] cities, dates, longestDiversions, routesA, routesD = null;
Integer[] tOF, tDF, flightsPD, routeFlightsA, dailyFlights, routeFlightsD = null;
int pageCount = 0;

Graphs graphs;
GraphData graphData;

void setup() {
  
  size(1230, 820);
  table = loadTable("flights_full.csv", "header");
  textSize(10);
  frameRate(30); 
  
  graphs = new Graphs();
  graphData = new GraphData(); 
  graphData.main();
}

void draw() {
  
 background(175);
 
 graphs.main();  
}
