action_set_relative(1);
var __b__;
__b__ = action_if(choice<items-1);
if __b__
{
{
choice += 1;
soundplay(global.sndType);
if (choice>=scroll+15)
    scroll+=1;
}
}
else
{
{
{
action_set_relative(0);
choice = 0;
action_set_relative(1);
}
soundplay(global.sndType);
scroll=0;
}
}
__b__ = action_if(menu_function==2);
if __b__
{
event_user(3);
}
action_set_relative(0);
