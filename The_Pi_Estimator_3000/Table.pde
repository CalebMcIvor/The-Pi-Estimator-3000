/*
  My code to draw a three column table
  This generates a 3 column table with an add row function
*/
class table{
  /*
    Draws the titles of the table
  */
  void drawTitles(){
    //draw titles of columns
    fill(255); //white text
    textSize(10); //Font size
    textAlign(CENTER); //Make coordinate be from centre
    //Draw Text responsively to window size
    text("Random\nNumber One",(width/16)*13,100); //break screen into 16ths then place text on the 13th column
    text("Random\nNumber Two",(width/16)*14,100); //14th
    text("Is Coprime",(width/16)*15,100); //15th
  }
  /*
    Draws one row then moves y position down, ready for next row.
  */
  void drawRow(String one, String two, String three) {
    tableRowCount += 1; //counter to keep track of y position down
    //-----draw row-----
    fill(255); //white text
    textSize(10); //Font size
    textAlign(CENTER); //Make coordinate be from centre
    //Draw Text responsively to window size
    text(one,(width/16)*13,50*tableRowCount); //break screen into 16ths then place text on the 13th column
    text(two,(width/16)*14,50*tableRowCount); //14th
    text(three,(width/16)*15,50*tableRowCount); //15th
  }
}