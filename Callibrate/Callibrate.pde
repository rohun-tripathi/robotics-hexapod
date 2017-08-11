//Callibrate version 2.0  dated 9th Jan 2012
//Made by - Vikas Kumar Singh

#include <Servo.h>
#include "crabconfig.h"
#include "base.h"
int leg_number=1,i=1,print_mode = 1;
void initialize_base();
void setup() {
  // put your setup code here, to run once:
  initialize_base();
  Serial.begin(9600);
  Serial.println("Callibrate version 2.0");
  Serial.println("Made by - Vikas Kumar Singh \n");
  Serial.println("Press enter to begin");
  for(i=1;i<7;i++)
  {
    leg[i].i.writeMicroseconds(leg_mean[i].i);    leg_pwm[i].i = leg_mean[i].i;
    leg[i].m.writeMicroseconds(leg_mean[i].m);    leg_pwm[i].m = leg_mean[i].m;
    leg[i].o.writeMicroseconds(leg_mean[i].o);    leg_pwm[i].o = leg_mean[i].o;
  }
}

void loop() {
  // put your main code here, to run repeatedly: 
  if(Serial.available())
  {
    switch(Serial.read()) 
    {
    case ' ':
      Serial.print("\nEnter the leg number : ");
      while(!Serial.available());
      i = int(Serial.read() - 48);
      Serial.print(i);
      if(i >= 1 && i <= 6)  leg_number = i;
      Serial.println("\n");
    break;
    case '1':
      leg_pwm[leg_number].i -= leg_direction[leg_number].i*1;  
      leg[leg_number].i.writeMicroseconds(leg_pwm[leg_number].i);
    break;
    case '2':
      leg_pwm[leg_number].i += leg_direction[leg_number].i*1;  
      leg[leg_number].i.writeMicroseconds(leg_pwm[leg_number].i);
    break;
    case '4':
      leg_pwm[leg_number].m -= leg_direction[leg_number].m*1;  
      leg[leg_number].m.writeMicroseconds(leg_pwm[leg_number].m);
    break;
    case '5':
      leg_pwm[leg_number].m += leg_direction[leg_number].m*1;  
      leg[leg_number].m.writeMicroseconds(leg_pwm[leg_number].m);
    break;
    case '7':
      leg_pwm[leg_number].o -= leg_direction[leg_number].o*1;  
      leg[leg_number].o.writeMicroseconds(leg_pwm[leg_number].o);
    break;
    case '8':
      leg_pwm[leg_number].o += leg_direction[leg_number].o*1;  
      leg[leg_number].o.writeMicroseconds(leg_pwm[leg_number].o);
    break;

    case ',':
      leg_pwm[leg_number].i -= leg_direction[leg_number].i*10;  
      leg[leg_number].i.writeMicroseconds(leg_pwm[leg_number].i);
    break;
    case '.':
      leg_pwm[leg_number].i += leg_direction[leg_number].i*10;  
      leg[leg_number].i.writeMicroseconds(leg_pwm[leg_number].i);
    break;
    case 'l':
      leg_pwm[leg_number].m -= leg_direction[leg_number].m*10;  
      leg[leg_number].m.writeMicroseconds(leg_pwm[leg_number].m);
    break;
    case ';':
      leg_pwm[leg_number].m += leg_direction[leg_number].m*10;  
      leg[leg_number].m.writeMicroseconds(leg_pwm[leg_number].m);
    break;
    case 'o':
      leg_pwm[leg_number].o -= leg_direction[leg_number].o*10;  
      leg[leg_number].o.writeMicroseconds(leg_pwm[leg_number].o);
    break;
    case 'p':
      leg_pwm[leg_number].o += leg_direction[leg_number].o*10;  
      leg[leg_number].o.writeMicroseconds(leg_pwm[leg_number].o);
    break;

    case 'x':
      if(leg_number < 6)        leg_number ++;
    break;
    case 'z':
      if(leg_number > 1)        leg_number --;
    break;
    case 'a':
       print_mode = !print_mode;
    break;

    case '0':
      for(i=1;i<7;i++)
      {
        Serial.print("\n#define leg_"); Serial.print(i); Serial.print("_inner_mean \t");  Serial.println(leg_pwm[i].i); 
        Serial.print("#define leg_");   Serial.print(i); Serial.print("_middle_mean \t"); Serial.println(leg_pwm[i].m); 
        Serial.print("#define leg_");   Serial.print(i); Serial.print("_outer_mean \t");  Serial.println(leg_pwm[i].o);
      }
      Serial.print("\n"); 
    break;
    }
    if(print_mode)
    {
      Serial.print( ( leg_pwm[leg_number].i - leg_mean[leg_number].i )*leg_direction[leg_number].i / inner_servo_angle_ratio ); Serial.print("\t");
      Serial.print( ( leg_pwm[leg_number].m - leg_mean[leg_number].m )*leg_direction[leg_number].m / middle_servo_angle_ratio ); Serial.print("\t");
      Serial.print( ( leg_pwm[leg_number].o - leg_mean[leg_number].o )*leg_direction[leg_number].o / outer_servo_angle_ratio ); Serial.print("\t\t\t");
      Serial.println(leg_number);
    } 
    else 
    {
      Serial.print(leg_pwm[leg_number].i); Serial.print("\t");
      Serial.print(leg_pwm[leg_number].m); Serial.print("\t");
      Serial.print(leg_pwm[leg_number].o); Serial.print("\t\t\t");
      Serial.println(leg_number);
    }  
  }
}


