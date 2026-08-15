base=doom.image_angle;
while (base<0)
    base+=360;
while (base>=360)
    base-=360;
angle = (base mod 90) -30-random(15)-doom.image_angle;
image_single = random(image_number);
var __b__;
__b__ = action_if_dice(2);
if __b__
{
image_yscale = -1;
}
c=-(base div 90);
if (c<0)
    c+=4;
p = doom.outer[c];
