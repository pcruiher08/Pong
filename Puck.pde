  int diameter = 24;

class Puck {
  float x = width/2;
  float y = height/2;
  float xSpeed;
  float ySpeed;
  
  Puck(){
    restart();
  }
  
  void restart(){
    float angle = random(TWO_PI);
    xSpeed = 5 * cos(angle * PI / 180);
    ySpeed = 5 * sin(angle * PI / 180);
    x = width/2;
    y = height/2;
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
      rightScore++;
      restart();
    }
    if(x > width){
      leftScore++;
      restart();
    }
    
  }

  void show() {
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
}
