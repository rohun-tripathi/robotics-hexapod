//Version 3.0  11th Jan,2012
//Made by Vikas Kumar Singh & Varun Bhatt

/*
One can use move() fuction to move any number of legs to any position in any amount of time.
You need to pass the position/positions, the leg number/numbers , and the time in form of string
to move a leg to the desired position.

Every point in space is defined for a leg in terms of Position.
for example:
    Position up;       //A position up is declared
    up.i = 0;          //It means the inner  servo needs to move by 0 degrees in 
                       //clockwise sense(when seen from above) to reach to position up
    up.m = 40;         //It means the middle servo needs to move by 40 degrees upwards to reach to position up
    up.o = -25;        //It means the outer servo needs to move by -25 degrees upwards to reach to position up
    
    
If you need to pass angles, first convert it ot position using the function 
p(inner_angle,middle_angle,outer_angle).
for example:
      move(p(20,-30,-25),5,4,"1000");    //It moves leg number 5 to Position (20,-30,-25) in 1000  milliseconds

Positions and leg numbers are needed to be given to move() function in a particular sequence.
Positions are given first followed by leg numbers, there can be more than one leg numbers,
need not to be written in any sequence following a position.
for example:
      move(up,5,2,4,"500");            //It moves leg numbers 2, leg number 4, leg number 5 to Position up in 0.5 seconds.  
      
You can give multiple Positions and multiple leg numbers conditionally number of legs to be moved to Position 1 must be
less than or equal to the number of legs to be moved to Position 2.
for example:
      move(up,6,4,mean,1,5,2,"2000"); //It moves leg numbers 6, leg number 4, to Position up simultaneously
                                      //with leg number 1, leg number 5, leg number 2 to Position mean(0,0,0) in 2 seconds.
     NOTICE that there are two leg numbers (6 & 4)(following Position up)
     LESS THAN (equal is also allowed) three leg numbers(1,2,5) following Position mean written after that.
     
     move(up,3,4,mean,1,"1000")    //ERROR
     move(mean,1,up,3,4,"1000")    //This is the right way of using move 
*/

/*
Here is a list of correct sequences you can use in move function
p represents Position and l represents leg number,2l for two leg numbers and so on

You need not to remember this sequence if you keep the above stated rules in mind.
  ----------------for one position------------
  p,l
  p,2l
  p,3l
  p,4l
  p,5l
  p,6l
  -----------------for two positions-----------
  p,l,p,l
  p,l,p,2l
  p,l,p,3l
  p,l,p,4l
  p,l,p,5l
  p,2l,p,2l
  p,2l,p,3l
  p,2l,p,4l
  p,3l,p,3l
  ----------------for three positions----------
  p,l,p,l,p,l
  p,l,p,l,p,2l
  p,l,p,l,p,3l
  p,l,p,l,p,4l
  p,l,p,2l,p,2l
  p,l,p,2l,p,3l
  p,2l,p,2l,p,2l
  -----------------for four positions-----------
  p,l,p,l,p,l,p,l
  p,l,p,l,p,l,p,2l
  p,l,p,l,p,l,p,3l
  p,l,p,l,p,2l,p,2l
  -----------------for five positions-----------
  p,l,p,l,p,l,p,l,p,l
  p,l,p,l,p,l,p,l,p,2l
  -----------------for six positions------------
  p,l,p,l,p,l,p,l,p,l,p,l
*/

void pickleg(int angle,int leg,int time)
{
  move(p(0,60,0),leg,String(time));
  delay(50);
  move(p(angle,40,0),leg,String(time));
  delay(50);
  move(p(angle,0,0),leg,String(3*time));
}


void slideleg(int i,int time)
{
  if (i==1)
  {move(p(0,60,0),1,4,"30");
  move(p(0,20,0),1,p(40,0,0),2,p(0,0,0),3,p(0,30,0),4,p(0,0,0),5,p(-40,0,0),6,String(time));}
  else if (i==2)
  {move(p(0,60,0),2,5,"30");
  move(p(0,30,0),2,p(40,0,0),3,p(0,0,0),4,p(0,30,0),5,p(0,0,0),6,p(-40,0,0),1,String(time));}
  else if (i==3)
  {move(p(0,60,0),3,6,"30");
  move(p(0,30,0),3,p(40,0,0),4,p(0,0,0),5,p(0,30,0),6,p(0,0,0),1,p(-40,0,0),2,String(time));}
  else if (i==4)
  {move(p(0,60,0),1,4,"30");
  move(p(0,30,0),4,p(40,0,0),5,p(0,0,0),6,p(0,30,0),1,p(0,0,0),2,p(-40,0,0),3,String(time));}
  else if (i==5)
  {move(p(0,60,0),2,5,"30");
  move(p(0,30,0),5,p(40,0,0),6,p(0,0,0),1,p(0,30,0),2,p(0,0,0),3,p(-40,0,0),4,String(time));}
  else if (i==6)
  {move(p(0,60,0),3,6,"30");
  move(p(0,30,0),6,p(40,0,0),1,p(0,0,0),2,p(0,30,0),3,p(0,0,0),4,p(-40,0,0),5,String(time));}
}


