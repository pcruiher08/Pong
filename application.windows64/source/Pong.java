import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Pong extends PApplet {



SoundFile ding;

Puck puck;
Paddle rightPaddle;
Paddle leftPaddle;
int rightScore = 0;
int leftScore = 0;
public void setup() {
  
  ding = new SoundFile(this, "ding.mp3");
  puck = new Puck();
  rightPaddle = new Paddle("Right");
  leftPaddle = new Paddle("Left");
}

public void draw() {
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

public void keyReleased(){
  leftPaddle.move(0);
  rightPaddle.move(0);
}

public void keyPressed(){
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
class Paddle{
  
  float x;
  float y = height/2;
  float w = 10;
  float h = height/3;
  float yChange = 0;
  
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
  
  public void update(){
    y += yChange; 
    y = constrain(y, h/2, height-h/2);
  }
  
  public void move(float steps){
    yChange = steps;
  }
  
  public void show(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
  int diameter = 24;

class Puck {
  float x = width/2;
  float y = height/2;
  float xSpeed;
  float ySpeed;
  
  Puck(){
    restart();
  }
  
  public void restart(){
    float angle = random(-PI / 4,PI / 4);
    xSpeed = 5 * cos(angle);
    ySpeed = 5 * sin(angle);
    if(random(1) < 0.5f){
      xSpeed*=-1;
    }
    x = width/2;
    y = height/2;
  }
  
  public void checkPaddle(Paddle p){
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
  
  public void update() {
    x += xSpeed;
    y += ySpeed;
  }
  
  public void edges(){
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

  public void show() {
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
}

  public void settings() {  size(600, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
