//Version 3.0  11rd Jan,2012
//Made by Vikas Kumar Singh & Varun Bhatt

int angle(int leg_number,char servo)
{
  switch(servo)
  {
    case 'i':
    case 'I':
      return leg_direction[leg_number].i*((leg[leg_number].i.readMicroseconds() - leg_mean[leg_number].i) / inner_servo_angle_ratio);
    break;  
    case 'm':
    case 'M':
      return leg_direction[leg_number].m*(leg[leg_number].m.readMicroseconds() - leg_mean[leg_number].m) / middle_servo_angle_ratio;
    break;  
    case 'o':
    case 'O':
      return leg_direction[leg_number].o*(leg[leg_number].o.readMicroseconds() - leg_mean[leg_number].o) / outer_servo_angle_ratio;
    break;      
  }
}

int ms(int leg_number,char servo)
{
  switch(servo)
  {
    case 'i':
    case 'I':
      return leg_direction[leg_number].i*(leg[leg_number].i.readMicroseconds() - leg_mean[leg_number].i );
    break;  
    case 'm':
    case 'M':
      return leg_direction[leg_number].m*(leg[leg_number].m.readMicroseconds() - leg_mean[leg_number].m );
    break;  
    case 'o':
    case 'O':
      return leg_direction[leg_number].o*(leg[leg_number].o.readMicroseconds() - leg_mean[leg_number].o ) ;
    break;      
  }
}

Position angle_to_ms( Position x )
{
  Position ms;
    ms.i = x.i * inner_servo_angle_ratio;
    ms.m = x.m * middle_servo_angle_ratio;
    ms.o = x.o * outer_servo_angle_ratio;
  return ms;
}  

Position p(int inner_angle,int middle_angle,int outer_angle)
{
  Position x;
    x.i = inner_angle;
    x.m = middle_angle;
    x.o = outer_angle;
  return x;
}

Position n(Position y)
{
  Position x;
    x = y;
    x.i = - x.i;
  return x;
}  
Position h(Position y)
{
  Position x;
    x = y;
    x.i = x.i / 2;
    x.m = (x.m / 2) + 20;
    x.o = (x.o / 2) - 20;
  return x;
}  

void set_direction(int direction)
{
  int i;
  for(i = 1 ; i <= 6 ; i++)
  {
    a[i] = ( ( i + ( direction - 2 ) ) % 6 ) + 1;
  }
}
