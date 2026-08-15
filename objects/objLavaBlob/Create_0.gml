image_speed = 0.4;
var __b__;
__b__ = action_if_dice(3);
if __b__
{
{
action_sprite_set(slavaSpark, 0, 1);
image_speed = 0.33;
}
}
image_xscale = 0.5+random(0.5);
image_yscale = image_xscale;
__b__ = action_if_dice(2);
if __b__
{
image_xscale = -image_xscale;
}
