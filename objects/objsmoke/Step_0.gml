action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(-0.1*global.time);
image_xscale=image_xscale*(1-global.time)+global.time*(image_xscale*29+1)/30;
image_yscale=image_xscale;

image_angle+=lol*global.time;

image_alpha-=(1*global.time)/45;
if (image_alpha<=0)
    instance_destroy();
depth += -1;
action_set_relative(0);
