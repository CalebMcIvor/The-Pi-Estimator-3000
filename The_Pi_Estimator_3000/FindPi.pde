/*
  Code to estimate pi
  this is the core function on the program
*/
void findPi(){
  //-----Pull values from sliders-----
  currentDataSetSize = int(sizeOfDataSet.getValue()); //get data set size
  upperRangeForDataSet = int(upperRangeOfDataSet.getValue()); //get data upper range
  
  //-----reset arrays and counters-----
  coprimeCounter = 0;
  //make two arrays to compare; They are the size that is set in the slider.
  columnOne = new int[currentDataSetSize];
  columnTwo = new int[currentDataSetSize];
  isCoprime = new boolean[currentDataSetSize]; //array to save whether coprime or not
  
  //-----fill both arrays with random numbers in the set range-----
  for (int i = 0; i < currentDataSetSize; i = i+1) {
    //set the values to each place in the array to a ran number
    columnOne[i] = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    columnTwo[i] = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    
    //-----calculate if coprime (if GCD is 1 then numbers are coprime)-----
    if (gcd(columnOne[i], columnTwo[i]) == 1){
      isCoprime[i] = true; //set ture that both columns are coprime
      coprimeCounter += 1; //count the running total of coprimes
    }
    else {
      isCoprime[i] = false; //set false that both columns are coprime meaning it is a cofactor
    }
  }
  
  //-----Estimate pi-----
  //print raw results
  println("---------------------------------------------------");
  println("Process Complete");
  println("Total Coprimes: ",coprimeCounter);
  println("Total Data Set Size: ",currentDataSetSize);
  println("Upper Range Used", upperRangeForDataSet); 
  
  //find pi based on probability based on x=6/pi^2 where 'x' is probability
  float probability = float(coprimeCounter)/float(currentDataSetSize);
  estimatedPi = sqrt(6/probability);
  println("Estimated Pi: ", estimatedPi); //print result
  
  findPiRunning = false; //say process is finished
}