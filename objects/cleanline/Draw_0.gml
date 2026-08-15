var __b__;
__b__ = action_if(on);
if __b__
{

if(xi<__view_get( e__VW.XView, 0 )+648 && min(yi,ydeep)<__view_get( e__VW.YView, 0 )+488 && 
            xa>__view_get( e__VW.XView, 0 )-8 && max(ydeep,ya)>__view_get( e__VW.YView, 0 )-8)
    {
    if(ydeep!=-1)
        {
        draw_set_color(c_black);
        draw_primitive_begin(pr_trianglestrip);
        draw_vertex(x,y);
        draw_vertex(x2,y2);
        draw_vertex(x,ydeep);
        draw_vertex(x2,ydeep);
        draw_primitive_end();
        }
    a=d/amount;
    
    i=0;
    while(i<amount)
        {
        draw_sprite_ext(scleangnd,i mod 4,x+ux*i*a,y+uy*i*a,1,1,p,image_blend,image_alpha);
        i+=1;
        }
        
    }
}
