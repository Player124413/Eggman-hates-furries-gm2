
draw_set_alpha(min(0.2,timer/200));
draw_set_blend_mode(bm_add);
d3d_transform_add_rotation_y(-point_direction(0,z,point_distance(x,y,cam.x,cam.y),cam.z)+90);
d3d_transform_add_rotation_z(point_direction(x,y,cam.x,cam.y));
d3d_transform_add_translation(x,y,z);
d3d_set_culling(0);
setfog(0);

draw_circle_color(0,0,48+8*sin(timer/24)+(0.7+0.3*sin(timer/24))*480*power(cos(timer*pi/1600),2),c_yellow,c_black,0);

setfog(1);
d3d_transform_set_identity();
draw_set_blend_mode(bm_normal);
d3d_set_culling(1);
draw_set_alpha(1);
