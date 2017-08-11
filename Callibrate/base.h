//Version 2.0  10th Jan,2012
//Made by Vikas Kumar Singh
typedef struct Three
{
  Servo i;
  Servo m;
  Servo o;
}Three;

typedef struct Position
{
  int i;
  int m;
  int o;
}Position;

Three leg[7];
Position leg_mean[7];
Position leg_direction[7];
Position leg_pwm[7];

void initialize_base()
{

  leg[1].i.attach(leg_1_inner);
  leg[1].m.attach(leg_1_middle);
  leg[1].o.attach(leg_1_outer);
  
  leg[2].i.attach(leg_2_inner);
  leg[2].m.attach(leg_2_middle);
  leg[2].o.attach(leg_2_outer);
  
  leg[3].i.attach(leg_3_inner);
  leg[3].m.attach(leg_3_middle);
  leg[3].o.attach(leg_3_outer);
  
  leg[4].i.attach(leg_4_inner);
  leg[4].m.attach(leg_4_middle);
  leg[4].o.attach(leg_4_outer);
  
  leg[5].i.attach(leg_5_inner);
  leg[5].m.attach(leg_5_middle);
  leg[5].o.attach(leg_5_outer);
  
  leg[6].i.attach(leg_6_inner);
  leg[6].m.attach(leg_6_middle);
  leg[6].o.attach(leg_6_outer);
    
  leg_mean[1].i = leg_1_inner_mean  + (leg_1_inner_direction  * inner_servo_angle_ratio  * inner_mean_shift);
  leg_mean[1].m = leg_1_middle_mean + (leg_1_middle_direction * middle_servo_angle_ratio * middle_mean_shift);
  leg_mean[1].o = leg_1_outer_mean  + (leg_1_outer_direction  * outer_servo_angle_ratio  * outer_mean_shift);
  
  leg_mean[2].i = leg_2_inner_mean  + (leg_2_inner_direction  * inner_servo_angle_ratio  * inner_mean_shift);
  leg_mean[2].m = leg_2_middle_mean + (leg_2_middle_direction * middle_servo_angle_ratio * middle_mean_shift);
  leg_mean[2].o = leg_2_outer_mean  + (leg_2_outer_direction  * outer_servo_angle_ratio  * outer_mean_shift);
  
  leg_mean[3].i = leg_3_inner_mean  + (leg_3_inner_direction  * inner_servo_angle_ratio  * inner_mean_shift);
  leg_mean[3].m = leg_3_middle_mean + (leg_3_middle_direction * middle_servo_angle_ratio * middle_mean_shift);
  leg_mean[3].o = leg_3_outer_mean  + (leg_3_outer_direction  * outer_servo_angle_ratio  * outer_mean_shift);
  
  leg_mean[4].i = leg_4_inner_mean  + (leg_4_inner_direction  * inner_servo_angle_ratio  * inner_mean_shift);
  leg_mean[4].m = leg_4_middle_mean + (leg_4_middle_direction * middle_servo_angle_ratio * middle_mean_shift);
  leg_mean[4].o = leg_4_outer_mean  + (leg_4_outer_direction  * outer_servo_angle_ratio  * outer_mean_shift);
  
  leg_mean[5].i = leg_5_inner_mean  + (leg_5_inner_direction  * inner_servo_angle_ratio  * inner_mean_shift);
  leg_mean[5].m = leg_5_middle_mean + (leg_5_middle_direction * middle_servo_angle_ratio * middle_mean_shift);
  leg_mean[5].o = leg_5_outer_mean  + (leg_5_outer_direction  * outer_servo_angle_ratio  * outer_mean_shift);
  
  leg_mean[6].i = leg_6_inner_mean  + (leg_6_inner_direction  * inner_servo_angle_ratio  * inner_mean_shift);
  leg_mean[6].m = leg_6_middle_mean + (leg_6_middle_direction * middle_servo_angle_ratio * middle_mean_shift);
  leg_mean[6].o = leg_6_outer_mean  + (leg_6_outer_direction  * outer_servo_angle_ratio  * outer_mean_shift);

  leg_direction[1].i = leg_1_inner_direction;
  leg_direction[1].m = leg_1_middle_direction;
  leg_direction[1].o = leg_1_outer_direction;

  leg_direction[2].i = leg_2_inner_direction;
  leg_direction[2].m = leg_2_middle_direction;
  leg_direction[2].o = leg_2_outer_direction;

  leg_direction[3].i = leg_3_inner_direction;
  leg_direction[3].m = leg_3_middle_direction;
  leg_direction[3].o = leg_3_outer_direction;

  leg_direction[4].i = leg_4_inner_direction;
  leg_direction[4].m = leg_4_middle_direction;
  leg_direction[4].o = leg_4_outer_direction;

  leg_direction[5].i = leg_5_inner_direction;
  leg_direction[5].m = leg_5_middle_direction;
  leg_direction[5].o = leg_5_outer_direction;

  leg_direction[6].i = leg_6_inner_direction;
  leg_direction[6].m = leg_6_middle_direction;
  leg_direction[6].o = leg_6_outer_direction;
}

