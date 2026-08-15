var __b__;
__b__ = action_if(on && ux!=0);
if __b__
{
if(xi<__view_get( e__VW.XView, 0 )+640 && yi<__view_get( e__VW.YView, 0 )+488 && 
            xa>__view_get( e__VW.XView, 0 ) && ya+deep>__view_get( e__VW.YView, 0 ))
    {
    gpu_set_texrepeat(1);
    draw_primitive_begin_texture(pr_trianglestrip,tex);
    draw_vertex_texture_color(x,y,l,t1,c3,1);
    draw_vertex_texture_color(x2,y2,r,t2,c3,1);
    draw_vertex_texture_color(x,y+deep,l,b1,c4,1);
    draw_vertex_texture_color(x2,y2+deep,r,b2,c4,1);
    draw_primitive_end();
    gpu_set_texrepeat(0);
    
    draw_set_color(c_black);
    draw_set_alpha(0.1);
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex(x,y);
    draw_vertex(x2,y2);
    draw_vertex(x,y+32);
    draw_vertex(x2,y2+32);
    draw_primitive_end();
    draw_set_alpha(0.5);
    if(LH)
        draw_line(x,y,x,y+deep);
    if(RH)
        draw_line(x2-1,y2,x2-1,y2+deep);
    draw_set_alpha(1);
    
    a=(d+4)/amount;
    
    j=0.42;
    while(j<amount)
        {
        draw_sprite_ext(sprSandTop,j mod 5,x+ux*j*a,y+uy*j*a,1,1,dir*0.8,c_white,1);
        j+=1;
        }
        
    }
}
