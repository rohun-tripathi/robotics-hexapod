//Version 3.0  11th Jan,2012
//Made by Vikas Kumar Singh & Varun Bhatt

//The most central function for three angles and one leg, without time dependent functionality------------------------------------------------------------------------
void move(int inner_angle,int middle_angle,int outer_angle,int leg_number)
{
  leg[leg_number].i.writeMicroseconds( leg_mean[leg_number].i + ( inner_angle  * inner_servo_angle_ratio  * leg_direction[leg_number].i ) );
  leg[leg_number].m.writeMicroseconds( leg_mean[leg_number].m + ( middle_angle * middle_servo_angle_ratio * leg_direction[leg_number].m ) );
  leg[leg_number].o.writeMicroseconds( leg_mean[leg_number].o + ( outer_angle  * outer_servo_angle_ratio  * leg_direction[leg_number].o ) );
}

//The most central function for one position and oe leg, without time dependent functionality------------------------------------------------------------------------
void move(Position x,int leg_number)
{
  leg[leg_number].i.writeMicroseconds( leg_mean[leg_number].i + ( x.i * inner_servo_angle_ratio  * leg_direction[leg_number].i ) );
  leg[leg_number].m.writeMicroseconds( leg_mean[leg_number].m + ( x.m * middle_servo_angle_ratio * leg_direction[leg_number].m ) );
  leg[leg_number].o.writeMicroseconds( leg_mean[leg_number].o + ( x.o * outer_servo_angle_ratio  * leg_direction[leg_number].o ) );
}
//The most central function for three angles(in terms of microseconds) and one leg, without time dependent functionality----------------------------------------------
void move_ms(int inner_ms,int middle_ms,int outer_ms,int leg_number)
{
  leg[leg_number].i.writeMicroseconds( leg_mean[leg_number].i + ( inner_ms  * leg_direction[leg_number].i ) );
  leg[leg_number].m.writeMicroseconds( leg_mean[leg_number].m + ( middle_ms * leg_direction[leg_number].m ) );
  leg[leg_number].o.writeMicroseconds( leg_mean[leg_number].o + ( outer_ms  * leg_direction[leg_number].o ) );
}

//The most central core function with time functionality--------------------------------------------------------------------------------------------------------------

void move(Position x_1,int leg_number_1,Position x_2,int leg_number_2,Position x_3,int leg_number_3,Position x_4,int leg_number_4,Position x_5,int leg_number_5,Position x_6,int leg_number_6,String str,int count)
{
  char temp[6];    str.toCharArray(temp,6);
  Position x[7];
  int i=0,n=0,maximum=0,leg_number[7],leg_max[7];
  Position_float ratio[7];
  Position_float present[7];   
  
  leg_number[1] = leg_number_1;   //to store the legs performing the task
  leg_number[2] = leg_number_2;
  leg_number[3] = leg_number_3;
  leg_number[4] = leg_number_4;
  leg_number[5] = leg_number_5;
  leg_number[6] = leg_number_6;

  x[1] = angle_to_ms(x_1);    
  x[2] = angle_to_ms(x_2);    
  x[3] = angle_to_ms(x_3);  
  x[4] = angle_to_ms(x_4);    
  x[5] = angle_to_ms(x_5);    
  x[6] = angle_to_ms(x_6);  //positions corresponding to the legs array
  for( n = 1 ; n <= count; n ++ )
  {
    x[n].i = x[n].i - ms(leg_number[n],'i');   // x stores the angle to be covered by a servo
    x[n].m = x[n].m - ms(leg_number[n],'m');
    x[n].o = x[n].o - ms(leg_number[n],'o');
  }      

  for ( i = 1;i <= count ; i++)                                                      //calculting maximum of all the angles
    leg_max[i] = max(abs(x[i].i),max(abs(x[i].m),abs(x[i].o)));
  //    maximum=max(leg_max[1],max(leg_max[2],max(leg_max[3],max(leg_max[4],max(leg_max[5],leg_max[6])))));  

  for( i = 1;i <= count ; i++)
  {
    if (leg_max[i] > maximum)  maximum = leg_max[i]; 
  }  
  for( n = 1 ; n <= count ; n ++ )
  {   
    ratio[n].i = (float)x[n].i/(float)maximum;   // ratio of angles corresponding to the maximum angle to be moved in all the legs 
    ratio[n].m = (float)x[n].m/(float)maximum;
    ratio[n].o = (float)x[n].o/(float)maximum;

    present[n].i = ms(leg_number[n],'i');      // stores the present position of the leg 
    present[n].m = ms(leg_number[n],'m');
    present[n].o = ms(leg_number[n],'o');
  }  

  for(i = 1;i <= maximum; i += smooth_factor) //loop runs maximum(the so called variable) no. of time
  {
    for(n = 1 ; n <= count ; n++)                                                        // loop runs for each leg
    {
      move_ms(int(present[n].i),int(present[n].m),int(present[n].o),leg_number[n]); //
      present[n].i += smooth_factor*ratio[n].i;                                  //RUNS FOR all the given LEG (one leg at a time)
      present[n].m += smooth_factor*ratio[n].m;                                  //    
      present[n].o += smooth_factor*ratio[n].o;                                  //
    }
    delay(atoi(temp)*smooth_factor/maximum);
  }
}
//------------------------------------------------------------------------------------------------------------------------for one position

