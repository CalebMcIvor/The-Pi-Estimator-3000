//The Amazing To Do List of Things To do:
//scale font size, either percent or an if stattement that checks screen width
//scale button and slider
int randomNumber1;
int randomNumber2;
float pi;
float estimatedPi;
float probability;
int totalSizeOfDataSet = 1000;
int numberOfCofactors;
int lowerRangeForDataSet = 1;
int upperRangeForDataSet = 200;
int currentDataSetSize;
int sliderWidth = (width/4)-50;
int halfSliderWidth = sliderWidth/2;
int tableRowCount = 1;
int coprimeCounter = 0;
int[] columnOne;
int[] columnTwo;
boolean[] isCoprime;
int viewableData = 0;
Button goButton;
Slider SizeOfDataSet;

//get width and height
import java.awt.Dimension;
//Sliders and buttons
import controlP5.*;
//define controller
ControlP5 MyButtons;
//generate table for raw data
table myTable;

//setup
void setup() {
  //Default Starting window size
  size(1100, 600);
  //Make the screen resizeable
  surface.setResizable(true);
  //Make window never be smaller than 1000x400
  
  //define slider class
  MyButtons = new ControlP5(this);
  //define my table function
  myTable = new table();
  //calculations for slider position
  sliderWidth = (width/4)-50;
  halfSliderWidth = sliderWidth/2;
  
  //amaount of data slider
  SizeOfDataSet = MyButtons.addSlider("totalSizeOfDataSet")
    .setRange(100,1000000)
    .setPosition(((width/8)-halfSliderWidth),120)
    .setSize(sliderWidth,30)
    .setNumberOfTickMarks(10)
    .setSliderMode(Slider.FIX)
    .setCaptionLabel("");
  
  //run find pi button
  goButton = MyButtons.addButton("GO!")
    .setValue(0)
    .setPosition((width/32),250)
    .setSize(200,30);
}


void draw() {
  //outside pannels background
  background(0);
  
  //white background in middle
    //draw from corner to corner with 2 coordinants
  rectMode(CORNERS);
    //white stroke to remove boarder of rect
  stroke(255);
    //white fill as background
  fill(255);
    //Squre to color the middle background white
  rect((width/4),0,((width/4)*3),height);
  
  //Seperate Parts of GUI
    //black stroke for seperator
  stroke(0);
    //Make line from top of the screen to bottom 1/4 in
  line((width/4),0,(width/4),height);
    //Make line from top of the screen to bottom 3/4 in
  line(((width/4)*3),0,((width/4)*3),height);
  
  //Left Pannel
    //Data Generator Settings
      //Title text
  fill(255);
  textSize(35);
  textAlign(CENTER);
  text("Data Generator",(width/8),50);
      //slider length
        //Title
  textSize(24);
  text("Amount Of Data",(width/8),100);
        //slider
    
      //slider range
        //title
  text("GO!",(width/8),200);
        //slider
         
         
         
  //Right Pannel
    //Raw Data Display
      //Title text
  textSize(35);
  text("Raw Data",(width/8*7),50);
  
  //draw titles
  myTable.drawTitles();
  
  //if button press find pi
  if (goButton.isPressed()){
    FindPi();
  }
  //reset table row counter
  tableRowCount = 2;
  for (int x=0; x < viewableData; x = x+1) {
    //table
    myTable.drawRow(str(columnOne[x]),str(columnTwo[x]),str(isCoprime[x]));
   }
}