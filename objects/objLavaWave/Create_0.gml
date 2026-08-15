var __b__;
__b__ = action_if(x>320);
if __b__
{
image_xscale = -1;
}
image_xscale = image_xscale*(1+random(2));
image_yscale = random(1);
action_set_hspeed(image_xscale*0.66);
image_speed = 0.4;
