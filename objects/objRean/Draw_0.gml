if(up>0)
    up-=global.time;
if(up<0)
    up+=global.time;
if(abs(up)<global.time)
    up=0;
if (up>0 && (sprite_index==sprReanFloat || sprite_index==sprReanDown))
    sprite_index=sprReanUp;
if (up<0 && (sprite_index==sprReanUp || sprite_index==sprReanFloat))
    sprite_index=sprReanDown;


if (up==0 && (sprite_index==sprReanUp || sprite_index==sprReanDown))
    sprite_index=sprReanFloat;

draw_ghost(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
h=cos(degtorad(image_angle+90));
v=-sin(degtorad(image_angle+90));
c=30+2*cos(timer*pi/30);
if(halo)
    draw_ghost(sprReanHalo,image_index,x+h*c,y+v*c,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
