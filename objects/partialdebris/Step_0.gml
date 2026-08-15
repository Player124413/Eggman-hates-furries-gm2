action_set_relative(1);
var __b__;
__b__ = action_if(fall);
if __b__
{
action_set_vspeed(0.3*global.time);
}
__b__ = action_if(timer>0);
if __b__
{
timer-=global.time;
if (timer<=0)
    {timer=0;
    fall=1;}
}
__b__ = action_if(y>__view_get( e__VW.YView, 0 )+640);
if __b__
{
action_kill_object();
}
action_set_relative(0);
