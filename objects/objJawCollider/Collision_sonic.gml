action_set_relative(1);
timer += global.time;
{
action_set_relative(0);
action_set_alarm(2, 0);
action_set_relative(1);
}
var __b__;
__b__ = action_if(timer>2 && chopper.invulnerable==0);
if __b__
{
sonic.damaged=1;
sonic.damagex=x;
sonic.damagey=y;
}
action_set_relative(0);
