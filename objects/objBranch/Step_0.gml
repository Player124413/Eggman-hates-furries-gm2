action_set_relative(1);
var __b__;
__b__ = action_if(alpha>0);
if __b__
{
alpha += -global.time/(30*(0.75+super/4));
}
else
{
action_kill_object();
}
action_set_relative(0);
