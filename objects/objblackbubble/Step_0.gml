action_set_relative(1);
timer += 1;
var __b__;
__b__ = action_if(timer>60);
if __b__
{
{
action_set_relative(0);
image_index = 1;
action_set_relative(1);
}
}
__b__ = action_if(timer>70);
if __b__
{
action_kill_object();
}
action_set_vspeed(-0.04);
{
action_set_relative(0);
image_xscale = (image_xscale*3+1)/4;
action_set_relative(1);
}
{
action_set_relative(0);
image_yscale = image_xscale;
action_set_relative(1);
}
{
action_set_relative(0);
action_set_friction(0.02);
action_set_relative(1);
}
action_set_relative(0);
