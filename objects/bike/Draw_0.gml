var xx,yy,h,v;

h=lengthdir_x(1,dir);
v=lengthdir_y(1,dir);

xx=x+h*12;
yy=y+v*12;
dd=point_direction(i2.x,i2.y,xx,yy);
ll=point_distance(i2.x,i2.y,xx,yy);

draw_sprite_ext(sprBike4,0,i2.x,i2.y,ll/32,1,dd,c_white,1);

xx=x-h*8;
yy=y-v*8;
dd=point_direction(i1.x,i1.y,xx,yy);
ll=point_distance(i1.x,i1.y,xx,yy);

draw_sprite_ext(sprBike4,0,i1.x,i1.y,ll/32,1,dd,c_white,1);
    
draw_sprite_ext(sprBike1,floor(image_index),i1.x,i1.y,image_xscale,image_yscale,dir,image_blend,image_alpha);
draw_sprite_ext(sprBike2,floor(image_index),x,y,image_xscale,image_yscale,dir,image_blend,image_alpha);
if(mySonic)
    draw_sprite_ext(sprBike3,floor(sonicImg),x,y,image_xscale,image_yscale,dir,image_blend,image_alpha);

draw_set_blend_mode(bm_add);
if(boosting && blink)
    draw_sprite_ext(sprBikeBoost,floor(image_index),x,y,image_xscale,image_yscale,dir,image_blend,image_alpha);
if(boostgauge<1)
    boostgauge+=global.time/maxboost;
if(boostgauge<0)
    boostgauge=0;
draw_set_blend_mode(bm_normal);
