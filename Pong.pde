Puck puck;
Paddle rightPaddle;
Paddle leftPaddle;

void setup() {
  size(600, 400);
  puck = new Puck();
  rightPaddle = new Paddle("Right");
  leftPaddle = new Paddle("Left");
}

void draw() {
  background(0);
  
  puck.checkPaddle(leftPaddle);
  puck.checkPaddle(rightPaddle);
  
  puck.show();
  puck.update();
  puck.edges();
  rightPaddle.show();
  leftPaddle.show();
}

void keyReleased(){
  leftPaddle.move(0);
  rightPaddle.move(0);
}

void keyPressed(){
  if(key == 'a'){
    leftPaddle.move(-10);
  }else if(key == 'z'){
    leftPaddle.move(10);
  }
  
  if(key == 'k'){
    rightPaddle.move(-10);
  }else if(key == 'm'){
    rightPaddle.move(10);
  }
  
}
