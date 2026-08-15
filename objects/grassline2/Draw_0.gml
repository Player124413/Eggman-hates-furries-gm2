var __b__;
__b__ = action_if(on);
if __b__
{
if(xi<__view_get( e__VW.XView, 0 )+648 && min(yi,ydeep)<__view_get( e__VW.YView, 0 )+488 && 
            xa>__view_get( e__VW.XView, 0 )-8 && max(ydeep,ya)>__view_get( e__VW.YView, 0 )-8)
    {    
    a=(d+4)/amount;
    
    if(ydeep!=-1)
        {
        draw_primitive_begin(pr_trianglestrip);
        draw_vertex_color(x,y,c3,1);
        draw_vertex_color(x2,y2,c3,1);
        draw_vertex_color(x,ydeep,c4,1);
        draw_vertex_color(x2,ydeep,c4,1);
        draw_primitive_end();
        }
    
    ij=0;
    while(ij<amount)
        {
        if(ij mod 2 == 0) k=c1; else k=c2;
        draw_sprite_ext(sprite_index,ij mod 5,x+ux*ij*a,y+uy*ij*a,1,1,0,k,1);
        ij+=1;
        }
        
    }
}
