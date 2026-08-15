action_set_relative(1);
var __b__;
__b__ = action_if(able);
if __b__
{
{
option += 1;
if(option>=7)
    option-=7;
__b__ = action_if(up==0);
if __b__
{
{
up += 1;
soundplay(global.sndElevatorSetup);
}
}
}
}
action_set_relative(0);
