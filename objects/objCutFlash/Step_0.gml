image_xscale=(global.time*32+image_xscale*1)/(1+global.time);
image_alpha-=global.time/10;
if (image_alpha<=0)
    instance_destroy();

