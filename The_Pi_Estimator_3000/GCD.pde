/*
  Code to find the greatest common divisor of 2 nuumbers.
  I based this off a C code made by Programiz
  link: https://www.programiz.com/c-programming/examples/hcf-gcd
*/
int gcd(int a, int b){
  int gcd = 0; //start at zero
  //itterate through multiples
  for(int i = 1; i <= a & i <= b; i = i + 1){
    // Checks if i is factor of both integers
    if(a%i==0 && b%i==0)
      gcd = i;
    }
  return gcd; //return result
}