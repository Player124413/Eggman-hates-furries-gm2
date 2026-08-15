gpu_set_texrepeat(1);
draw_primitive_begin_texture(pr_trianglestrip,t);
draw_vertex_texture_color(x,y,0,0,c1,1);
draw_vertex_texture_color(x2,y2,hrepeat,0,c2,1);
draw_vertex_texture_color(x3,y3,0,1,c3,1);
draw_vertex_texture_color(x4,y4,hrepeat,1,c4,1);
draw_primitive_end();
gpu_set_texrepeat(0);