void walk(int i,int time)
{
  if (i==1)
  {
  pickleg(2,2,(time/2));
  pickleg(2,6,(time/2));
  pickleg(-40,3,(time/2));
  pickleg(40,5,(time/2));
  slideleg(1,time);
  move(p(0,0,0),1,4,"200");
  }
  
  else if (i==2)
  {
  pickleg(0,3,(time/2));
  pickleg(0,1,(time/2));
  pickleg(-40,4,(time/2));
  pickleg(40,6,(time/2));
  slideleg(2,time);
  move(p(0,0,0),2,5,"200");
  }
  
  else if (i==3)
  {
  pickleg(0,4,(time/2));
  pickleg(0,2,(time/2));
  pickleg(-40,5,(time/2));
  pickleg(40,1,(time/2));
  slideleg(3,time);
  move(p(0,0,0),3,6,"200");
  }
  
  else if (i==4)
  {
  pickleg(0,5,(time/2));
  pickleg(0,3,(time/2));
  pickleg(-40,6,(time/2));
  pickleg(40,2,(time/2));
  slideleg(4,time);
  move(p(0,0,0),4,1,"200");
  }
  
  else if (i==5)
  {pickleg(0,6,(time/2));
  pickleg(0,4,(time/2));
  pickleg(-40,1,(time/2));
  pickleg(40,3,(time/2));
  slideleg(5,time);
  move(p(0,0,0),5,2,"200");
  } 
  else if (i==6)
  {pickleg(0,1,(time/2));
  pickleg(0,5,(time/2));
  pickleg(-40,2,(time/2));
  pickleg(40,4,(time/2));
  slideleg(6,time);
  move(p(0,0,0),6,3,"200");
}}



void wave(int i,int time)
{
  move(p(40,30,30),i,i+2,i+4,String(time/4));
  move(p(0,60,60),i,i+2,i+4,String(time/4));
  move(p(-40,30,30),i,i+2,i+4,String(time/4));
  move(p(0,10,0),i,i+2,i+4,String(time/4));
  move(p(0,0,0),i,i+2,i+4,String(time/2));
}



void rotate3(int angle,int time)  //angle 45, time=600
{
  move(p(angle,0,0),1,2,3,4,5,6,String(int(1.5*time)));
  delay(300);
  move(p(0,30,0),1,3,5,String(time));
  move(p(0,0,0),1,3,5,String(time));  
  delay(300);
  move(p(0,30,0),2,4,6,String(time));
  move(p(0,0,0),2,4,6,String(time));
  delay(300);
}



void chiggywiggy(int angle,int time)  //time=5000,angle=10
{
  move(p(0,-10,-10),1,2,3,4,5,6,"500");
  for(int n=0;n<31;n+=3)
  {
    if(n%2==1)
    {
      move(p(angle,-10+n,-5),1,2,3,4,5,6,String(time/15));
    }
    else if(n%2==0)
    {
      move(p(-angle,-10+n,-5),1,2,3,4,5,6,String(time/15));
    }
  }
  move(p(0,-10,-10),1,2,3,4,5,6,"500");
}
      
      
 
void leg_tapping(int time)  //time=500
{
  move(p(0,25,60),1,3,5,String(time));
  delay(100);
  move(p(0,65,-50),1,3,5,String(time));
  delay(200);
  move(p(0,0,0),1,3,5,String((3/2)*time));
  delay(300);
  move(p(0,25,60),2,4,6,String(time));
  delay(100);
  move(p(0,65,-50),2,4,6,String(time));
  delay(200);
  move(p(0,0,0),2,4,6,String((3/2)*time));
  delay(300);  
}



void shooting_star(int time)
{
//  move(p(0,25,60),1,String(time));
  move(p(0,0,0),1,p(0,25,60),2,String(time));
  move(p(0,0,0),2,p(0,25,60),3,String(time));
  move(p(0,0,0),3,p(0,25,60),4,String(time));
  move(p(0,0,0),4,p(0,25,60),5,String(time));
  move(p(0,0,0),5,p(0,25,60),6,String(time));
}

