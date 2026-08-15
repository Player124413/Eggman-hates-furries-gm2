script_execute(drawsprite,0,0,0,0,0);

for(i=0; i<holes; i+=1)
    draw_sprite_ext(sprbulletholes,0,x+lengthdir_x(hx[i],image_angle)+lengthdir_x(hy[i],image_angle+90),y+lengthdir_y(hx[i],image_angle)+lengthdir_y(hy[i],image_angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if (mytails>-1)
    draw_sprite_ext(mytails,tailsBlink,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if(myson>-1)
    draw_sprite_ext(myson,sonimg,x+lengthdir_x(31,image_angle+90),y+lengthdir_y(31,image_angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
