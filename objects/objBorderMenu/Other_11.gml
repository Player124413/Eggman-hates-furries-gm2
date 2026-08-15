action_set_relative(1);
var __b__;
__b__ = action_if(choice>0);
if __b__
{
{
choice += -1;
soundplay(global.sndType);
if (choice<scroll)
    scroll-=1;
}
}
else
{
{
{
action_set_relative(0);
choice = items-1;
action_set_relative(1);
}
soundplay(global.sndType);
scroll=max(0,items-15);
}
}
__b__ = action_if(function==2);
if __b__
{
event_user(3);
}
action_set_relative(0);
