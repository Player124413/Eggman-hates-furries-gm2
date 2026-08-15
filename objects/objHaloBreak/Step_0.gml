image_xscale=(4+image_xscale*1)/(1+1/8);
image_alpha-=1/80;
if (image_alpha<=0)
    instance_destroy();

