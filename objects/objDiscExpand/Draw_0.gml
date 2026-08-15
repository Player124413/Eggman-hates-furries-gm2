d3d_transform_add_translation(x,y,z);
d3d_set_culling(0);
draw_set_color(c_white);
draw_set_alpha(alpha);
draw_circle(x,y,r,0);
d3d_set_culling(1);
d3d_transform_set_identity();
