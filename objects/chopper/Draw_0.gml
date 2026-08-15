draw_sprite(sprite_index,0,x,y);
if(life>0)
    {
    if (random(2)<1)
        {draw_sprite_ext(sprChopper1,blink,x+lengthdir_x(56,angle+90),y+lengthdir_y(56,angle+90),1.66,1,angle,c_white,0.75);
        draw_sprite_ext(sprChopper1,blink,x+lengthdir_x(64,angle+90),y+lengthdir_y(64,angle+90),1.66,1,angle,c_white,0.75);}
    if(blink==1)
        {draw_sprite_ext(sprChopper2,fourstage,x+lengthdir_x(56,angle+90),y+lengthdir_y(56,angle+90),1.66,1,angle,c_white,0.9);
        draw_sprite_ext(sprChopper2,4-fourstage,x+lengthdir_x(64,angle+90),y+lengthdir_y(64,angle+90),1.66,1,angle,c_white,0.9);}
    }


draw_sprite_ext(sprLauncher,0,x,y,1,1,launchdir,c_white,1);