void move(Position x_1,int leg_number_1,String str)
{
  move(x_1, leg_number_1, mean, 2, mean , 3, mean ,4, mean, 5, mean,6, str, 1);
}
void move(Position x_1,int leg_number_1,int leg_number_2,String str)
{
  move(x_1, leg_number_1, x_1, leg_number_2, mean, 3, mean, 4, mean, 5, mean, 6, str, 2);
}
void move(Position x_1,int leg_number_1,int leg_number_2,int leg_number_3,String str)
{
  move(x_1, leg_number_1, x_1, leg_number_2, x_1, leg_number_3, mean, 4 , mean, 5, mean, 6, str, 3);
}
void move(Position x_1,int leg_number_1,int leg_number_2,int leg_number_3,int leg_number_4,String str)
{
  move(x_1, leg_number_1, x_1, leg_number_2, x_1, leg_number_3, x_1, leg_number_4, mean,5, mean ,6, str, 4);
}
void move(Position x_1,int leg_number_1,int leg_number_2,int leg_number_3,int leg_number_4,int leg_number_5,String str)
{
  move(x_1, leg_number_1, x_1, leg_number_2, x_1, leg_number_3, x_1, leg_number_4, x_1, leg_number_5, mean, 6, str, 5);
}
void move(Position x_1,int leg_number_1,int leg_number_2,int leg_number_3,int leg_number_4,int leg_number_5,int leg_number_6,String str)
{
  move(x_1, leg_number_1, x_1, leg_number_2, x_1, leg_number_3, x_1, leg_number_4, x_1, leg_number_5, x_1, leg_number_6, str,6);
}

//----------------------------------------------------------------------------------------------------------------------------for two position

