/*
  Chage text size based on screen size
  Takes a multiplyer as input then scales
  depending on screen width. However, I
  didn't end up finishing or using it.
*/
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