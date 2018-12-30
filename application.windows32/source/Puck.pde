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
    float angle = random(-PI / 4,PI / 4);
    xSpeed = 5 * cos(angle);
    ySpeed = 5 * sin(angle);
    if(random(1) < 0.5){
      xSpeed*=-1;
    }
    x = width/2;
    y = height/2;
  }
  
  void checkPaddle(Paddle p){
    if(p.right){
      if(y < p.y + p.h/2 && y > p.y - p.h/2 && x + diameter/2 > p.x - p.w/2 && x < p.x){
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(255), radians(135));
        xSpeed = 5 * cos(angle);
        ySpeed = 5 * sin(angle);
        x = p.x - p.w/2 - diameter/2;
      }
    }
    
    if(p.left){
      if(y < p.y + p.h/2 && y > p.y - p.h/2 && x - diameter/2 < p.x + p.w/2 && x > p.x){
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xSpeed = 5 * cos(angle);
        ySpeed = 5 * sin(angle);
        x = p.x + p.w/2 + diameter/2;
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
    if(x + diameter/2 < 0){
      ding.play();
      rightScore++;
      restart();
    }
    if(x - diameter/2 > width){
      ding.play();
      leftScore++;
      restart();
    }
    
  }

  void show() {
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
}
