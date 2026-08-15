var __b__;
__b__ = action_if(sprite_index!=-1);
if __b__
{
{
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x-8,y,ct,1);
draw_vertex_color(x+8,y+yskew,ct,1);
draw_vertex_color(x-8,y+16,cb,1);
draw_vertex_color(x+8,y+16+yskew,cb,1);
draw_primitive_end();
drawsprite();
}
}
else
{
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x,y,ct,1);
draw_vertex_color(x+16,y+yskew,ct,1);
draw_vertex_color(x,y+16,cb,1);
draw_vertex_color(x+16,y+16+yskew,cb,1);
draw_primitive_end();
}
