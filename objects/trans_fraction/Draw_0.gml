var __b__;
__b__ = action_if(sprite_index!=-1);
if __b__
{
{
gpu_set_texrepeat(1);
draw_primitive_begin_texture(pr_trianglestrip,tex);
draw_vertex_texture_color(x-8,y,l,t,ct,1);
draw_vertex_texture_color(x+8,y+yskew,r,t,ct,1);
draw_vertex_texture_color(x-8,y+16,l,b,cb,1);
draw_vertex_texture_color(x+8,y+16+yskew,r,b,cb,1);
draw_primitive_end();
gpu_set_texrepeat(0);
drawsprite();
}
}
else
{
gpu_set_texrepeat(1);
draw_primitive_begin_texture(pr_trianglestrip,tex);
draw_vertex_texture_color(x,y,l,t,ct,1);
draw_vertex_texture_color(x+16,y+yskew,r,t,ct,1);
draw_vertex_texture_color(x,y+16,l,b,cb,1);
draw_vertex_texture_color(x+16,y+16+yskew,r,b,cb,1);
draw_primitive_end();
gpu_set_texrepeat(0);
}
