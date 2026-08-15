action_set_relative(1);
z += zspeed;
var __b__;
__b__ = action_if(falling);
if __b__
{
zspeed += -0.05;
}
action_set_relative(0);
