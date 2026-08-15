action_set_relative(1);
x += -6;
image_alpha += -1/4;
{
action_set_relative(0);
visible = 1;
action_set_relative(1);
}
var __b__;
__b__ = action_if(image_alpha<=0);
if __b__
{
action_kill_object();
}
action_set_relative(0);
