action_set_relative(0);
r = (r*3+maxr)/4;
{
action_set_relative(1);
alpha += -1/60;
action_set_relative(0);
}
var __b__;
__b__ = action_if(alpha<=0);
if __b__
{
action_kill_object();
}
action_set_relative(0);
