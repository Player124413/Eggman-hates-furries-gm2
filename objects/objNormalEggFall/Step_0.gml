action_set_relative(1);
speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index+=-image_speed*(1-global.time);
action_set_vspeed(0.4*global.time);
var __b__;
__b__ = action_if(y>__view_get( e__VW.YView, 0 )+1024 || y<__view_get( e__VW.YView, 0 )-1024);
if __b__
{
action_kill_object();
}
image_angle += rotation;
action_set_relative(0);
