var h1,v1,h2,v2;

h1=lengthdir_x(1,direction);
v1=lengthdir_y(1,direction);

h2=lengthdir_x(1,direction+90);
v2=lengthdir_y(1,direction+90);

i1.x=x-h1*21+h2*15;
i1.y=y-v1*21+v2*15;
i1.x2=x+h1*23+h2*15;
i1.y2=y+v1*23+v2*15;
i1.hspeed=hspeed;
i1.vspeed=vspeed;
with (i1)
    event_perform(ev_alarm,0);


drawsprite();
draw_sprite_ext(mytails,floor(tailsBlink),x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
