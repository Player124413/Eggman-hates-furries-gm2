image_xscale=(image_xscale*59+2)/60;
image_yscale=image_xscale;
vspeed-=0.02;
c-=1/60;
if (c<=0)
    instance_destroy();
else
    image_blend=make_color_hsv(0,0,128*c);
