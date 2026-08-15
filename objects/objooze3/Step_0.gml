action_set_relative(1);
image_index += -image_speed*(1-global.time);
timer += global.time;
{
action_set_relative(0);
x = xstart-objdoll.yscale*timer/2;
action_set_relative(1);
}
{
action_set_relative(0);
image_yscale = sqrt(sin(pi*timer/40));
action_set_relative(1);
}
var __b__;
__b__ = action_if(timer>=40);
if __b__
{
action_kill_object();
}
action_set_relative(0);
