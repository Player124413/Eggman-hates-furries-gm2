radius = 8;
image_speed = 1/3;
var __b__;
__b__ = action_if(global.zeroRingMode && controlbg.lev<15  && !global.tempRingsAllowed && controlbg.lev!=-10);
if __b__
{
action_kill_object();
}
