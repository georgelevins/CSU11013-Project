//PImage home3;
//Created by Liam Power 
class Graphs {
  
  Button[] buttons = new Button[2];
  
  boolean drawGraph1, drawGraph2, drawGraph3, drawGraph4 = false;
  int zoom1_100k = 50;
  int zoom2_100k = 50;
  int menuCount1_100k = 0;
  boolean green1_100k = true;
  boolean red1_100k = false;
  
    boolean arrivals3 = true; /////
  boolean departures3 = false; /////

  void drawGraphs(Integer[] tOF, Integer[] tDF, Integer[] flightsPD, int pageCount, String[] longestDiversions, String[] routes, Integer[] routeFlights, Integer[] dailyFlights) {

    if (showSearchResult) {
      pageCount = 3;
    }
    
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
      
      fill(225);
      rect(1130, 20, 50, 25, 20); // Zoom In
      
      //home3 = loadImage("home2.png");
      
      textAlign(LEFT, TOP);
      
        if (mouseX >= 570 && mouseX <= 610 && mouseY >= 25 && mouseY <= 50 && mousePressed) {
    showSearchResult = false;
    // Add your code here to execute when the text is clicked
  }
      
      drawBackground();
      
      fill(225);
      rect(442.5, 345, 150, 20, 20);
      rect(725, 72.5, 90, 20, 20);
      rect(122.5, 447.5, 90, 20, 20);
      
      
      
      if (mousePressed && mouseX > 122.5 && mouseY > 447.5 && mouseX < 212.5 && mouseY > 467.5) {
         
        arrivals3 = !arrivals3;
        departures3 = !departures3;
      }

      fill(225);
      rect(1000, 20, 200, 25, 20); // Zoom In
      
      fill(225);
      rect(900, 10, 170, 39); // Menu COVER
      
      fill(0);
      textSize(20);
      text("FLIGHT INFORMATION", 200, 25);
      
      textSize(15);
      text("Longest Diversions", 460, 350);
      rect(100, 75, 5, 325);
      rect(100, 75, 500, 5);
      
      textSize(12);
      text("NUMBER OF FLIGHTS", 260, 55);
      
      textSize(7);
      
      for (int a = 0; a < 50; a++) {
        
        rect(100 + (a * 10), 75, 2, 10);
        
        if (a % 2 != 0) {
          text(a * 50, 100 + (a * 10), 65);
        }
      }
      
      int y = 0;
      int count = 0;
      stroke(0);
      
      for (String s : longestDiversions) {
          
        if (s != null) {
          
          String[] parts = s.split("/");
          int time = Integer.parseInt(parts[0]);
          String city = parts[1];
          
          if (count % 2 == 0) {
              fill(0, 0, 255); // Blue color for even rectangles
          } else {
              fill(0, 255, 255); // Aqua color for odd rectangles
          }
          
          rect(105, 100 + y, time/5, 15);
          fill(0);
          textSize(12);
          text(city + " -  #" + time, time/5 + 120, 100 + y);
          y += 25;
          count++;
        }
      }

      fill(0);
      textSize(15);
      text("Daily Flights", 730, 75);
      rect(700, 75, 5, 300);
      rect(700, 375, 400, 5);
      textSize(7);
      
      for (int a = 0; a < 31; a++) {
        
        rect(700, 375 - (a * 10), 10, 2);
        text(a * 20, 680, 375 - (a * 10));
      }
         
      textSize(12);
      float xMenuDF = 670;
      float yMenuDF = 220;
      textAlign(CENTER,BOTTOM);
      pushMatrix();
      translate(xMenuDF, yMenuDF);
      rotate(-HALF_PI);
      text("NUMBER OF FLIGHTS",0,0);
      popMatrix();
      
      int currentXDF = 0;
      int currentYDF = 0;
      int previousXDF = 720;
      int previousYDF = 375-(dailyFlights[0]/2);
      
      int spaceTopLeftX, spaceTopRightX, spaceTopRightY, spaceBottomRightY;
      
      int xDF = 720;
      int colourDF = 0;
      
      for (int p = 0; p < dailyFlights.length; p++) {
        
        fill(colourDF);
        rect(xDF, 375-(dailyFlights[p]/2), 1, 1, 20);
        xDF+=10;
        
        spaceTopLeftX = xDF - 15;
        spaceTopRightX = xDF - 5;
        spaceTopRightY = 375-(dailyFlights[p]/2);
        spaceBottomRightY = 375-(dailyFlights[p]/2) + 10;

        if (mouseX > spaceTopLeftX && mouseY > spaceTopRightY && 
            mouseX < spaceTopRightX && mouseY < spaceBottomRightY) {
        
          if (dailyFlights[p] != 0) {
            
            textSize(20);
            fill(255, 0, 0);
            text(dates[p]+ " -  # " + dailyFlights[p], spaceTopLeftX + 50, spaceTopRightY - 40);
            textSize(10);
            
            colourDF = 225;
          }
        }
        
        currentXDF = xDF-10;
        currentYDF = 375-(dailyFlights[p]/2);
        
        stroke(colourDF);
        line(previousXDF, previousYDF, currentXDF, currentYDF);
        
        previousXDF = currentXDF;
        previousYDF = currentYDF;
      }
      
      if (arrivals3) {
          
      noStroke();
      fill(0);
      textSize(15);
      text("Arrivals", 170, 465);
      rect(100, 450, 5, 300);
      rect(100, 750, 1000, 5);
      textSize(7);
      
      for (int a = 0; a < 31; a++) {
        
        rect(100, 750 - (a * 10), 10, 2);
        text(a * 50, 75, 750 - (a * 10));
      }
      
      textSize(12);
      float xMenuAD = 65;
      float yMenuAD = 600;
      textAlign(CENTER,BOTTOM);
      pushMatrix();
      translate(xMenuAD, yMenuAD);
      rotate(-HALF_PI);
      text("NUMBER OF FLIGHTS",0,0);
      popMatrix();
      
      int currentXAD = 120;
      int currentYAD = 750 -(routeFlights[0]/5);
      int previousXAD = 0;
      int previousYAD = 0;
      int spaceTopLeftXAD, spaceTopRightXAD, spaceTopRightYAD, spaceBottomRightYAD;
      int xAD = 120;
      int colourAD = 0;
      
      stroke(0);

      for (int l = 0; l < routes.length; l++) {
      
        if (l % 2 == 0) {
            fill(0, 255, 255);
        } else {
            fill(0, 0, 255);
        }
    
        rect(xAD, 750, 10, -(routeFlights[l] / 5));
    
        xAD += 10;
    
        spaceTopLeftXAD = xAD - 10;
        spaceTopRightXAD = xAD;
        spaceTopRightYAD = 750 - routeFlights[l] / 5;
        spaceBottomRightYAD = 750;
    
        if (mouseX > spaceTopLeftXAD && mouseY > spaceTopRightYAD &&
            mouseX < spaceTopRightXAD && mouseY < spaceBottomRightYAD) {
    
            textSize(20);
            text(routes[l] + " -  #" + routeFlights[l], xAD - 10, 750 - routeFlights[l] / 5 - 50);
    
            colourAD = 255;
        }
      }
      
      }
      
      else if (departures3) {
             
      noStroke();
      fill(0);
      textSize(15);
      text("Departures", 170, 465);
      rect(100, 450, 5, 300);
      rect(100, 750, 1000, 5);
      textSize(7);
      
      for (int a = 0; a < 31; a++) {
        
        rect(100, 750 - (a * 10), 10, 2);
        text(a * 50, 75, 750 - (a * 10));
      }
      
      textSize(12);
      float xMenuAD = 65;
      float yMenuAD = 600;
      textAlign(CENTER,BOTTOM);
      pushMatrix();
      translate(xMenuAD, yMenuAD);
      rotate(-HALF_PI);
      text("NUMBER OF FLIGHTS",0,0);
      popMatrix();
      
      int currentXADd = 120;
      int currentYADd = 750 -(routeFlights[0]/5);
      int previousXADd = 0;
      int previousYADd = 0;
      int spaceTopLeftXADd, spaceTopRightXADd, spaceTopRightYADd, spaceBottomRightYADd;
      int xADd = 120;
      int colourADd = 0;
      
      stroke(0);

      for (int l = 0; l < routes.length; l++) {
      
        if (l % 2 == 0) {
            fill(0, 255, 255);
        } else {
            fill(0, 0, 255);
        }
    
        rect(xADd, 750, 10, -(routeFlights[l] / 5));
    
        xADd += 10;
    
        spaceTopLeftXADd = xADd - 10;
        spaceTopRightXADd = xADd;
        spaceTopRightYADd = 750 - routeFlights[l] / 5;
        spaceBottomRightYADd = 750;
    
        if (mouseX > spaceTopLeftXADd && mouseY > spaceTopRightYADd &&
            mouseX < spaceTopRightXADd && mouseY < spaceBottomRightYADd) {
    
            textSize(20);
            text(routes[l] + " -  #" + routeFlights[l], xADd - 10, 750 - routeFlights[l] / 5 - 50);
    
            colourADd = 255;
        }
      }
      
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
    rect(1387.5 - 810, 28, 12, 2, 20); // Top
    rect(1387.5 - 810, 28, 2, 12, 20); // Left    
    rect(1387.5 - 810, 38, 12, 2, 20); // Bottom
    rect(1397.5 - 810, 28, 2, 12, 20); // Right
    triangle(1383 - 810, 28, 1403-810, 28, 1393-810, 22.5); // Roof
    
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
    
    //1st button = total flights
    //2nd button = daily flights

    if (!showSearchResult) {
      fill(225);
      //rect(100, 100, 100, 20, 20);
      //rect(100, 125, 100, 20, 20);
      
      //int xButton1 = 300;
      //int yButton1 = 300;
      //int wButton1 = 300;
      //int hButton1 = 40;
      
      int xButton1 = 450;
      int yButton1 = 287;
      int wButton1 = 300;
      int hButton1 = 40;
      
      int xButton2 = 450;
      int yButton2 = 437;
      int wButton2 = 300;
      int hButton2 = 40;
      
      buttons[0] = new Button(xButton1, yButton1, wButton1, hButton1, "Total Flights");
      buttons[0].display();
      
      buttons[1] = new Button(xButton2, yButton2, wButton2, hButton2, "Daily Flights");
      buttons[1].display();
      
  //      if (mouseX >= 30 && mouseX <= 30 + 104 && mouseY >= 170 && mouseY <= 170 + 98 && !showStaticBarCharts) {
    
  //  println("Home button in static bar charts clicked!");
   
    
  //}
      
      if (mouseX >= xButton1 && mouseX <= xButton1 + wButton1 && mouseY >= yButton1 && mouseY <= yButton1 + hButton1 && mousePressed) {
        callGraphs = true;
        pageCount = 1;
      }
      
        if (mouseX >= xButton2 && mouseX <= xButton2 + wButton2 && 
      mouseY >= yButton2 && mouseY <= yButton2 + hButton2 && mousePressed) {
    // If clicked, do something
    println("Button 2 clicked!"); // Replace with your desired action
  }
      
      
      
      //rect(xButton1, yButton1, wButton1, hButton1);
      //fill(0);
      //textAlign(CENTER, CENTER);
      //textSize(28);
      //text("Total Flights", xButton1 + wButton1/2, yButton1 + hButton1/2);
            
      //if (mousePressed && mouseX > 100 && mouseY > 100 && mouseX < 200 && mouseY < 120) {
      
      //  callGraphs = true;
      //  pageCount = 1;
      //} else if (mousePressed && mouseX > 100 && mouseY > 125 && mouseX < 200 && mouseY < 145) {
      
      //  callGraphs = true;
      //  pageCount = 2;
      //} 
  
    if (mousePressed && mouseX > 560 && mouseY > 20 && mouseX < 610 && mouseY < 45) {
    
      callGraphs = false;
      pageCount = 0;
    }
  } else {
    callGraphs = true;
    pageCount = 3;
    
    if (mousePressed && mouseX > 1370 && mouseY > 20 && mouseX < 1420 && mouseY < 45) {
      callGraphs = false;
      pageCount = 0;
      }
  }
    if (callGraphs) {
      graphs.drawGraphs(tOF, tDF, flightsPD, pageCount, longestDiversions, routes, routeFlights, dailyFlights);
    }
  }
}
