draw_set_color(c_white);
d3d_transform_add_translation(x,y,z);
if(z<0)
    {t=background_get_texture(bgground);
    d3d_model_draw(cam.modelBlock,0,0,0,t);}
if (immune)
    setfog(0);

t=background_get_texture(bggrass);
d3d_model_draw(cam.modelFloor,0,0,0,t);
d3d_transform_set_identity();
if (immune)
    setfog(1);
