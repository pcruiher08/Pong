class Puck {
  float x = width/2;
  float y = height/2;
  float xSpeed = 32;
  float ySpeed = 12;

  void update() {
    x += xSpeed;
    y += ySpeed;
  }
  
  void edges(){
    if(y < 0 || y > height){
      ySpeed *= -1;
    }
    if(x < 0 || x > width){
      xSpeed *= -1;
    }
  }

  void show() {
    fill(255);
    ellipse(x, y, 24, 24);
  }
}
