void walk_tripod(int dir,int time)
{ 
//    move(p(0,20,-10) , 1 , 3, 5 , String(time/10));
//    move(n(walk_tripod_side_b) , 2 ,walk_tripod_side_b , 6 , walk_tripod_back_b , 4 , String(time/5));
//    move(walk_tripod_side_b , 3 , n(walk_tripod_side_b) , 5 , walk_tripod_back_b , 1 , String(time/5));
//    delay(100);
//    move(p(0,20,-10) , 2 , 4 , 6 , String(time/10));
//    move(mean , 1 , 3 , 5 , String(time/5));
//    move(mean , 2 , 4 , 6 , String(time/5));
//    delay(100);

    set_direction(dir);

    move(p(0,20,-10) , a[1] , a[3], a[5] , String(time/10));
    move(n(walk_tripod_side_b) , a[2] ,walk_tripod_side_b , a[6] , walk_tripod_back_b , a[4] , String(time/5));
    move(walk_tripod_side_b , a[3] , n(walk_tripod_side_b) , a[5], walk_tripod_back_b , a[1] , String(time/5));
    delay(100);
    move(p(0,20,-10) , a[2] , a[4] , a[6] , String(time/10));
    move(mean , a[1] , a[3] , a[5] , String(time/5));
    move(mean , a[2] , a[4] , a[6] , String(time/5));
    delay(100);
}

void flying_bird(int dir,int time)
{
//  set_direction(dir);
  move(p(0,20,20),a[1],a[5],p(0,-15,10),a[2],a[3],a[5],a[6],String(time/2));
  move(p(0,40,40),a[1],a[5],p(0,10,-5),a[2],a[3],a[5],a[6],String(time/2));
}

void stand_up()
{
 move(p(0,30,60),1,2,3,4,5,6,"1500");
 move(p(0,85,-45),1,2,3,4,5,6,"1500");
 move(p(0,0,10),1,2,3,4,5,6,"1800"); 
 move(p(0,-15,0) , 1,3,5,"1300");
 move(mean, 1,3,5,"1500");
 move(p(0,-15,0) , 2,4,6,"300");
 move(mean, 2,4,6,"500");
 move(mean,1,2,3,4,5,6,"200");
 
}

void interact()
{
  switch (Serial1.read())
  {
    case 'a':
      flying_machine(1);
    break;
  }
}  