void salute(int time)
{
  delay(1000);
  move(p(0,30,60),1,4,String(time));
  move(p(0,0,0),1,4,String(5*time));
  move(p(0,30,60),2,5,String(time));
  move(p(0,0,0),2,5,String(5*time));
  move(p(0,30,60),3,6,String(time));
  move(p(0,0,0),3,6,String(5*time));
  pickleg(45,6,500);
  pickleg(-45,3,500);
  move(p(0,25,60),1,2,"1000");
  move(p(20,55,60),1,p(-20,55,60),2,"500");
  move(p(40,55,60),1,p(20,55,60),2,"1000");
  move(p(-20,55,60),1,p(-40,55,60),2,"1000");
  move(p(40,55,60),1,p(20,55,60),2,"1000");
  move(p(-20,55,60),1,p(-40,55,60),2,"1000");
  move(p(40,55,60),1,p(20,55,60),2,"1000");
  move(p(-20,55,60),1,p(-40,55,60),2,"1000");
  move(p(0,0,0),1,2,"1000");
  delay(500);
  pickleg(1,6,500);
  pickleg(1,3,500);
  move(p(0,0,0),1,2,3,4,5,6,"500");
}
  
  void stand(int angle,int time)
{
  move(p(0,angle,0),1,String(time));
  move(p(0,0,0),1,String(time));
  move(p(0,angle,0),2,String(time));
  move(p(0,0,0),2,String(time));
  move(p(0,angle,0),3,String(time));
  move(p(0,0,0),3,String(time));
  move(p(0,angle,0),4,String(time));
  move(p(0,0,0),4,String(time));
  move(p(0,angle,0),5,String(time));
  move(p(0,0,0),5,String(time));
  move(p(0,angle,0),6,String(time));
  move(p(0,0,0),6,String(time));
}

void stand(int time)
{
  move(pk_lg,1,String(time));
  delay(50);
  move(mean,1,String(time));
  move(pk_lg,2,String(time));
  delay(50);
  move(mean,2,String(time));
  move(pk_lg,3,String(time));
  delay(50);
  move(mean,3,String(time));
  move(pk_lg,4,String(time));
  delay(50);
  move(mean,4,String(time));
  move(pk_lg,5,String(time));
  delay(50);
  move(mean,5,String(time));
  move(pk_lg,6,String(time));
  delay(50);
  move(mean,6,String(time));
}


void flying_machine(int i)
{
  move(p(0,90,-30),i,i+2,i+4,"1000");
  move(p(0,10,50),i,i+2,i+4,"500");
  move(p(0,90,-30),i,i+2,i+4,"500");
  move(p(0,10,50),i,i+2,i+4,"500");
  move(p(0,90,-30),i,i+2,i+4,"500");
  move(p(0,10,50),i,i+2,i+4,"500");
  move(p(0,90,-30),i,i+2,i+4,"500");
  move(p(0,10,50),i,i+2,i+4,"500");
  move(p(0,0,0),1,2,3,4,5,6,"500");
}


void yoyo(int i)
{
  move(p(0,65,50),i,i+2,i+4,"1000");
  move(p(40,65,50),i,i+2,i+4,"500");
  move(p(-40,65,50),i,i+2,i+4,"1000");
  move(p(40,65,50),i,i+2,i+4,"500");
  move(p(-40,65,50),i,i+2,i+4,"1000");
  move(p(0,65,50),i,i+2,i+4,"500");
  move(p(0,0,0),1,2,3,4,5,6,"500");
}


void pointer(int i)
{
  move(p(0,30,65),i,i+2,i+4,"1000");
  move(p(40,30,65),i,i+2,i+4,"500");
  move(p(-40,30,65),i,i+2,i+4,"1000");
  move(p(40,30,65),i,i+2,i+4,"1000");
  move(p(0,30,65),i,i+2,i+4,"500");
  move(p(0,0,0),1,2,3,4,5,6,"500");
}

void walk_steps(int i,int n,int time)  //                                  i is for leg num and n defines the num of steps
{
  for(int j=0;j<n;j++)
  {
    walk(i,time);
  }
  delay(500);
  stand(40,50);
}



void square(int angle)
{
  walk_steps(1,4,500);
  rotate3(angle,500);
  delay(500);
  stand(40,50);
  walk_steps(2,4,500);
  rotate3(angle,500);
  delay(500);
  stand(40,50);
  walk_steps(3,4,500);
  rotate3(angle,500);
  delay(500);
  stand(40,50);
  walk_steps(4,4,500);
  rotate3(angle,500);
  delay(500);
  stand(40,50);
}

  
void run()
{
   pointer(1);
   stand(40,300);
   delay(1000);
 
  leg_tapping(400);
  stand(40,300);
  delay(1000);
  
  walk_tripod(1,1000);
  walk_tripod(1,1000);
  walk_tripod(1,1000);
  walk_tripod(3,1000);
  walk_tripod(3,1000);
  walk_tripod(3,1000);
  walk_tripod(5,1000);
  walk_tripod(4,1000);
  walk_tripod(4,1000);
  stand(40,300);
  delay(1000);
  
  
          rotate3(30,500);
          rotate3(30,500);
  stand(40,300);
  salute(300);
  stand(30,300);
          rotate3(-30,500);
          rotate3(-30,500);
  stand(40,200);
  walk_steps(1,4,500);
  stand(40,300);
  delay(1000);
  
  flying_machine(1);
  flying_machine(2);
  walk_tripod(4,1000);
  walk_tripod(4,1000);
  walk_tripod(4,1000);
  walk_tripod(4,1000);
  stand(40,500);
  while(1);
}
