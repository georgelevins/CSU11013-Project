
ArrayList<Flight> flights = new ArrayList<Flight>();
Table table;
String flightData;
PImage border;
PImage map;
PImage logo;
PImage home;
PImage currentImage;
PImage statesPage;
States test;
boolean[] stateClicked;

 float[] stateX = {401, 301, 489};
 float[] stateY = {419, 357, 350};


void setup() {
  
  size(1230, 820);
  table = loadTable("flights2k(1).csv", "header");

  border = loadImage("border.png");
  logo = loadImage("logo.png");
  home = loadImage("home.png");
  currentImage = loadImage("CANADA.png");

  for (int i = 0; i < 20; i++) {
    Flight newFlight = new Flight(table.getRow(i));
    flights.add(newFlight);
  }
   textSize(10);
   frameRate(30);

  test = new States();
  stateClicked = new boolean[50];
  
  
  for (int i = 0; i < stateClicked.length; i++)
  {
    stateClicked[i] = false;
  }
 
 
  
}

void mousePressed()  {
  println("Clicked at (" + mouseX + ", " + mouseY + ")");
  
  for (int i = 0; i < stateX.length; i++)
  {
    if (!stateClicked[i] && dist(mouseX, mouseY, stateX[i], stateY[i]) <= CIRCLE_RAD/2)
    {
      currentImage = loadImage("statesPage.png");
      stateClicked[i] = true;
    }
    
    
  }
  
  
  }
  
void draw() {
 background (0, 125, 255);
  
  image(border, 120, 80);
  image(logo, -70, -70);
  image(home, -70, 60);
  image(currentImage, 195, 130);
  
  for (int i = 0; i < 50; i++)
  {
    if (!stateClicked[i])
    {
      currentImage = loadImage("CANADA.png");
      test.drawStates();
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
//void text_ArrayList(Table table) {

 
    
 //   for (int y = 0; y < flights.size(); y++) {
 //     Flight flight = flights.get(y);
    
 //       flightData ="MKT_CARRIER: " + flight.MKT_CARRIER + ", " +
 //                 "MKT_CARRIER_FL_NUM: " + flight.MKT_CARRIER_FL_NUM + ", " +
 //                 "ORIGIN: " + flight.ORIGIN + ", " +
 //                 "DEST: " + flight.DEST + ", " +
 //                 "CRS_DEP_TIME: " + flight.CRS_DEP_TIME + ", " +
 //                 "CRS_ARR_TIME: " + flight.CRS_ARR_TIME + ", " +
 //                 "CANCELLED: " + flight.CANCELLED + ", " +
 //                 "DIVERTED: " + flight.DIVERTED + ", " +
 //                 "DISTANCE: " + flight.DISTANCE;
      
     
 //     fill(0, 0, 250);
 //     text(flightData, 40, 50 * y);
    }
//  }
