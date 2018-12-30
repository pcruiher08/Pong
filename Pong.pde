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
  puck.show();
  puck.update();
  puck.edges();
  rightPaddle.show();
  leftPaddle.show();
}
