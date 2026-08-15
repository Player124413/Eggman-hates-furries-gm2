var __b__;
__b__ = action_if(active);
if __b__
{
draw_set_color(c_white);
gpu_set_texrepeat(1);
draw_primitive_begin_texture(pr_trianglestrip,tex);
draw_vertex_texture(x1,y1,0,0);
draw_vertex_texture(x2,y2,0,1);
draw_vertex_texture(x3,y3,repeats,0);
draw_vertex_texture(x4,y4,repeats,1);
draw_primitive_end();

gpu_set_texrepeat(0);
}
