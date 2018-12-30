  int radius = 24;

class Puck {
  float x = width/2;
  float y = height/2;
  float xSpeed = 3;
  float ySpeed = 1;

  void update() {
    x += xSpeed;
    y += ySpeed;
  }
  
  void edges(){
    if(y-radius/2 < 0 || y+radius/2 > height){
      ySpeed *= -1;
    }
    /*
    if(x-radius/2 < 0 || x+radius/2 > width){
      xSpeed *= -1;
    }
    */
  }

  void show() {
    fill(255);
    ellipse(x, y, radius, radius);
  }
}