void move(Position x_1,int leg_number_1,Position x_2,int leg_number_2,String str)
{
  move(x_1, leg_number_1, x_2, leg_number_2, mean, 3, mean, 4, mean, 5, mean, 6, str, 2);
}
void move(Position x1,int l1,Position x2,int l2,int l3,String str)
{
  move(x1, l1, x2, l2, x2 ,l3 , mean ,4, mean, 5, mean, 6, str, 3);
}  
void move(Position x1,int l1,Position x2,int l2,int l3,int l4,String str)
{
  move(x1, l1, x2, l2, x2 ,l3 , x2,l4, mean, 5, mean, 6, str, 4);
}  
void move(Position x1,int l1,Position x2,int l2,int l3,int l4,int l5,String str)
{
  move(x1, l1, x2, l2, x2 ,l3 , x2,l4, x2, 5, mean, 6, str, 5);
}  
void move(Position x1,int l1,Position x2,int l2,int l3,int l4, int l5, int l6, String str)
{
  move(x1, l1, x2, l2, x2 ,l3 , x2,l4, x2, 5, x2, 6, str, 6);
}  
void move(Position x1,int l1,int l2,Position x2,int l3,int l4,String str)
{
  move(x1, l1, x1, l2, x2,l3 , x2,l4, mean, 5, mean, 6, str, 4);
}
void move(Position x1,int l1,int l2,Position x2,int l3,int l4,int l5,String str)
{
  move(x1, l1, x1, l2, x2,l3 , x2,l4, x2, l5, mean, 6, str, 5);
}
void move(Position x1,int l1,int l2,Position x2,int l3,int l4,int l5,int l6,String str)
{
  move(x1, l1, x1, l2, x2,l3 , x2,l4, x2, l5, x2, 6, str, 6);
}
void move(Position x1,int l1,int l2,int l3,Position x2,int l4,int l5,int l6,String str)
{
  move(x1, l1, x1, l2, x1,l3 , x2,l4, x2, l5, x2, 6, str, 6);
}

//----------------------------------------------------------------------------------------------------------------------------for three position

void move(Position x_1,int leg_number_1,Position x_2,int leg_number_2,Position x_3,int leg_number_3,String str)
{
  move(x_1, leg_number_1, x_2, leg_number_2, x_3, leg_number_3, mean, 4 , mean, 5, mean, 6, str, 3);
}
void move(Position x1,int l1,Position x2,int l2,Position x3,int l3,int l4,String str)
{
  move(x1, l1, x2, l2, x3 ,l3 , x3 ,l4, mean, 5, mean, 6, str, 4);
}  
void move(Position x1,int l1,Position x2,int l2,Position x3,int l3,int l4,int l5,String str)
{
  move(x1, l1, x2, l2, x3 ,l3 , x3, l4, x3, l5, mean, 6, str, 5);
}  
void move(Position x1,int l1,Position x2,int l2,Position x3,int l3,int l4, int l5, int l6, String str)
{
  move(x1, l1, x2, l2, x3 ,l3 , x3,l4, x3, 5, x3, 6, str, 6);
}  
void move(Position x1,int l1,Position x2,int l2,int l3,Position x3,int l4,int l5, String str)
{
  move(x1, l1, x2, l2, x2,l3 , x3,l4, x3, l5, mean, 6, str, 5);
}
void move(Position x1,int l1,Position x2,int l2,int l3,Position x3,int l4,int l5,int l6,String str)
{
  move(x1, l1, x2, l2, x2,l3 , x3,l4, x3, l5, x3, 6, str, 6);
}
void move(Position x1,int l1,int l2,Position x2,int l3,int l4,Position x3,int l5,int l6,String str)
{
  move(x1, l1, x1, l2, x2,l3 , x2,l4, x3, l5, x3, 6, str, 6);
}

//----------------------------------------------------------------------------------------------------------------------------for four position

void move(Position x_1,int leg_number_1,Position x_2,int leg_number_2,Position x_3,int leg_number_3,Position x_4,int leg_number_4,String str)
{
  move(x_1, leg_number_1, x_2, leg_number_2, x_3, leg_number_3, x_4, leg_number_4, mean,5, mean ,6, str, 4);
}
void move(Position x1,int l1,Position x2,int l2,Position x3,int l3,Position x4,int l4,int l5,String str)
{
  move(x1, l1, x2, l2, x3 ,l3 , x4, l4, x4, l5, mean, 6, str, 5);
}  
void move(Position x1,int l1,Position x2,int l2,Position x3,int l3,Position x4,int l4, int l5, int l6, String str)
{
  move(x1, l1, x2, l2, x3 ,l3 , x4,l4, x4, 5, x4, 6, str, 6);
}  
void move(Position x1,int l1,Position x2,int l2,Position x3,int l3,int l4,Position x4,int l5,int l6,String str)
{
  move(x1, l1, x2, l2, x3,l3 , x3,l4, x4, l5, x4, 6, str, 6);
}

