/*
   Estimates Pi based on the probibility that 2 random numbers will be coprime.
   For this I rearranged the formula x=6/pi^2 to pi=squrt(6/x) and x is number
   of coprimes/total amount of numbers (x=c/n). 
   My Info:
   dd/mm/yyyy  04/12/2017
   Made By Caleb McIvor
   Student ID 16945567
   https://github.com/Professor-RED
*/
//Global Variables
int randomNumber1;
int randomNumber2;
float pi = 3.141;
float estimatedPi;
float probability;
int totalSizeOfDataSet;
int lowerRangeForDataSet = 1;  //plans to make the range changeable in future
int upperRangeForDataSet = 10000;
int currentDataSetSize;
int buttonsWidth = (width/4)-50; //this is to help with making the GUI consistant
int halfButtonsWidth = buttonsWidth/2; //this is to help with dynamic sizing and positioning
int tableRowCount = 1;
int coprimeCounter = 0;
//initiate arrays for findPi() so they are global
int[] columnOne;
int[] columnTwo;
boolean[] isCoprime;
int viewableData = 0;
float accuracy;
//Initiate GUI elements so they are global, thank you to Quentin for this suggestion
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

//-----Setup-----
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
  //calculations for button positions
  buttonsWidth = (width/4)-50;
  halfButtonsWidth = buttonsWidth/2;
  
  //amaount of data slider
  SizeOfDataSet = MyButtons.addSlider("totalSizeOfDataSet")
    .setRange(100,1000000)
    .setPosition(((width/8)-halfButtonsWidth),120)
    .setSize(buttonsWidth,30)
    .setNumberOfTickMarks(10)
    .setSliderMode(Slider.FIX)
    .setCaptionLabel("");
  
  //run find pi button
  goButton = MyButtons.addButton("GO!")
    .setValue(0)
    .setPosition((width/32),250)
    .setSize(200,30);
}

//-----Main Loop-----
void draw() {
  //variables for formulas on middle screen
  String Probability = "x";
  String Coprimes = "Coprimes";
  String Total = "Total";
  
  //outside pannels background
  background(0);
  //white background in middle (draw a square)
  //draw from corner to corner with 2 coordinants
  rectMode(CORNERS);
  //white stroke to remove boarder of rect
  stroke(255);
  //white fill as background
  fill(255);
  //Squre to color the middle background white
  rect((width/4),0,((width/4)*3),height);
  
  buttonsWidth = (width/4)-50;
  halfButtonsWidth = buttonsWidth/2;
  
  //Seperate Parts of GUI
  //black stroke for seperator
  stroke(0);
  //Make line from top of the screen to bottom 1/4 in
  line((width/4),0,(width/4),height);
  //Make line from top of the screen to bottom 3/4 in
  line(((width/4)*3),0,((width/4)*3),height);
  
  //-----Left Pannel-----
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
  SizeOfDataSet
    .setPosition(((width/8)-halfButtonsWidth),120)
    .setSize(buttonsWidth,30);
  //go title
  text("GO!",(width/8),220);
  //button  
  goButton
    .setPosition(((width/8)-halfButtonsWidth),250)
    .setSize(buttonsWidth,30);
  //reset button
         
  //-----Right Pannel-----
  //Raw Data Display
  //Title text
  textSize(35);
  text("Raw Data",(width/8*7),50);

  //-----Middle screen-----
  textSize(50);
  fill(0);
  //print actual pi
  text("Pi = " + pi,(width/4)*2,70);
  //title (estimated pi)
  text("Estimated Pi",(width/4)*2,220);
  //print my estimated pi
  text(estimatedPi,(width/4)*2,270);
  //percentage of accuracy
  text("Percentage Accuracy",(width/4)*2,370);
  //only run if findPi() has run
  if (estimatedPi > 0){
    //calculate acuracy
    accuracy = 100 - abs((estimatedPi - pi)/((estimatedPi + pi)/2)*100);
    //display accuracy
    text(accuracy,(width/4)*2,420);
    //Set formula values to be that of the last findPi()
    Coprimes = str(coprimeCounter);
    Total = str(currentDataSetSize);
    Probability = str(float(coprimeCounter)/float(currentDataSetSize));
  }
  //display formula
  text("Formula",(width/4)*2,500);
  //smaller size
  textSize(20);
  //formula that adds values on first run
  text("Pi=" + "√(6/" + Probability + ")    " + "x=" + Coprimes + "/" + Total,(width/4)*2,550);


  //if go button press find pi
  if (goButton.isPressed()){
    FindPi();
  }
  
  //table
  //draw titles for table
  myTable.drawTitles();
  //reset table row counter
  tableRowCount = 2;
  //draw each row in loop
  for (int x=0; x < viewableData; x = x+1) {
    //draw table rows
    myTable.drawRow(str(columnOne[x]),str(columnTwo[x]),str(isCoprime[x]));
   }
}