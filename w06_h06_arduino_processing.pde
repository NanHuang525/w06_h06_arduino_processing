import processing.serial.*;
import cc.arduino.*;
import org.firmata.*;

int diameter; 
int buttonPin = 2;
int buttonState = 0;
int state = 0;

Arduino arduino;

void setup(){
  size(600,600);
  background(129, 192, 255 );
  smooth();
  //frameRate(60);
  
  arduino = new Arduino(this, "/dev/cu.usbmodem1421",57600);
  arduino.pinMode(9,Arduino.OUTPUT);
  
  arduino.pinMode(2, Arduino.INPUT); 
  
  diameter = 1;
}



void draw(){
  //background(129,192,255);
  fill(129,192,255,10);
  rectMode(CORNER);
  rect(0,0,width,height);
  fill(255,random(60,180),random(60,180));
  noStroke();
  
  int a = arduino.digitalRead(2);
  delay(10);
  int b = arduino.digitalRead(2);
  
  if(a!=b&&b==0) state++;
  
  if(state%3==0) 
  ellipse(width/2,height/2,diameter, diameter); 
  else if(state%3==1){
    rectMode(CENTER);
    rect(width/2,height/2,diameter,diameter);
  }else if(state%3==2){
    triangle(width/2-diameter,height/2-diameter,width/2+diameter,height/2-diameter,width/2,height/2+diameter);
  }
  
 
  arduino.analogWrite(9,diameter);
  
} 

void mouseMoved(){
  diameter=diameter+1;
  
}
void mouseDragged(){
  diameter = diameter-1;
} 