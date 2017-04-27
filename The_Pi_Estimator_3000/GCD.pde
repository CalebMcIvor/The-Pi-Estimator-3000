//Code to find the greatest common divisor of 2 nuumbers
int gcd(int a, int b){
  int gcd = 0;
  for(int i = 1; i <= a & i <= b; i = i + 1){
    // Checks if i is factor of both integers
    if(a%i==0 && b%i==0)
      gcd = i;
    }
  return gcd;
}