draw_set_color(c_black);
draw_rectangle(0,y,640,480,0);

a=(d+4)/amount;
ij=0;
while(ij<amount)
    {
    if(ij mod 2 == 0) k=c1; else k=c2;
    draw_sprite_ext(sprite_index,ij mod 5,x+ux*ij*a,y+uy*ij*a,1,1,0,k,1);
    ij+=1;    
    }


