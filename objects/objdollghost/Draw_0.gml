ok = 0;
var __b__;
__b__ = action_if(!instance_exists(objdoll));
if __b__
{
ok = 1;
}
else
{
var doll_parent = objdoll.p;
if (!instance_exists(doll_parent))
{
ok = 1;
}
else
{
__b__ = action_if(objdoll.blink || doll_parent.invulnerable==0);
if __b__
{
ok = 1;
}
}
}
__b__ = action_if(ok);
if __b__
{
var h,v,h2,v2;
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
h=cos(degtorad(image_angle));
v=-sin(degtorad(image_angle));
h2=-image_yscale*cos(degtorad(image_angle+90));
v2=image_yscale*sin(degtorad(image_angle+90));
draw_sprite_ext(sdollarm,0,x+14*h+2*h2,y+14*v+2*v2,1,image_yscale,image_angle+image_yscale*armrot,image_blend,image_alpha);
}
