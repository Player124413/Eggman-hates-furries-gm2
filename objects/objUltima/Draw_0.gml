var __b__;
__b__ = action_if(phase==0);
if __b__
{
    {
    x=objRean.x+33;
    y=objRean.y-18;
    r=size;
    gpu_set_blendmode_ext(bm_inv_dest_color,bm_inv_src_color);
    draw_set_color(c_white);
    t=background_get_texture(bginvert)
    draw_primitive_begin_texture(pr_trianglefan,t);
    draw_vertex_texture(x,y,0,0);
    a=0;
    while (a<=360)
        {
        draw_vertex_texture(x+lengthdir_x(r,a),y+lengthdir_y(r,a),0,1)
        a+=20;
        }
    draw_primitive_end();
    draw_set_blend_mode(bm_normal);
    }
}
