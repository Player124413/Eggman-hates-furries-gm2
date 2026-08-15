action_set_relative(0);
blink = !blink;
{
action_set_relative(1);
alpha += -global.time/30;
action_set_relative(0);
}
var __b__;
__b__ = action_if(alpha<0);
if __b__
{
action_kill_object();
}
r+=16*global.time;

action_set_relative(0);
