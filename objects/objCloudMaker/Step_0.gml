action_set_relative(1);
event_user(1)
timer += -global.time;
var __b__;
__b__ = action_if(timer<0);
if __b__
{
{
{
action_set_relative(0);
action_create_object(objBolt, x+(-1+random(2))*hscale, y);
action_set_relative(1);
}
{
action_set_relative(0);
timer = 30+random(150);
action_set_relative(1);
}
}
}
__b__ = action_if(random(8)<global.time);
if __b__
{
event_user(0);
}
action_set_relative(0);
