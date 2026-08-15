action_set_relative(0);
radius = (radius*2+global.time*maxradius)/(2+global.time);
var __b__;
__b__ = action_if(alpha>0);
if __b__
{
{
action_set_relative(1);
alpha += -global.time/30;
action_set_relative(0);
}
}
else
{
alpha=0;
if (timer==0)
    soundplay(global.sndGunstar2);
timer+=global.time;
if (timer>6)
    game_over();
}
action_set_relative(0);
