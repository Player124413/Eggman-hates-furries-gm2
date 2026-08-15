action_set_relative(1);
timer += -global.time;
repeat( 2/global.time )action_create_object(objsmoke, 0, 0);
var __b__;
__b__ = action_if(timer<0);
if __b__
{
action_kill_object();
}
action_set_relative(0);
