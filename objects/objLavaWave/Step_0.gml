action_set_relative(1);
action_set_hspeed(-image_xscale/50);
x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
image_index-=image_speed*(1-global.time);
action_set_relative(0);
