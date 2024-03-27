PImage background;
PFont titleText;

class StatePage {
  String state;
  String[] states = {
  "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", 
  "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", 
  "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
  "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", 
  "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", 
  "West Virginia", "Wisconsin", "Wyoming"
};

  StatePage(int stateNumber) {
    state = states[stateNumber];
    println("state is: " + state);
    background = loadImage("borderForStates.png");
    
    titleText = createFont("Roboto-Regular.ttf", 60);
    //background(0);
    textFont(titleText);
    //text("word", 48, 240);
    
  }
  
  void draw() {
    image(background, 174, 106);
    textFont(titleText);
    fill(255, 255, 255);
    text(state, 200, 200); 
    
    //println("state is: " + state);
  }
}
