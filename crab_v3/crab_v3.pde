//Version 3.0  11rd Jan,2012
//Made by Vikas Kumar Singh & Varun Bhatt

//For help open step.h and read the instructions
#include <Servo.h>
#include "crabconfig.h"
#include "crabbase.h" 
int count;

void setup() {
  // put your setup code here, to run once:
  initialize_base();
  Serial.begin(9600);
  move(mean,1,2,3,4,5,6);
}

void loop() 
{ 
 delay(7000);
 run();
}
