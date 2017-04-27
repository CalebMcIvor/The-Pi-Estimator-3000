/*
   Estimates Pi based on the probibility that 2 random numbers will be coprime.
   For this I rearranged the formula x=6/pi^2 to pi=squrt(6/x) and x is number
   of coprimes/total amount of numbers (x=c/n). 
   I found the best results with a data size of 444500 and upper range of 22300. 
   This takes me about 15 secounds to run with the above values.
   Version Completed 04/12/2017 (dd/mm/yyyy)
   My Info:
   Made By Caleb McIvor
   Student ID 16945567
   https://github.com/Professor-RED
*/
//-----Global Variables-----
//Final calculation results
float estimatedPi;
float probability;
float accuracy;
//data set range and size
int totalsizeOfDataSet;
int lowerRangeForDataSet = 0;
int upperRangeForDataSet;
int currentDataSetSize;
//GUI Values
int buttonsWidth = (width/4)-50; //this is to help with making the GUI consistant
int halfButtonsWidth = buttonsWidth/2; //this is to help with dynamic sizing and positioning
int tableRowCount = 1;
//Values for estimating Pi (For use in calculation)
int coprimeCounter;
//initiate arrays for findPi() so they are global
int[] columnOne;
int[] columnTwo;
boolean[] isCoprime;
//Initiate GUI elements so they are global, thank you to Quentin for this suggestion
Slider sizeOfDataSet;
Slider upperRangeOfDataSet;
Button goButton;
Button resetButton;
//Variable defaults for formulas on middle screen
String Probability = "x";
String Coprimes = "Coprimes";
String Total = "Total";
//Other Global Variables
int viewableData = 30; //Number of table entries to show
boolean findPiRunning = false; //to stop one button press accidently running multiple findPi()'s

//-----Import Libarys-----
//get width and height
import java.awt.Dimension;
//Sliders and buttons
import controlP5.*;

//-----Define Classes-----
//define controller
ControlP5 MyButtons;
//generate table for raw data
table myTable;

//-----Setup-----
void setup() {
  //Setup Screen
  size(1100, 600); //Default Starting window size
  surface.setResizable(true); //Make the screen resizeable
  
  MyButtons = new ControlP5(this); //Define GUI class
  myTable = new table(); //define my table function
  
  //Calculations for button positions
  buttonsWidth = (width/4)-50;
  halfButtonsWidth = buttonsWidth/2;
  
  //amaount of data slider
  sizeOfDataSet = MyButtons.addSlider("totalsizeOfDataSet")
    .setRange(100,1000000)
    .setPosition(((width/8)-halfButtonsWidth),120)
    .setSize(buttonsWidth,30)
    .setNumberOfTickMarks(10)
    .setSliderMode(Slider.FIX)
    .setCaptionLabel("");
    
  //upper range of data set slider
  upperRangeOfDataSet = MyButtons.addSlider("upperRangeOfDataSet")
    .setRange(100,100000)
    .setPosition(((width/8)-halfButtonsWidth),170)
    .setSize(buttonsWidth,30)
    .setNumberOfTickMarks(10)
    .setSliderMode(Slider.FIX)
    .setCaptionLabel("");
  
  //find pi button config
  goButton = MyButtons.addButton("Estimate Pi")
    .setValue(0)
    .setPosition((width/32),250)
    .setSize(200,30);
    
  //reset button config
  resetButton = MyButtons.addButton("Reset")
    .setValue(0)
    .setPosition((width/32),300)
    .setSize(200,30);
}

