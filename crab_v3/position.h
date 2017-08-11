Position walk_tripod_side_f;
Position walk_tripod_back_f;  
Position walk_tripod_side_b;
Position walk_tripod_back_b;
Position pk_lg;
Position up;

void initialize_position()
{
    up = p(0,40,-25);
    walk_tripod_side_f = p(-20,-10,10);
    walk_tripod_back_f = p(0,-10,10);
    walk_tripod_side_b = p(-20,-10,10);
    walk_tripod_back_b = p(0,-10,10);
    pk_lg = p(0,40,0);    
}
