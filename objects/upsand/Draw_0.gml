var __b__;
__b__ = action_if(on && ux!=0);
if __b__
{
if(xi<__view_get( e__VW.XView, 0 )+640 && ydeep<__view_get( e__VW.YView, 0 )+480 && 
            xa>__view_get( e__VW.XView, 0 ) && ya>__view_get( e__VW.YView, 0 ))
    {
    gpu_set_texrepeat(1);
    draw_primitive_begin_texture(pr_trianglestrip,tex);
    draw_vertex_texture_color(x,y,l,b1,c3,1);
    draw_vertex_texture_color(x2,y2,r,b2,c3,1);
    draw_vertex_texture_color(x,ydeep,l,t1,c4,1);
    draw_vertex_texture_color(x2,ydeep,r,t2,c4,1);
    draw_primitive_end();    
    gpu_set_texrepeat(0);
    }
}
