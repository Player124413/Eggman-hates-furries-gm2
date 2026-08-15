var h,v;
h=cos(degtorad(image_angle));
v=-sin(degtorad(image_angle));
draw_sprite_ext(sprFinalHatch,image_index,x+v*96,y-h*96,image_xscale,image_yscale,image_angle-hatch*20,image_blend,image_alpha);

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

px=x+v*96+h*32;
py=y-h*96+v*32;
if(i1!=-1)
{
i1.x=px;
i1.y=py;
i1.hspeed=hspeed;
i1.vspeed=vspeed;
i1.mi=image_angle-70;
while (i1.mi>=360)
    i1.mi-=360;
while (i1.mi<0)
    i1.mi+=360;
i1.ma=image_angle+20*(1-hatch);
while (i1.ma>=360)
    i1.ma-=360;
while (i1.ma<0)
    i1.ma+=360;
with i1
    event_perform(ev_alarm,0);
}
