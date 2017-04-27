int randomNumber1;
int randomNumber2;
float pi;
float estimatedPi;
float probability;
int totalSizeOfDataSet;
int numberOfCofactors;
int lowerRangeForDataSet;
int upperRangeForDataSet;
int frameWidth;
int frameHeight;
int screenWidth;
int ScreenHeight;

void setup() {
  //Default Starting window size
  size(1600, 800);
  //Make the screen resizeable
  surface.setResizable(true);
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
  textSize(20);
  text("Amount Of Data",(width/8),100);
        //slider

       //slider range
         //title
  text("Range",(width/8),200);
         //slider

}
