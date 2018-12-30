import processing.sound.*;

SoundFile ding;

Puck puck;
Paddle rightPaddle;
Paddle leftPaddle;
int rightScore = 0;
int leftScore = 0;
void setup() {
  size(600, 400);
  ding = new SoundFile(this, "ding.mp3");
  puck = new Puck();
  rightPaddle = new Paddle("Right");
  leftPaddle = new Paddle("Left");
}

void draw() {
  background(0);
  
  puck.checkPaddle(leftPaddle);
  puck.checkPaddle(rightPaddle);
  

  puck.update();
  puck.edges();
  puck.show();
  
  rightPaddle.show();
  rightPaddle.update();
  leftPaddle.show();
  leftPaddle.update();
  
  fill(255);
  textSize(32);
  text(leftScore, 64, 40);
  text(rightScore, width-64, 40);
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
