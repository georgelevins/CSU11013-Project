class Graphs {
  
  boolean drawGraph1, drawGraph2, drawGraph3, drawGraph4 = false;
  int zoom1_100k = 50;
  int zoom2_100k = 50;
  int menuCount1_100k = 0;
  boolean green1_100k = true;
  boolean red1_100k = false;

  void drawGraphs(Integer[] tOF, Integer[] tDF, Integer[] flightsPD, int pageCount, String[] longestDiversions, String[] routes, Integer[] routeFlights, Integer[] dailyFlights) {

    if (pageCount == 1) {
    
      drawGraph1 = true;
      drawgraph1_full(tOF, tDF);
    }
    
    else if (pageCount == 2) {
    
      drawGraph2 = true;
      drawgraph2_full(flightsPD);
    }
    
    else if (pageCount == 3) {
      
      drawGraph3 = true;
      drawGraph3(longestDiversions, routes, routeFlights, dailyFlights);
    }
    
    else if (pageCount == 4) {
      
      drawGraph4 = true;
      drawGraph4();
    }
  }
  
  void drawgraph1_full(Integer[] totalOriginFlights, Integer[] totalDestFlights) {
    
    if (drawGraph1 == true) {

      drawBackground();

      fill(255);
      text("OPTIONS" , 985, 37);
      fill(80);
      float x = 65;
      float y = 450;
      textAlign(CENTER,BOTTOM);
      pushMatrix();
      translate(x,y);
      rotate(-HALF_PI);
      text("NUMBER OF FLIGHTS (,000)",0,0);
      popMatrix();
      fill(0);
      text("BAR CHART OF THE NUMBER OF FLIGHTS PER AIRPORT", 260, 40);
      rect(100, 75, 5, 675);
      rect(100, 750, 1200, 5);
    
      int yDashes = 750;
    
      for (int i = 0; i < 28; i++) {
      
        fill(0);
        rect(105, yDashes, 5, 5);
        yDashes-=25;
      
        if (i < 27) {
          
          fill(0); 
          text(i * 25 * zoom1_100k, 80, yDashes+30);
        }
      }
    
      int xPosGraphs = 120;
      int tOF = 0;
      int tDF= 0;
      
      if (mousePressed && mouseX > 1130 && mouseY > 20 && mouseX < 1180 && mouseY < 45) {
                
        fill(50);
        rect(1130, 20, 50, 25, 20); // Zoom In
        fill(255);
        rect(1145, 30, 20, 5, 20); // Minus
        
        zoom1_100k+=5;
      }
      
      if (mousePressed && mouseX > 1070 && mouseY > 20 && mouseX < 1120 && mouseY < 45 && zoom1_100k > 45) {
        
        fill(50);
        rect(1070, 20, 50, 25, 20); // Zoom Out
        fill(255);
        rect(1085, 30, 20, 5, 20); // Plus
        rect(1092.5, 22.5, 5, 20, 20);
        
        zoom1_100k-=5;
      }

      if (mouseX > 910 && mouseY > 20 && mouseX < 1060 && mouseY < 70) {
        
        fill(100);
        rect(910, 20, 150, 50, 20);
        fill(255);
        rect(920, 25, 130, 17.5, 20); // Menu
        rect(920, 47.5, 130, 17.5, 20); // Menu
        fill(0);
        text("TOTAL ORIGIN FLIGHTS" , 985, 40);
        text("TOTAL DEST FLIGHTS" , 985, 62.5);
        
        if (mousePressed && mouseX > 920 && mouseY > 25 && mouseX < 1050 && mouseY < 42.5) {
          
          green1_100k = true;
          red1_100k = false;
        } else if (mousePressed && mouseX > 920 && mouseY > 47.5 && mouseX < 1050 && mouseY < 65) {
          
          green1_100k = false;
          red1_100k = true;
        }
      }
      
      if (green1_100k) {
      
        for (int i = 0; i < cities.length; i++) {

          stroke(0);
          tOF = totalOriginFlights[i];
    
          fill(255, 0, 0);
          rect(xPosGraphs, 750, 3, -(tOF / zoom1_100k));

          xPosGraphs+=3;
      
          if (mouseX >= xPosGraphs-5 && mouseX <= xPosGraphs && mouseY >= 750-(tOF / zoom1_100k)) {
        
            fill(0);
            text(cities[i] + " (O)" + tOF, xPosGraphs, 750-(tOF / zoom1_100k) - 100);
            stroke(0);
            line(xPosGraphs, 750-(tOF / zoom1_100k), xPosGraphs, 750-(tOF / zoom1_100k)- 100);
          }  
        } 
      }
      
      if (red1_100k) {
      
        for (int i = 0; i < cities.length; i++) {
 
          stroke(0);
          tDF = totalDestFlights[i];

          fill(0, 255, 0);
          rect(xPosGraphs, 750, 3, -(tDF / zoom1_100k));

          xPosGraphs+=3;
      
          if (mouseX > xPosGraphs-5 && mouseX < xPosGraphs && mouseY >= 750-(tDF / zoom1_100k)) {
        
            fill(0);
            text(cities[i] + " (D)" + tDF, xPosGraphs, 750-(tDF / zoom1_100k) - 100);
            stroke(0);
            line(xPosGraphs, 750-(tDF / zoom1_100k), xPosGraphs, 750-(tDF / zoom1_100k)- 100);
          }  
        }
      }
    }
  }
  
  void drawgraph2_full(Integer[] flightsPD) {
        
    if (drawGraph2 == true) {
      
      drawBackground();
      
      fill(225);
      rect(900, 10, 170, 39); // Menu COVER   
      fill(80);
      float x = 65;
      float y = 450;
      textAlign(CENTER,BOTTOM);
      pushMatrix();
      translate(x,y);
      rotate(-HALF_PI);
      text("NUMBER OF FLIGHTS",0,0);
      popMatrix();
      fill(0);
      text("LINE PLOT OF NUMBER OF FLIGHTS PER DAY", 260, 40);
      rect(100, 75, 5, 675);
      rect(100, 750, 1000, 5);
      
      int xPosGraphs = 120;
      int yDashes = 750;
    
      for (int i = 0; i < 28; i++) {
      
        fill(0); // Dashes on Y-Axis
        rect(105, yDashes, 5, 5);
        yDashes-=25;
      
        if (i < 27) {
          
          fill(0); 
          text(i * 25 * zoom2_100k, 80, yDashes+30);
        }
      }
      
      int spaceTopLeftX, spaceTopRightX, spaceTopRightY, spaceBottomRightY = 0;
      
      if (mousePressed && mouseX > 1130 && mouseY > 20 && mouseX < 1180 && mouseY < 45) {
        
        fill(50);
        rect(1130, 20, 50, 25, 20); // Zoom In        
        fill(255);
        rect(1145, 30, 20, 5, 20); // Minus
        
        zoom2_100k+=5;
      }
      
      if (mousePressed && mouseX > 1070 && mouseY > 20 && mouseX < 1120 && mouseY < 45 && zoom2_100k > 30) {
        
        fill(255);
        rect(1085, 30, 20, 5, 20); // Plus
        rect(1092.5, 22.5, 5, 20, 20);
        fill(50);
        rect(1070, 20, 50, 25, 20); // Zoom Out
        
        zoom2_100k-=5;
      }
  
      int previousX = xPosGraphs;
      int previousY = 750 - (flightsPD[0] / zoom2_100k);
      int currentX = 0;
      int currentY = 0;
      
      for (int i = 0; i <= 30; i++) {
        
        if (flightsPD[i] != null) {
          
          fill(0);
          rect(xPosGraphs + i * 30, (750 - (flightsPD[i] / zoom2_100k)), 2, 2, 20);
          
          spaceTopLeftX = xPosGraphs + i * 30 - 10;
          spaceTopRightX = xPosGraphs + i * 30 + 10;
          spaceTopRightY = 750 - (flightsPD[i] / zoom2_100k) - 10;
          spaceBottomRightY = 750 - (flightsPD[i] / zoom2_100k) + 10;

          if (mouseX > spaceTopLeftX && mouseY > spaceTopRightY && 
              mouseX < spaceTopRightX && mouseY < spaceBottomRightY) {
          
            if (flightsPD[i] != 0) {
              
              fill(255, 0, 0);
              text(dates[i]+ " " + flightsPD[i], xPosGraphs + i * 30, 730 - (flightsPD[i] / zoom2_100k));
            }
          }
          
          currentX = xPosGraphs + i * 30;
          currentY = 750 - (flightsPD[i] / zoom2_100k);
          
          stroke(0);
          line(previousX, previousY, currentX, currentY);
          
          previousX = currentX;
          previousY = currentY;
        }
      }
    }
  }
  
  void drawGraph3(String[] longestDiversions, String[] routes, Integer[] routeFlights, Integer[] dailyFlights) {
  
    if (drawGraph3 == true) {
    
      drawBackground();
      
      fill(225);
      rect(900, 10, 170, 39); // Menu COVER
      
      fill(0);
      text("AIRPORT INFORMATION", 260, 40);
      
      textAlign(LEFT, TOP);
      
      text("Longest Diversions", 520, 350);
      rect(100, 75, 5, 300);
      rect(100, 75, 500, 5);
      
      int y = 0;
      
      for (String s : longestDiversions) {
        
        String[] parts = s.split("/");
        int time = Integer.parseInt(parts[0]);
        String city = parts[1];
        
        fill(0, 0, 255);
        rect(105, 100 + y, time/5, 10);
        y+=20;
      }
      
      fill(0);
      text("Daily Flights", 810, 75);
      rect(800, 75, 5, 300);
      rect(800, 375, 500, 5);
      
      int xDF = 810;
      
      for (int p = 0; p < dailyFlights.length; p++) {
        
        fill(0, 255, 0);
        rect(xDF, 375, 5, -(dailyFlights[p]/2));
        xDF+=10;
      }
      
      fill(0);
      text("Arrivals and Depatures", 110, 450);
      rect(100, 450, 5, 300);
      rect(100, 750, 1200, 5);
      
      int xAD = 110;
      
      for (int l = 0; l < routes.length; l++) {
        
        fill(255, 0, 0);
        rect(xAD, 750, 5, -(routeFlights[l]/5));
        
        xAD+=10;
      }
    }
  }
  
  void drawGraph4() {
    
    if (drawGraph4 == true) {
      
      drawBackground();
      
      fill(225);
      rect(900, 10, 170, 39); // Menu COVER
      
      fill(0);
      text("HORIZONTAL BAR GRAPH OF LONGEST FLIGHTS", 100, 100);
    }
  }
  
  void drawBackground() {
    
    fill(255); // Screen
    rect(0, 0, 1470, 820);
  
    for (int i = 0; i < 1630; i+=10) {
      fill(225);
      rect(0, i, 1470, 1);
      noStroke();
    }
    
    for (int i = 0; i < 1630; i+=10) {
      rect(i, 0, 1, 1470);
      noStroke();
    }
    
    rect(0, 0, 1470, 50);  // Margins
    rect(0, 780, 1470, 50);
    rect(0, 0, 50, 780);
    rect(1420, 0, 50, 780);
    
    fill(240); 
    rect(50, 20, 500, 25, 20); // TITLE BAR
    
    fill(0, 0, 255); // Home Button // Needs an Image
    rect(1370, 20, 50, 25, 20);
    
    fill(100);
    rect(910, 20, 150, 25, 20); // Menu
    rect(1130, 20, 50, 25, 20); // Zoom In
    rect(1070, 20, 50, 25, 20); // Zoom Out
    
    fill(255);
    rect(1145, 30, 20, 5, 20); // Minus
    rect(1085, 30, 20, 5, 20); // Plus
    rect(1092.5, 22.5, 5, 20, 20);
    
    fill(255);
    rect(1387.5, 28, 12, 2, 20); // Top
    rect(1387.5, 28, 2, 12, 20); // Left    
    rect(1387.5, 38, 12, 2, 20); // Bottom
    rect(1397.5, 28, 2, 12, 20); // Right
    triangle(1383, 28, 1403, 28, 1393, 22.5); // Roof
    
    if (mousePressed && mouseX > 1370 && mouseY > 20 && mouseX < 1420 && mouseY < 45) {
      
      fill(50, 50, 255); // Home Button // Needs an Image
      rect(1370, 20, 50, 25, 20);
      
      fill(255);
      rect(1387.5, 28, 12, 2, 20); // Top
      rect(1387.5, 28, 2, 12, 20); // Left    
      rect(1387.5, 38, 12, 2, 20); // Bottom
      rect(1397.5, 28, 2, 12, 20); // Right
      triangle(1383, 28, 1403, 28, 1393, 22.5); // Roof
    }
  }
  
  void main() {
     
    fill(225);
    rect(100, 100, 100, 20, 20);
    rect(100, 125, 100, 20, 20);
    rect(100, 150, 100, 20, 20);
    rect(100, 175, 100, 20, 20);
          
    if (mousePressed && mouseX > 100 && mouseY > 100 && mouseX < 200 && mouseY < 120) {
    
      callGraphs = true;
      pageCount = 1;
    } else if (mousePressed && mouseX > 100 && mouseY > 125 && mouseX < 200 && mouseY < 145) {
    
      callGraphs = true;
      pageCount = 2;
    } else if (mousePressed && mouseX > 100 && mouseY > 150 && mouseX < 200 && mouseY < 170) {
    
      callGraphs = true;
      pageCount = 3;
    } else if (mousePressed && mouseX > 100 && mouseY > 175 && mouseX < 200  && mouseY < 200) {
    
      callGraphs = true;
      pageCount = 4;
    }

    if (mousePressed && mouseX > 1370 && mouseY > 20 && mouseX < 1420 && mouseY < 45) {
    
      callGraphs = false;
      pageCount = 0;
    }
  
    if (callGraphs) {
      graphs.drawGraphs(tOF, tDF, flightsPD, pageCount, longestDiversions, routes, routeFlights, dailyFlights);
    }
  }
}
