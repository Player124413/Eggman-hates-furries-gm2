var __b__;
__b__ = action_if(on && ux!=0);
if __b__
{
var i;

if(xi<__view_get( e__VW.XView, 0 )+640 && yi<__view_get( e__VW.YView, 0 )+480 && 
            xa>__view_get( e__VW.XView, 0 ) && ya+deep>__view_get( e__VW.YView, 0 ))
    {
    if(deep!=0)
        {
        draw_primitive_begin(pr_trianglestrip);
        draw_vertex_color(x,y,c3,1);
        draw_vertex_color(x2,y2,c3,1);
        draw_vertex_color(x,y+deep,c4,1);
        draw_vertex_color(x2,y2+deep,c4,1);
        draw_primitive_end();
        }
    
    a=d/amount;
    
    i=0;
    while(i<amount+1)
        {
        draw_sprite(sboltgnd,0,x+ux*i*a,y+uy*i*a);
        i+=1;
        }
        
    }
}
