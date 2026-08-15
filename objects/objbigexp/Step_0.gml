action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index += -image_speed*(1-global.time);
action_set_relative(0);
