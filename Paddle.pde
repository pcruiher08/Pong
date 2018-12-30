class Paddle{
  
  float x;
  float y = height/2;
  float w = 10;
  float h = height/3;
  
  boolean right = false;
  boolean left = false;
  
  Paddle(String s){
    if(s == "Right"){
      right = true;
      left = false;
      x = width - w;
    }else if(s == "Left"){
      right = false;
      left = true;
      x = w;
    }
  }
  
  void move(float steps){
    y+=steps;
    y = constrain(y, h/2, height-h/2);
  }
  
  void show(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
