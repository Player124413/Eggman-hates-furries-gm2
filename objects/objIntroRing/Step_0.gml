action_set_relative(1);
action_set_vspeed(global.grav/global.meter*global.time);
frictionize();
fixSpeeds();
action_set_relative(0);
