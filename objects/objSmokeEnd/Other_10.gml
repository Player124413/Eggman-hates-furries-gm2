image_angle+=rot;
alpha=alpha*49/50;
if (alpha<=0.05)
    instance_destroy();
image_xscale=(image_xscale*49+3)/50;
image_yscale=image_xscale;