//----------------------------------------------------------------------------------------------------------------------------for five position

void move(Position x_1,int leg_number_1,Position x_2,int leg_number_2,Position x_3,int leg_number_3,Position x_4,int leg_number_4,Position x_5,int leg_number_5,String str)
{
  move(x_1, leg_number_1, x_2, leg_number_2, x_3, leg_number_3, x_4, leg_number_4, x_5, leg_number_5, mean, 6, str, 5);
}
void move(Position x1,int l1,Position x2,int l2,Position x3,int l3,Position x4,int l4, Position x5,int l5, int l6, String str)
{
  move(x1, l1, x2, l2, x3 ,l3 , x4,l4, x4, 5, x4, 6, str, 6);
}  

//----------------------------------------------------------------------------------------------------------------------------for six position

void move(Position x_1,int leg_number_1,Position x_2,int leg_number_2,Position x_3,int leg_number_3,Position x_4,int leg_number_4,Position x_5,int leg_number_5,Position x_6,int leg_number_6,String str)
{
  move(x_1, leg_number_1, x_2, leg_number_2, x_3, leg_number_3, x_4, leg_number_4, x_5, leg_number_5, x_6, leg_number_6, str,6);
}

//----------------------------------------------------------------------------------------------------------------------------flexibiity for three angles
void move(int inner_angle,int middle_angle,int outer_angle,int leg_number,String str)
{
  move( p(inner_angle,middle_angle,outer_angle), leg_number ,str);
}  

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, String str)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2, str);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3, String str)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2,leg_number_3, str);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4, String str)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2, leg_number_3, leg_number_4, str);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4, int leg_number_5,  String str)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2, leg_number_3, leg_number_4, leg_number_5, str);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4, int leg_number_5, int leg_number_6, String str)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2, leg_number_3, leg_number_4, leg_number_5, leg_number_6, str);
}

//-----------------------------------------------------------------------------------------------------------------------for one position without time
void move(Position x, int leg_number_1, int leg_number_2)
{
  move(x,leg_number_1);
  move(x,leg_number_2);
}

void move(Position x, int leg_number_1, int leg_number_2, int leg_number_3)
{
  move( x, leg_number_1);
  move( x, leg_number_2);
  move( x, leg_number_3);
}

void move(Position x, int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4)
{
  move( x, leg_number_1);
  move( x, leg_number_2);
  move( x, leg_number_3);
  move( x, leg_number_4);
}

void move(Position x, int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4, int leg_number_5)
{
  move( x, leg_number_1);
  move( x, leg_number_2);
  move( x, leg_number_3);
  move( x, leg_number_4);
  move( x, leg_number_5);
}

void move(Position x, int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4, int leg_number_5, int leg_number_6)
{
  move( x, leg_number_1);
  move( x, leg_number_2);
  move( x, leg_number_3);
  move( x, leg_number_4);
  move( x, leg_number_5);
  move( x, leg_number_6);
}

//---------------------------------------------------------------------------------------------------------------------for three angles without any time
void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2,leg_number_3);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2, leg_number_3, leg_number_4);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4, int leg_number_5)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2, leg_number_3, leg_number_4, leg_number_5);
}

void move(int inner_angle,int middle_angle,int outer_angle,int leg_number_1, int leg_number_2, int leg_number_3, int leg_number_4, int leg_number_5, int leg_number_6)
{
  move(  p(inner_angle,middle_angle,outer_angle), leg_number_1, leg_number_2, leg_number_3, leg_number_4, leg_number_5, leg_number_6);
}


