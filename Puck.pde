  int diameter = 24;

class Puck {
  float x = width/2;
  float y = height/2;
  float xSpeed;
  float ySpeed;
  
  Puck(){
    xSpeed = 3;
    ySpeed = 1;
  }
  
  void checkPaddle(Paddle p){
    if(p.right){
      if(y < p.y + p.h/2 && y > p.y - p.h/2 && x + diameter/2 > p.x - p.w/2){
        xSpeed *= -1;
      }
    }
    
    if(p.left){
      if(y < p.y + p.h/2 && y > p.y - p.h/2 && x - diameter/2 < p.x + p.w/2){
        xSpeed *= -1;
      }
    }
  }
  
  void update() {
    x += xSpeed;
    y += ySpeed;
  }
  
  void edges(){
    if(y-diameter/2 < 0 || y+diameter/2 > height){
      ySpeed *= -1;
    }
    /*
    //FOR BOUNCES ONLY
    if(x-radius/2 < 0 || x+radius/2 > width){
      xSpeed *= -1;
    }
    */
    //for normal boundaries
    if(x < 0){
      x = width/2;
      y = height/2;
    }
    if(x > width){
      x = width/2;
      y = height/2;
    }
    
  }

  void show() {
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
}
