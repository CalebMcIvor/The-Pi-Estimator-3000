//The Amazing To Do List of Things To do:
//scale font size, either percent or an if stattement that checks screen width
//Make sliders for data settings
int randomNumber1;
int randomNumber2;
float pi;
float estimatedPi;
float probability;
int totalSizeOfDataSet = 1000;
int numberOfCofactors;
int lowerRangeForDataSet = 1;
int upperRangeForDataSet = 200;
int sliderWidth = (width/4)-50;
int halfSliderWidth = sliderWidth/2;

//get width and height
import java.awt.Dimension;
//Sliders and buttons
import controlP5.*;
//define controller
ControlP5 MyButtons;
//generate table for raw data


//setup
void setup() {
  //Default Starting window size
  size(1100, 600);
  //Make the screen resizeable
  surface.setResizable(true);
  //Make window never be smaller than 1000x400

  //define slider class
  MyButtons = new ControlP5(this);
  //calculations for slider position
  sliderWidth = (width/4)-50;
  halfSliderWidth = sliderWidth/2;

  //amaount of data slider
  Slider SizeOfDataSet = MyButtons.addSlider("totalSizeOfDataSet")
    .setRange(100,1000000)
    .setPosition(((width/8)-halfSliderWidth),120)
    .setSize(sliderWidth,30)
    .setNumberOfTickMarks(10)
    .setSliderMode(Slider.FIX)
    .setCaptionLabel("");

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
  text("Range",(width/8),200);
        //slider



  //Right Pannel
    //Raw Data Display
      //Title text
  textSize(35);
  text("Raw Data",(width/8*7),50);
}


void FindPi(){
  int coprimeCounter = 0;
  //make two arrays to compare that are the size set in the slider
  int[] columnOne = new int[int(MyButtons.getValue("totalSizeOfDataSet"))];
  int[] columnTwo = new int[int(MyButtons.getValue("totalSizeOfDataSet"))];
  //array to save whether coprime or not
  boolean[] isCoprime = new boolean[int(MyButtons.getValue("totalSizeOfDataSet"))];
  //fill both arrays with random numbers in the set range
  for (int i = 0; i < int(MyButtons.getValue("totalSizeOfDataSet")); i = i+1) {
    //set the values to each place in the array to a ran number
    columnOne[i] = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    columnTwo[i] = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    //calculate if coprime
    if (gcd(columnOne[i], columnTwo[i]) == 1){
      //set ture that both columns are coprime
      isCoprime[i] = true;
      //count the running total of coprimes
      coprimeCounter += 1;
    }
    else {
      //set false that both columns are coprime meaning it is a cofactor
      isCoprime[i] = false;
    }
    //display numbers on table

    //estimate pi so far

    //show it in a arty way

  }

}


int gcd(int a, int b){
  int gcd = 0;
  for(int i = 1; i <= a & i <= b; i = i + 1){
    // Checks if i is factor of both integers
    if(a%i==0 && b%i==0)
      gcd = i;
    }
  return gcd;
}

class threeColumnTable{
  int xpos, ypos, tableWidth;
  this.table = new Table();
  //make table
  this.table.addColumn("Random Number One");
  this.table.addColumn("Random Number Two");
  this.table.addColumn("Is Coprime");
  //draw titles of columns

  newrow(string , string, string) {
    //add row to table

    //draw row

  }
}

int dynamicTextSize(int multiplyer){
  int text = multiplyer * 5;
  int size;
  if(width>=1100){
    return int((55/30)*text);
  }
  else if(width<1100){
    return int(text);
  }
  else{
    return multiplyer * 4;
  }
}
