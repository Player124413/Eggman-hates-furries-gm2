sig = -1;
image_single = floor(random(2));
var __b__;
__b__ = action_if_dice(2);
if __b__
{
image_xscale = -1;
}
reps = 0;
global.time = 0.5;
vsp = 0;
i1=instance_create(x-24,y,movingline);
i1.x2=i1.x+48;
i1.y2=y;
i1.pp=id;
report = 0;
special = 0;