//-----Main Loop-----
void draw() {
  float pi = 3.141592; //The value of Pi to display and use to calculate accuracy
  //outside pannels background
  background(0); //set background to black
  //white background in middle (draw a square)
  rectMode(CORNERS); //draw from corner to corner with 2 coordinants
  stroke(255); //white stroke to remove boarder of rect
  fill(255); //white fill as background
  rect((width/4),0,((width/4)*3),height); //Squre to color the middle background white
  
  //make buttons responsive
  buttonsWidth = (width/4)-50; //make the button 50px less than the size of each partition leaving 25px spacing
  halfButtonsWidth = buttonsWidth/2; //half the width to find the centre of the objects
  
  //Seperate Parts of GUI
  stroke(0); //black stroke for seperator
  line((width/4),0,(width/4),height); //Make line from top of the screen to bottom 1/4 in
  line(((width/4)*3),0,((width/4)*3),height); //Make line from top of the screen to bottom 3/4 in
  
  //-----Left Pannel-----
  //Data Generator Settings
  //Title text
  fill(255); //white text
  textSize(35); 
  textAlign(CENTER);
  text("Data Generator",(width/8),50); //print text to screen, centering it in the 1st partition (width/8) and 50px down
  //Amount Of Data
  textSize(24);
  text("Amount Of Data",(width/8),100); //print text to screen, centering it in the 1st partition (width/8) and 100px down
  //size of data set slider
  sizeOfDataSet
    //dynamically resize and reposition with window size
    .setPosition(((width/8)-halfButtonsWidth),120)
    .setSize(buttonsWidth,30);
  //upper range title
  text("Upper Range Of Data",(width/8),200);
  //upper range slider
  upperRangeOfDataSet
    //dynamically resize and reposition with window size
    .setPosition(((width/8)-halfButtonsWidth),220)
    .setSize(buttonsWidth,30);
  //Controls title
  text("Controls",(width/8),320);
  //button to run the calculation function findPi() 
  goButton
    //dynamically resize and reposition with window size
    .setPosition(((width/8)-halfButtonsWidth),350)
    .setSize(buttonsWidth,30);
  //reset button
  resetButton
    //dynamically resize and reposition with window size
    .setPosition(((width/8)-halfButtonsWidth),400)
    .setSize(buttonsWidth,30);
         
  //-----Right Pannel-----
  //Raw Data Display
  //Title text
  textSize(35);
  text("Raw Data",(width/8*7),50);

  //-----Middle screen-----
  textSize(50);
  fill(0); //black text
  text("Pi = " + pi,(width/4)*2,70); //print actual pi
  text("Estimated Pi",(width/4)*2,220); //title (estimated pi)
  text(estimatedPi + "",(width/4)*2,270); //print my estimated pi
  text("Percentage Accuracy",(width/4)*2,370); //percentage of accuracy title
  //display formula
  text("Formula",(width/4)*2,500); 
  textSize(20); //smaller size
  text("Pi=" + "√(6/" + Probability + ")    " + "x=" + Coprimes + "/" + Total,(width/4)*2,550); //formula that adds values as text on first run

  //if go button is pressed find pi
  if (goButton.isPressed()){
    findPi(); //the calculation function
    findPiRunning = true; //Set that the calculaton is running to prevent multiple runs at the same time
  }
  
  //if reset button pressed reset values to default
  if (resetButton.isPressed()){
    estimatedPi = 0; //reset estimated pi so the formula Refresher stops running
    //display variables for formulas on middle screen
    Probability = "x";
    Coprimes = "Coprimes";
    Total = "Total";
  }
  
  //Refresher (only run if findPi() has run)
  if (estimatedPi > 0){
    //Accuracy
    accuracy = 100 - abs((estimatedPi - pi)/((estimatedPi + pi)/2)*100); //calculate acuracy
    text(accuracy + "%",(width/4)*2,420); //display accuracy
    
    //Set formula values to be that of the last findPi()
    Coprimes = str(coprimeCounter);
    Total = str(currentDataSetSize);
    Probability = str(float(coprimeCounter)/float(currentDataSetSize));
    
    //table
    //only draw table if findPi() has run
    myTable.drawTitles(); //draw titles for table
    tableRowCount = 2; //reset table row counter (it is 2 to account for the titles)
    //draw each row in loop
    for (int x=0; x < viewableData; x = x+1) {
      myTable.drawRow(str(columnOne[x]),str(columnTwo[x]),str(isCoprime[x])); //draw table rows
     }
  }
}