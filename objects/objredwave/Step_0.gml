action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index += -image_speed*(1-global.time);
image_yscale += -sign(image_yscale)*global.time/30;
var __b__;
__b__ = action_if(abs(image_yscale)<=0.1);
if __b__
{
action_kill_object();
}
__b__ = action_if(point_distance(x+hspeed*global.time,y+vspeed*global.time,sonic.x,sonic.y)<radius+sonic.radius);
if __b__
{
sonic.damagex=x;
sonic.damagey=y;
sonic.damaged=1;
}
action_set_relative(0);
