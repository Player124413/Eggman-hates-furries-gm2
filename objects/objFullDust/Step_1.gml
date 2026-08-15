var __b__;
__b__ = action_if(active==0);
if __b__
{
{
image_alpha = alpha;
image_xscale = alpha;
image_yscale = alpha;
active = 1;
visible = 1;
}
}
else
{
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index-=(1-global.time)*image_speed;

image_alpha=alpha*(1-image_index/image_number);
}
