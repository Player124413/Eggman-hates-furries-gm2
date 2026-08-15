action_set_relative(1);
action_set_vspeed(0.12*global.time);
var __b__;
__b__ = action_if(y>ystart);
if __b__
{
action_kill_object();
}
speed-=global.air*speed*speed*global.time;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index-=image_speed*(1-global.time);
action_set_relative(0);
