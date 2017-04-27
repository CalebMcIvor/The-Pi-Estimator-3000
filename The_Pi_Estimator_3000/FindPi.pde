/*
  Code to estimate pi
  this is the core function on the program
*/
void findPi(){
  //get data set size
  currentDataSetSize = int(sizeOfDataSet.getValue());
  //get data upper range
  upperRangeForDataSet = int(upperRangeOfDataSet.getValue());
  
  //reset arrays and counters
  coprimeCounter = 0;
  //make two arrays to compare that are the size set in the slider
  columnOne = new int[currentDataSetSize];
  columnTwo = new int[currentDataSetSize];
  //array to save whether coprime or not
  isCoprime = new boolean[currentDataSetSize];
  //amount of table to show
  viewableData = 30;
  //fill both arrays with random numbers in the set range
  for (int i = 0; i < currentDataSetSize; i = i+1) {
    //set the values to each place in the array to a ran number
    columnOne[i] = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    columnTwo[i] = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    //calculate if coprime (if GCD is 1 then numbers are coprime)
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
  }
  //estimate pi
  //print raw results
  println("---------------------------------------------------");
  println("Process Complete");
  println("Total Coprimes: ",coprimeCounter);
  println("Total Data Set Size: ",currentDataSetSize);
  println("Upper Range Used", upperRangeForDataSet); 
  
  //find pi based on probability based on x=6/pi^2 where 'x' is probability
  float probability = float(coprimeCounter)/float(currentDataSetSize);
  estimatedPi = sqrt(6/probability);
  //print result
  println("Estimated Pi: ", estimatedPi);

  //say process is finished
  findPiRunning = false;
}