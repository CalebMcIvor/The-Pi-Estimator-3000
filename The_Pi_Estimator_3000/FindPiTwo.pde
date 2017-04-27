/*
  This is a test function to see how accurate I could get to true pi.
  WARNING! this takes a LONG time to run. In my test on a 16GB RAM, 2.6GHz i7 Processor laptop; it took a few hours
  and used 30% of processor and over 1GB of RAM, this test was with a data set size of 2000000000. To try a smaller number
  change the 'currentDataSetSize' variable value. The max value is 2000000000 due to memory issues and the maximum number 
  that can be stored in an int.
  Also to save time this function does not print the table due to the amount of processing needed or make arrays due to the amount of memory needed.
  It only counts the numbers that are coprime.
*/
void findPiTwo(){
  int a;
  int b;
  //custom data set size
  currentDataSetSize = 2000000000; //change this value to run a custom value max value is 2000000000
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