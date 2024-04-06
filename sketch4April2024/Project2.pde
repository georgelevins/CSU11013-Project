ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;
PImage border;
PShape map;
PImage logo;
PImage home;

String fileName = "flights_full.csv";

boolean drawGraph1;
boolean drawGraph2;
boolean drawGraph3 = false;
boolean drawGraph4 = false;
String[] cities = null;
String[] dates = null;
int[] tOF = null;
int[] tDF = null;
Integer[] flightsPD = null;

Info info;
Graphs graphs;
GraphData graphData;

void setup() {
 
  size(1470, 820);
  table = loadTable(fileName, "header");

  border = loadImage("border.png");
  map = loadShape("CANADA.svg");
  logo = loadImage("logo.png");
  home = loadImage("home.png");

  textSize(10);
  frameRate(30);
  
  info = new Info();
  graphs = new Graphs();
  graphData = new GraphData();
  
  ArrayList<String> citiesAL = graphData.cities();
  cities = citiesAL.toArray(new String[citiesAL.size()]);
  
  if (fileName == "flights2k(1).csv") {
    
    ArrayList<String> datesAL = graphData.dates2k();
    dates = datesAL.toArray(new String[datesAL.size()]);
  
  } else if (fileName == "flights100k(1).csv" || fileName == "flights_full.csv"){
    
    ArrayList<String> datesAL = graphData.dates100k();
    dates = datesAL.toArray(new String[datesAL.size()]);
  }
  
  tOF = graphData.totalOriginFlights();
  tDF = graphData.totalDestFlights();
  flightsPD = graphData.flightsPerDay(dates);
  
}

void draw() {

 background (0, 125, 255);
  
  image(border, 120, 80);
  shape(map, 195, 130);
  image(logo, -70, -70);
  image(home, -70, 60);

  graphs.drawGraphs(tOF, tDF, flightsPD);
} //<>//
