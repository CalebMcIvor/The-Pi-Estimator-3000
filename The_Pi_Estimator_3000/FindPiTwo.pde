/*
  This is a test function to see how accurate I could get
  Warnig it takes a while to run and to save time it 
  dosent print the table
*/
void FindPiTwo(){
  int a;
  int b;
  //get data set size
  currentDataSetSize = 2000000000;
  //reset arrays and counters
  coprimeCounter = 0;
  //fill both arrays with random numbers in the set range
  for (int i = 0; i < currentDataSetSize; i = i+1) {
    //set the values to each place in the array to a ran number
    a = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    b = int(random(lowerRangeForDataSet, upperRangeForDataSet));
    //calculate if coprime (if GCD is 1 then numbers are coprime)
    if (gcd(a, b) == 1){
      //set ture that both columns are coprime
      
      //count the running total of coprimes
      coprimeCounter += 1;
    }
    else {
      //set false that both columns are coprime meaning it is a cofactor
      
    }
  }
  //estimate pi so far, i is total so far, coprimeCounter is live coprime count
  println("Total Coprimes: ",coprimeCounter);
  println("Total Data Set Size: ",currentDataSetSize);
  estimatedPi = sqrt(6/float(coprimeCounter)/float(currentDataSetSize));
  
  //show it in a arty way
  
  println("Estimated Pi: ", estimatedPi);
}