action_set_relative(1);
image_index += -image_speed*(1-global.time);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_relative(0);
