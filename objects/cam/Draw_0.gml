// Atomic explosion effects can leave a non-normal GPU blend/color state.
// Reset it before drawing the 3D cutscene so textures keep their colours.
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);
u=2;
dd=800;
maxx=3200;
d3d_set_projection_ext(x,y,z ,xto,yto,zto ,0,0,1,45,4/3,4,6000);
if (1)
{
setfog(1);



t=background_get_texture(bgground);
d3d_draw_wall(16*32,-16*32,-dd ,-16*32,-16*32,0 ,t,1,1);
d3d_draw_wall(-16*32,16*32,-dd ,16*32,16*32,0 ,t,1,1);

d3d_draw_wall(16*32,16*32,-dd ,16*32,-16*32,0 ,t,1,1);
d3d_draw_wall(-16*32,-16*32,-dd ,-16*32,16*32,0 ,t,1,1);

setfog(0);

t=background_get_texture(bggrass);
d3d_draw_floor(-16*32,-16*32,0 ,16*32,-maxx,0 ,t,u*32*32/32,u*(maxx-16*32)/32);

d3d_draw_floor(-16*32,maxx,0 ,16*32,16*32,0 ,t,u*32*32/32,u*(maxx-16*32)/32);

d3d_draw_floor(16*32,maxx,0 ,maxx,-maxx,0 ,t,u*(maxx-16*32)/32,u*2*maxx/32);

d3d_draw_floor(-maxx,maxx,0 ,-16*32,-maxx,0 ,t,u*(maxx-16*32)/32,u*2*maxx/32);

t=background_get_texture(bgsky);
d3d_draw_cylinder(-3200,-3200,800,3200,3200,0 ,t,3,1 ,0,15);
setfog(1);
}


