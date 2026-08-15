action_set_relative(1);
image_blend=merge_color(c_white,controlbg.emerald_c[index],color);

speed-=global.air*speed*speed*global.time;


image_index += -image_speed*(1-global.time);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(global.grav/global.meter*global.time);
color += -global.time/30;
var __b__;
__b__ = action_if(color<0);
if __b__
{
i=instance_create(x,y,objOrbitEmerald);
i.index=0;
i.active=1;
i.image_blend=c_white;
i.p=sonic;
i.yoff=0;
instance_destroy();

}
action_set_relative(0);
