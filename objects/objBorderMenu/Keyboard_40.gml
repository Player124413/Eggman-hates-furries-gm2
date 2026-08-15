var __b__;
__b__ = action_if(able);
if __b__
{
{
__b__ = action_if(delayDown==-1);
if __b__
{
event_user(0);
delayDown=15;
}
__b__ = action_if(delayDown==0);
if __b__
{
event_user(0);
delayDown=1;
}
action_set_alarm(2, 7);
}
}
