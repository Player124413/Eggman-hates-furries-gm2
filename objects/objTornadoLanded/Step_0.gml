action_set_relative(1);
image_index += -image_speed*(1-global.time);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
var __b__;
__b__ = action_if(engine==1);
if __b__
{
{
action_set_relative(0);
image_speed = 2;
action_set_relative(1);
}
}
action_set_relative(0);
