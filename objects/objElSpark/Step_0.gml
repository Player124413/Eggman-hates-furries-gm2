action_set_relative(1);
speed += -0.2;
var __b__;
__b__ = action_if(speed<=0);
if __b__
{
action_kill_object();
}
action_set_relative(0);
