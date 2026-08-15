draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprite_index,image_index));
draw_vertex_texture_color(x,y,0,0,image_blend,image_alpha);
draw_vertex_texture_color(x+w,y,1,0,image_blend,image_alpha);
draw_vertex_texture_color(x2,y2,0,1,image_blend,image_alpha);
draw_vertex_texture_color(x2+w,y2,1,1,image_blend,image_alpha);
draw_primitive_end();

