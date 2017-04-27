/*
  My code to draw a table
  This generates a 3 column table with an add row function
*/
class table{
  void drawTitles(){
    //make table
    //this.Table = new Table();
    ////make table
    //this.Table.addColumn("Random Number One");
    //this.Table.addColumn("Random Number Two");
    //this.Table.addColumn("Is Coprime");
    //draw titles of columns
    //white
    fill(255);
    //Font size
    textSize(10);
    //Make coordinate be from 
    textAlign(CENTER);
    //Draw Text responsively to window size
    //break screen into 16ths then place text on the 13th column
    text("Random\nNumber One",(width/16)*13,100);
    //14th
    text("Random\nNumber Two",(width/16)*14,100);
    //15th
    text("Is Coprime",(width/16)*15,100);
  }
  void drawRow(String one, String two, String three) {
    //counter
    tableRowCount += 1;
    //draw row
    //draw titles of columns
    //white
    fill(255);
    //Font size
    textSize(10);
    //Make coordinate be from 
    textAlign(CENTER);
    //Draw Text responsively to window size
    //break screen into 16ths then place text on the 13th column
    text(one,(width/16)*13,50*tableRowCount);
    //14th
    text(two,(width/16)*14,50*tableRowCount);
    //15th
    text(three,(width/16)*15,50*tableRowCount);
  }
}