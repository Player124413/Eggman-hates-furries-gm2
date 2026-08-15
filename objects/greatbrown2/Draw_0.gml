gpu_set_texrepeat(1);
draw_primitive_begin_texture(pr_trianglestrip,tex);
draw_vertex_texture_color(x,y,x/64,y/64,c3,1);
draw_vertex_texture_color(x2,y,x2/64,y/64,c3,1);
draw_vertex_texture_color(x,y2,x/64,y2/64,c4,1);
draw_vertex_texture_color(x2,y2,x2/64,y2/64,c4,1);
draw_primitive_end();
gpu_set_texrepeat(0);
