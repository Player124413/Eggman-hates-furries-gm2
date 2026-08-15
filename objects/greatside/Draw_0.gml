var __b__;
__b__ = action_if(on);
if __b__
{
    {
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_color(x,y,c3,1);
    draw_vertex_color(x,y2,c3,1);
    draw_vertex_color(x2,y,c4,1);
    draw_vertex_color(x2,y2,c4,1);
    draw_primitive_end();    
    }
}
