x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
var __b__;
__b__ = action_if(y<__view_get( e__VW.YView, 0 )-640);
if __b__
{
action_kill_object();
}
