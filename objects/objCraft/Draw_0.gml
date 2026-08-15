t=background_get_texture(bgCraft);
d3d_transform_add_rotation_x(xrot);
d3d_transform_add_rotation_y(yrot);
d3d_transform_add_rotation_z(zrot);
d3d_transform_add_scaling(r,r,r);
d3d_transform_add_translation(x,y,z);
d3d_model_draw(modelBall,0,0,0,t);


d3d_set_culling(0);
t=background_get_texture(bgRudder);
d3d_draw_wall(-5/3,0,0 ,0,0,5/3 ,t,1,-1);
t=background_get_texture(bgSpike);
d3d_draw_wall(2/3,0,0 ,3/2,0,2/8 ,t,1,-1);
t=background_get_texture(bgEye);
d3d_draw_wall(1,-1/3,-2/3 ,1,1/3,0 ,t,1,-1);

t=background_get_texture(bgWing);
d3d_model_draw(modelWing,0,0,0,t);

if (cam.phase==4 || (cam.phase==6 && cam.subphs==0))
    {if (cam.timer<30 && cam.phase==4)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_blue);
    d3d_ball(-0.5,1.6,0.2,1/3);
    draw_set_color(make_color_rgb(255,128,0));
    d3d_ball(-0.5,1.2,0.2,1/3);}


d3d_set_culling(1);
t=background_get_texture(bgGunPlating);
d3d_draw_block(-1/5,-1/4,-1-1/6 ,1*2/3,1/4,-1+1/3 ,t,1,1)
d3d_transform_set_identity();
d3d_transform_add_rotation_y(-90);
d3d_transform_add_rotation_x(xrot);
d3d_transform_add_rotation_y(yrot);
d3d_transform_add_rotation_z(zrot);
d3d_transform_add_translation(x,y,z);


t=background_get_texture(bgEnginePlating);
d3d_draw_cylinder(0,r,-r/2 ,r/2,r+r/2,r/4 ,t,1,1 ,1,5);
d3d_draw_cone(0,r,r/4 ,r/2,r+r/2,r/2 ,t,1,1 ,1,5);

d3d_draw_cylinder(r/2,-r,-r/2 ,0,-r-r/2,r/4 ,t,1,1 ,1,5);
d3d_draw_cone(r/2,-r,r/4 ,0,-r-r/2,r/2 ,t,1,1 ,1,5);

if(blink)
    {
    draw_set_blend_mode(bm_add);
    d3d_set_culling(0);
    t=sprite_get_texture(sprMiniGunFlame,0);
    d3d_draw_wall(0,r,-r/2 ,r/2,r+r/2,-r*3 ,t,1,1)
    d3d_draw_wall(0,r+r/2,-r/2 ,r/2,r,-r*3 ,t,1,1)
    d3d_set_culling(1);
    draw_set_blend_mode(bm_normal);

    }
t=background_get_texture(bgPlating);
d3d_draw_cylinder(0,-r/3,r/2 ,2*r/3,r/3,r ,t,1,2,0,12);

d3d_transform_set_identity();
d3d_transform_add_rotation_z(gunrot);
d3d_transform_add_rotation_y(-90);
d3d_transform_add_rotation_x(xrot);
d3d_transform_add_rotation_y(yrot);
d3d_transform_add_rotation_z(zrot);
d3d_transform_add_translation(x-gunblink/2,y,z-r);
t=background_get_texture(bgGunner);
if(gunblink)
    t=background_get_texture(bgGunnerLight);
d3d_draw_cylinder(-r/6,-r/6,r*2/3 ,+r/6,r/6,2*r ,t,1,-1,1,8);
if(gunblink)
    {
    draw_set_blend_mode(bm_add);
    d3d_set_culling(0);
    t=sprite_get_texture(sprMiniGunFlame,0);
    d3d_draw_wall(r/6,-r/6,2*r ,-r/6,r/6,3*r ,t,1,1)
    d3d_draw_wall(-r/6,-r/6,2*r ,+r/6,r/6,3*r ,t,1,1)
    d3d_set_culling(1);
    draw_set_blend_mode(bm_normal);
    }

d3d_transform_set_identity();
if(engine)
    blink=!blink;
else
    blink=0;
