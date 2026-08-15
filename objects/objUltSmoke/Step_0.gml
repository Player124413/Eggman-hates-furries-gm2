y-=global.time;
c-=global.time*6;
if (c<=0)
    instance_destroy();
image_blend=make_color_rgb(c,c,c);

image_angle+=global.time;

image_xscale=approach(image_xscale,5,1,1);
image_yscale=image_xscale;
