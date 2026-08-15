action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(0.3*global.time);
speed += -global.time;
var __b__;
__b__ = action_if(speed<0);
if __b__
{
{
action_set_relative(0);
speed = 0;
action_set_relative(1);
}
}
c += -global.time/16;
__b__ = action_if(c<0);
if __b__
{
action_kill_object();
}
action_set_relative(0);
