action_set_relative(1);
action_color(0);
action_draw_rectangle(-320, -256, 352+320, 0, 0);
action_draw_rectangle(352, 0, 352+320, 128, 0);
var __b__;
__b__ = action_if(instance_exists(finalgenerator));
if __b__
{
__b__ = action_if(finalgenerator.phase>13);
if __b__
{
action_draw_rectangle(352+32, 128, 352+320, 256, 0);
}
}
action_draw_rectangle(-320, 0, 0, 128, 0);
__b__ = action_if(instance_exists(finalgenerator));
if __b__
{
__b__ = action_if(finalgenerator.phase>13);
if __b__
{
action_draw_rectangle(-320, 128, -32, 256, 0);
}
}
action_draw_rectangle(-320, 256, 352+320, 512, 0);
action_set_relative(0);
