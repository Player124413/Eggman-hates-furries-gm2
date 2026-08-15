var __b__;
__b__ = action_if(on);
if __b__
{

if(yi<__view_get( e__VW.YView, 0 )+480 && xi-abs(deep)<__view_get( e__VW.XView, 0 )+640 && ya>__view_get( e__VW.YView, 0 ) && xa+abs(deep)>__view_get( e__VW.XView, 0 ))
    {
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_color(x,y,c3,1);
    draw_vertex_color(x2,y2,c3,1);
    draw_vertex_color(x+deep,y,c4,1);
    draw_vertex_color(x2+deep,y2,c4,1);
    draw_primitive_end();
    
    a=d/amount;
    
    i=0;
    while(i<amount+1)
        {
        draw_sprite_ext(sboltgnd,i mod 4,x+ux*i*a,y+uy*i*a,1,1,p,image_blend,image_alpha);
        i+=1;
        }
        
    }
}
