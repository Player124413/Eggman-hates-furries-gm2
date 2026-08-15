image_speed = 0.2;
image_blend = c_black;
c = 0;
phase = 0;
image_xscale = 1.3;
image_yscale = image_xscale;
action_set_vspeed(1);
image_index = 1;
timer = 0;
cTimer=0;
soundvolume(global.sndC,1-power(1-cTimer,2));
soundloop(global.sndC);

