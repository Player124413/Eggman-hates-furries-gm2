var __b__;
__b__ = action_if(able);
if __b__
{
{
__b__ = action_if(delayUp==-1);
if __b__
{
event_user(1);
delayUp=15;
}
__b__ = action_if(delayUp==0);
if __b__
{
event_user(1);
delayUp=1;
}
action_set_alarm(2, 8);
}
}
