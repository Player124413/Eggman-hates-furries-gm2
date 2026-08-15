action_set_relative(1);
timer += global.time;
var __b__;
__b__ = action_if(timer>duration);
if __b__
{
action_kill_object();
}
action_set_relative(0);
