var h,v;
h=cos(degtorad(angle));
v=-sin(degtorad(angle));
x=doom.x+extend*h;
y=doom.y+extend*v;
draw_sprite_ext(sprDoomGun1,0,x,y,1,image_yscale,angle,image_blend,image_alpha);
draw_sprite_ext(sprite_index,image_index,x-lengthdir_x(retract*8,image_angle),y-lengthdir_y(retract*8,image_angle),1,image_yscale,image_angle,image_blend,image_alpha);

if (retract==1)
{
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprtinyboost,0,x,y,1,2,image_angle,image_blend,image_alpha);
draw_set_blend_mode(bm_normal);
}
if (retract>0)
    retract-=global.time/6;
