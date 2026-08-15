draw_set_color(c_black);
draw_rectangle(x,y,x2,y+deep,0);
ij=x;
lol=0;
while(ij<=x2)
    {
    if(lol) k=c1; else k=c2;
    draw_sprite_ext(sprite_index,ij mod 5,ij,y,1,1,0,k,1);
    ij+=16;    
    lol=!lol
    }


